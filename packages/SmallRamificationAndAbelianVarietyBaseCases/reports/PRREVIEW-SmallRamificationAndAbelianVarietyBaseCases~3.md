# Review of SmallRamificationAndAbelianVarietyBaseCases (pull request #970 at 92d13bb)

**Verdict:** needs changes

Incremental re-review of the 54 lines changed since `b7abeaa`, plus the pull request's title and description. Two P3 findings; no P1 or P2.

## R01 (P3) — The gate fails: `[Fintype F]` beside `[Field F]`

**Location:** `TauCetiRoadmap/SmallRamificationAndAbelianVarietyBaseCases/Suggested.lean:125`, “`variable {F : Type*} [Field F] [Fintype F] [TopologicalSpace F] [DiscreteTopology F]`”.

**Claim:** The residual coefficient field is declared finite in the form the gate's `statement-hygiene` rule accepts.

**Witness:** The worker's gate at `92d13bb`: `statement-hygiene=1 … FAIL`, “line 125: P3 `[Fintype F]` beside `[Field F]` (a `variable` command in force for def `IsUnramifiedAt`)”. Every other gate check is 0.

**Repair:** Replace `[Fintype F]` by `[Finite F]` on line 125; nothing else changes (no statement uses `Fintype.card`). Tested on a scratch copy: it elaborates with the same 13 `sorry` warnings, and `tate_no_levelOne_char_two`, `serre_no_levelOne_char_three` and `not_isLevelOneResidual_of_mem_two_three_five_seven` then carry `[Field F] [Finite F] [TopologicalSpace F] [DiscreteTopology F]`.

## R02 (P3) — The description states Fontaine's theorem over ℚ only

**Location:** Pull request description, summary block `roadmap-summary`: “Finite flat group schemes then give Fontaine's theorem that abelian varieties over ℚ with good reduction everywhere have dimension zero”.

**Claim:** The roadmap's Fontaine headline is the statement over `ℚ`, reached by the point-count route alone.

**Witness:** `README.md:1301` “### 3.6 Fontaine's theorem over ℚ(i), ℚ(√−3) and ℚ(√5)”; `Suggested.lean:209–211`, `dim_eq_zero_of_goodReduction_everywhere` over `K` with `discr K = 1 ∨ -4 ∨ -3 ∨ 5`. `README.md:1307`: the quadratic cases use Raynaud's uniqueness and Fontaine's different bound first.

**Repair:** In the summary write “… give Fontaine's theorem that abelian varieties with good reduction everywhere over ℚ, ℚ(i), ℚ(√−3) and ℚ(√5) have dimension zero …”, and in “Approach and generality” add after the point-count sentence: “Over the three quadratic fields the finite flat p-groups are first classified by Raynaud's uniqueness and Fontaine's different bound; the same point count concludes.”

## Previous findings

- R01 — repaired: `README.md:131` “`LFunctions`, Layer 3 | Meromorphic extension, completed functional equation and poles of Dedekind zeta”; lines 235–236 and 269 agree; no `§2.7` or `finite-order-hecke-functional-equation` remains. LFunctions is on main (`TauCetiRoadmap/LFunctions/README.md:730, 785–793`).
- R02 — repaired: the twelve identifier clauses are gone (`README.md:1184` “The dyadic Ext vanishing specializes…”, `:1993` “The shared raw compatible-system carrier is a target here”, `:2122` “Define marked `GL₂(K)`-type data”); a scan for snake-case or camel-case words outside code spans finds none.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
| --- | --- | --- | --- |
| §1.0 input, LFunctions Layer 3 (changed citation) | `K = ℚ`; `K = ℚ(i)` | Supplier Checks: residue of `completedDedekindZeta` at 1 is `1` for ℚ; `2^(r₁+r₂)hR/w = 2·1·1/4 = 1/2` for ℚ(i); `Λ_K(1−s) = Λ_K(s)` stated at its line 792 | Supplier states continuation, both poles, functional equation |
| §3.3 dyadic Ext vanishing (changed sentence) | S-unit classes `−1, 2, −2` over `ℚ₂` | `−1 ≡ 7 (mod 8)`, not a square; `2`, `−2` have odd valuation; restriction kernel `0` | Citation of R07.G5 `admissible-global-ext-vanishing` resolves (supplier `README.md:2926`, `2931`) |
| §5.1 isogeny transport (changed bullet) | `f = [2]`, `g = [1]`, `n = 2` | `(1/2) ⊗ (f x g) = (1/2)·2x = x` | Formula unchanged by the rewording |
| §5.3 even-degree branch (reworded) | `F = ℚ(√5)`, `p = 5`; `F′` of even and of odd degree | `[F(ζ₅):F] = 2 ≠ 4`; ramification set of B: `d′ − 1` real places plus one `w | v` when `d′` even: even count either way | Agrees with §5.0b (`README.md:1855–1868`) and §5.0c (`:1944–1948`) |
| §5.3 rational application (reworded) | `F = ℚ` | `[F:ℚ] = 1` odd; `[ℚ(ζ₅):ℚ] = 4` | (A2) automatic, no finite-place hypothesis |
| R01: `tate_no_levelOne_char_two` | head; scratch copy with `[Finite F]` | head: `[Field F] [Fintype F] … [CharP F 2]`; copy: `[Field F] [Finite F] … [CharP F 2]`, same conclusion | Repair elaborates |
| R02: `dim_eq_zero_of_goodReduction_everywhere` | discriminants `1, −4, −3, 5` | ℚ, ℚ(i), ℚ(√−3), ℚ(√5); description names ℚ only | Description narrower than the head |

The diff changes no statement; the rows for untouched statements stand as in the previous review, of `b7abeaa`.

- Gate at `92d13bb`: FAIL on `statement-hygiene=1` (R01); all other checks 0, `build=0`, `outside-folder=0`, `stray-files=0`.
- Dependency check: `depcheck: 247 roadmaps, 2245 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` gives 13 `declaration uses sorry` warnings (lines 61, 72, 98, 143, 148, 153, 188, 209, 233, 236, 239, 242, 245) and nothing else. `Suggested.lean` is unchanged since `b7abeaa`, so the signature comparison, the headline list and the one-tactic probe stand as there.
- Source locators checked against the text: 2 (Snowden, cache `b0c0008a` lines 1525–1528, Proposition 9.4.1, p. 29; lines 1584–1596, its proof, p. 30). The seeded targets 3.3, 5.0, 5.1 and 5.3 fall in changed passages; their locators are unchanged and stand as verified at `b7abeaa`.
- Cross-roadmap citations resolved for the changed passages: 4 (LFunctions Layers 3 and 5 on main; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.G5 with both names at its open head). The three resolver leads (R15.4, `TateModule.lambdaTateModule`, `VanishingCycles.curveEndomorphismTrace`) are supplier targets found at ArithmeticGaloisRepresentations `README.md:4313` and InverseGaloisAndArithmeticFundamentalGroups `README.md:358`; R15.4 is that roadmap's Layer 4 by its own convention.
- Pull request text: every other sentence of the title and description agrees with the head (six layers; consumers R26.1, R26.5, R33.4 at `README.md:13`; the Snowden–Fontaine route at `:2427`; no table used as an oracle at `:657`; nine open suppliers, all cited; no change outside the folder).
- Overlap check: read ClassicalSerreModularity, PotentialModularityAndCompatibleSystems, EllipticCurveModularityPartIIGL2TypeAbelianVarieties, FiniteFlatGroupsAndIntegralPadicHodgeTheory, GL2ModularityLifting, ClassicalArithmeticCompletion, PadicExtensionFamilies, NumberFieldArithmetic; the raw compatible-system carrier (§5.0d) and marked `GL₂`-type data (§5.1) are owned here and imported by section by the first five; all-prime Ext vanishing is owned by FiniteFlatGroupsAndIntegralPadicHodgeTheory; the Galois mean slope is owned by PadicExtensionFamilies §3.3.
- Remark (untouched text): PadicExtensionFamilies, on main since the previous review, defines the Galois mean slope of the Galois closure (its §3.3); §1.1's `δ(E)` is taken on E itself and equals it only for Galois E. §1.1 does not name that section.
- Remark (untouched text): `README.md:1867` calls the local component at an indecomposable place “special”; §5.0c (`:1956`) has “special or supercuspidal”, which covers the irreducible case.
- Source independence: 2 passages compared with 1 source (changed passages only), none shared (longest common run 3 words, forced terms); arrangement not compared again, since the diff adds, removes and reorders no layer.

## Not verifiable

- none in the changed passages; the four items of the previous report (Odlyzko's displayed formulas, Bosch–Lütkebohmert–Raynaud and Neukirch–Schmidt–Wingberg, Carayol, Dieulefait–Pacetti Definition 1.10) concern untouched text and stand.

## Source issues

- none

## For the human reviewers

- none
