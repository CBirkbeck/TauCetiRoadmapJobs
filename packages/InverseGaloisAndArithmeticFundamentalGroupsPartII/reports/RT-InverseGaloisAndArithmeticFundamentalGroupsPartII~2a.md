<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13130#issuecomment-6849459064 -->
Red team round 2 pass a (claude) of ec90633

Verdict: needs_changes

1. **F01** (P2) the plane/disc comparison of configuration spaces is ReductiveGroups Layer 11A's; the README says it is not and plans it again

   **Location.** `README.md:290-291`: "The comparison with configurations in the open disc is not
   part of it; §5.1 transports it along `Homeomorph.unitBall`." Also `README.md:82-83` (Scope),
   `:179-180` (Mathlib contract), `:1583-1586` (§5.1 sketch), `:1589` and `:1690` (*Needs:* and
   *Dependencies*).

   **Claim.** ReductiveGroups Layer 11A has only plane configurations, so this roadmap owns the
   homeomorphisms `PConf_n(ℂ) ≅ PConf_n(int D)` and `Conf_n(ℂ) ≅ Conf_n(int D)`.

   **Witness.** `TauCetiRoadmap/ReductiveGroups/README.md:5799-5804` on main: "Construct the ordered
   and unordered configuration spaces of the open unit disc … The homeomorphism `z↦z/sqrt(1+|z|²)`
   … induces `S_n`-equivariant homeomorphisms"; also `:51-53`. It is the same map as
   `Homeomorph.unitBall`.

   **Repair.**

   - `README.md:82-83`, replace the last sentence of the bullet by: "The configuration spaces of the
     open unit disc and their `S_n`-equivariant homeomorphisms with the plane ones, induced by
     `z ↦ z/√(1 + |z|²)`, are ReductiveGroups Layer 11A's as well."
   - `README.md:287-291`, replace the last sentence of the Layer 11A bullet by: "Layer 11A also
     constructs `PConf_n` and `Conf_n` of the open unit disc and the `S_n`-equivariant homeomorphisms
     with the plane ones induced by `z ↦ z/√(1 + |z|²)`, inverse `w ↦ w/√(1 − |w|²)`, with the base
     configuration transported to its image `z_j = j/√(1 + j²)`, `j = 0, …, n − 1`."
   - `README.md:1583-1586`, replace "Applying `Homeomorph.unitBall` of `ℂ` coordinatewise preserves
     distinctness of coordinates and commutes with permutations, so it induces homeomorphisms" by
     "By ReductiveGroups Layer 11A the homeomorphism `z ↦ z/√(1 + |z|²)` of `ℂ` onto the open unit
     disc induces `S_n`-equivariant homeomorphisms".
   - Delete the `Homeomorph.unitBall` bullet of *From Mathlib* and the words "Mathlib
     `Homeomorph.unitBall`" from the *Needs:* of §5.1 and from the *Dependencies* of Layer 5.
   - §5.1, fifth Check: keep the values and begin it "The supplier's transport `z ↦ z/√(1 + |z|²)`
     sends …".

   Tested on the instance: `1 ↦ 1/√2`, `2 ↦ 2/√5`, `(0, 1) ↦ (0, 1/√2)`, the values of the Check;
   `w = 1/√2` gives `w/√(1 − 1/2) = 1`.

2. **F02** (P3) the Layer 2 base configuration is indexed one place off from §5.1 and from the supplier

   **Location.** `README.md:1038`: "the base configuration `P_j = j/√(1 + j²)` of §5.1", for points
   numbered `P_1, …, P_n`.

   **Claim.** The points `P_1, …, P_n` are the images of the base configuration used in §5.1.

   **Witness.** `README.md:1608-1609` (§5.1 Check): the base configuration of `Conf_2` goes to
   `(0, 1/√2)`; the formula of line 1038 gives `(P_1, P_2) = (1/√2, 2/√5)`. ReductiveGroups Layer 11A
   (`README.md:5733-5736` there) has base points `z_i = i`, `i = 0, …, n − 1`.

   **Repair.** Replace by: "the base configuration `P_j = (j − 1)/√(1 + (j − 1)²)`, `j = 1, …, n`,
   the image of the base configuration `z_i = i`, `i = 0, …, n − 1`, of ReductiveGroups Layer 11A
   (§5.1)". Tested: `n = 2` gives `(0, 1/√2)`; the classical `σ_i` exchanges `P_i, P_(i+1)`, the
   images of `z_(i−1), z_i`, which the native `TauCeti.BraidGroup.sigma (i − 1)` exchanges.

3. **F03** (P3) the general gluing is called coherently associative, and its braid homomorphism is not cited

   **Location.** `README.md:530-532`: "the general gluing `Hur_m × Hur_n → Hur_(m+n)` from the block
   inclusion `B_m × B_n → B_(m+n)` and concatenation is associative and unital up to coherent
   homotopy".

   **Claim.** The gluing is coherently homotopy associative, and `B_m × B_n → B_(m+n)` is available.

   **Witness.** EVW16 lines 516–517 say only associative up to homotopy (an H-space); no target or
   supplier proves coherence, and only homology is used (§0.6, §3.1). The first-strands inclusion is
   the pinned `TauCeti.BraidGroup.castAdd` (`TauCeti/GroupTheory/SpecificGroups/Braid/Basic.lean:477`),
   absent from the contracts.

   **Repair.** Replace the clause by: "the general gluing `Hur_m × Hur_n → Hur_(m+n)`, from the
   homomorphism `B_m × B_n → B_(m+n)` and concatenation, is associative and unital up to homotopy,
   hence on homology. The homomorphism is `TauCeti.BraidGroup.castAdd` on the first factor (trivial
   for `m = 0`) and `shiftHom m n` on the second; their images commute by
   `TauCeti.BraidGroup.sigma_mul_sigma_comm`, the native generator indices being at most `m − 2` and
   at least `m`". Add "`TauCeti.BraidGroup.castAdd`, `TauCeti.BraidGroup.castAdd_sigma` (same module):
   the inclusion of a braid group on the first strands, `σ_i ↦ σ_i`" to *From Tau Ceti* and to the
   *Needs:* of §0.4. Tested: `m = n = 2` in `B_4`, native indices `0` and `2`, `0 + 2 ≤ 2`, so the
   hypothesis of `sigma_mul_sigma_comm` holds.

4. **F04** (P3) §5.3 uses the parent's comparison for the disc, but the parent states it for the plane

   **Location.** `README.md:1655-1656`: "§IG.5.3, for `c ⊆ G ∖ {1}`, identifies `Hn^c_{G,n}(ℂ)` with
   `CHur_n/G`"; the contract at `README.md:275-276` says the same.

   **Claim.** The parent identifies the complex points with the quotient of the Hurwitz space over
   `Conf_n` of the disc, which is what `CHur_n` means here (Conventions, `README.md:134-136`).

   **Witness.** InverseGaloisAndArithmeticFundamentalGroups §IG.5.3, *Analytic and topological
   Hurwitz comparison*, at its open head (`README.md:5744-5746` there): the space is the Hurwitz
   space "of the plane … (the disc replaced by `ℂ`, the boundary base point near `∞`)".

   **Repair.** In the contract (`README.md:275-276`): "the complex points of `Hn^c_{G,n}` are the
   quotient by `G` of the Hurwitz cover of `Conf_n(ℂ)` with fibre the generating tuples in `c^n`
   (the disc replaced by the plane)". In §5.3, after "identifies `Hn^c_{G,n}(ℂ)` with" write: "the
   quotient by `G` of the Hurwitz cover of `Conf_n(ℂ)` with fibre the generating tuples in `c^n`.
   The homeomorphism `Conf_n(ℂ) ≅ Conf_n(int D)` of ReductiveGroups Layer 11A carries the base
   configuration to the base configuration and the half twists to the half twists, so this cover is
   the pullback of `CHur_n/G` and has the same homology". Add ReductiveGroups Layer 11A to the
   *Needs:* of §5.3. Tested: `G = S₃`, transpositions, `n = 2`: both covers have a one-point fibre
   (the six generating pairs form one conjugation class) over a base homotopy equivalent to a circle.

Four new findings: one P2 (S01) and three P3 (S02–S04). All are in
`packages/InverseGaloisAndArithmeticFundamentalGroupsPartII/README.md`; none touches
`Suggested.lean`, whose two headlines were found true as typed on every instance tried. Thirteen
of the fourteen round 1 findings are repaired at this head; the fourteenth (a/F02, ownership
against ArithmeticStatisticsPartVIII §5.16) was marked not actionable in this package and is not
re-raised.

## Round 1 findings at this head

| Round 1 finding | Status | Witness at `ec90633` |
|---|---|---|
| a/F01 (P3) padding in `Suggested.lean` | repaired | `hurwitzAction_sigma`, `shiftHom_sigma`, `HurwitzFibre.smul_tuple`, `unmarked_smul_mk`, `unmarkedGlueSum_smul` occur in neither file (grep: no match); 35 declarations remain. |
| a/F02 (P1) ownership against ArithmeticStatisticsPartVIII §5.16 | settled, not re-raised | Marked "not actionable in this package: … decided by a human". The reason stands: it is a scope and merge-order decision. `README.md:103-114` now describes §5.16 as it is at its open head (checked: its scope line names this roadmap as later and unimported). |
| a/F03 (P2) "no single map" | repaired | `README.md:157-158`: "For `|c| ≥ 2` this is a sum of several maps of spaces; for a singleton class `c = {g}`, with `g` central, it is the single gluing map." |
| a/F04 (P2) realization gap asks for a pinned construction | repaired | `README.md:328-330`: "for the thick realization `TauCeti.fatRealization` of a semisimplicial space `X` (pinned), its skeletal filtration and the natural first-quadrant homology spectral sequence"; `fatRealization`, `ι`, `fatRealizationFunctor`, `augment` exist at the pin (`TauCeti/AlgebraicTopology/FatRealization.lean:89, 95, 193, 204`); `plan.json` has the same sentence. |
| a/F05, b/F03 (P2) arc gap | repaired | `README.md:372-379`: arcs "from points of `∂F` to points of `Λ` … disjoint except at common endpoints: isotopy extension for such systems relative to `∂F ∪ Λ` (§3.3 states it for compact sources in boundaryless targets)"; `plan.json` section is `§3.3`; GeometricTopology §§3.3 and 1.7.2 on main say what is cited. |
| a/F06, b/F02 (P1) induction outside its domain | repaired | `README.md:1145-1150` defines `F(S; Δ, Λ) ⊇ A(S; Δ, Λ)` for a disc with finite nonempty `Δ`; `README.md:1267-1270` proves both results in that family; the cut pieces stay in it (recomputed below). |
| a/F07 (P1) free-action hypothesis | repaired | `README.md:323-325`: "This comparison is stated for free actions only; the simultaneous conjugation of `G` on `Hur_n` is not free, and its quotient is treated in §4.4." §4.4 argues by permutation modules (recomputed below). |
| b/F01 (P1) arc order against the half twist | repaired | `README.md:1153-1154`: "Order a simplex of `A(D; {∗}, P)` by the clockwise order of its tangent directions at `∗`"; `README.md:1258-1260` Check: "`σ_1 · a_0 = a_1`". Recomputed with the supplier's formula `z_i = i + 1/2 − exp(πtI)/2`: the left point has imaginary part `−sin(πt)/2 < 0`, so it passes on the side of `∗ = −i`. One new slip in the repaired preamble: S02. |
| b/F04 (P2) evaluation bundle | repaired | `README.md:1079-1083` takes local sections from GeometricTopology §3.3 with `N = P`, `M = int D`, supports in a fixed compact set; §3.3 on main has the restriction fibration for compact `N` and boundaryless `M`. |
| b/F05 (P3) `b` at `p = 0` | repaired | `README.md:1466-1467`: "`b = A2 + 3 A0 p` from §4.1 for `p > 0`, and `b = A2 + 1` from §1.15 for `p = 0`". |
| b/F06 (P3) Lean heading | repaired | `Suggested.lean:44`: "Layer 0: nonsplitting classes, the Hurwitz representation and the component ring", the README's heading; Layers 4 and 5 agree. |
| b/F07 (P3) surgery argument locator | repaired | `README.md:1273-1276` cites HAT91 (HAT91 lines 101–106) in the form of WAH08 Lemma 2.5 (WAH08 lines 302–303); both are in `sources.toml` as certified and the lines say what is cited. |

No repair introduced a false statement; S01, S03 and S04 are in text the repairs did not change,
and S02 is in the preamble added for b/F01.

## Verified sound

**Dependency check.** Output: `depcheck: 206 roadmaps, 1897 edges, 0 problem(s)`. No UPWARD, CYCLE
or `moved:` line. The roadmap is line 224 of `merge-order/ORDER.txt`;
InverseGaloisAndArithmeticFundamentalGroups is line 55; ReductiveGroups, ClassifyingSpaces,
AlgebraicTopology, GeometricTopology and DGAInfinity are on main. No notion was moved down.

**Diff.** `git diff --name-only origin/main...HEAD` lists seven files, all under
`packages/InverseGaloisAndArithmeticFundamentalGroupsPartII/` (README.md, Suggested.lean,
design/plan.json, sources.toml, three reports).

**Counts.** Declarations read: 35 (every line of `Suggested.lean`; the supplied list of 36 counts the words "class `c`" of the `HurwitzFibre` docstring as a declaration). README targets read: 46
numbered sections with all their Check bullets (every line). Locators verified against the cached
texts: 25 printed-page locators of EVW16 (each numbered statement cited, against the page
markers) and 24 line ranges (EVW16 lines 131, 341, 342–349, 501–505, 509–527, 537–539, 544–546,
561–569, 815–827, 850–853, 872–880, 979–984, 1049–1052, 1062–1068, 1099–1111, 1151–1153,
1203–1205, 1256–1263, 1322–1325, 1341–1360, 1578–1606; HW10 lines 1625–1638 and 1644–1667; HAT91
lines 101–106; WAH08 lines 302–303). Checks recomputed: 52 (table below). Sibling citations
resolved: 31 (list below). Pinned declarations grepped at the pins: 36 Tau Ceti and 18 Mathlib
names, all present in the files the README names.

**`Suggested.lean`.** No Lean was run (the brief gives no Lean command). The 35 elaborated types
of the supplied signatures file were compared with the README statements: all agree, and no
declaration lost a binder (`{G : Type} [Group G] [Fintype G]`, `(k : Type) [Field k]` and
`↑(Fintype.card G) ≠ 0` are in both headlines; `∃ m … ∃ A B` precede `∀ k`). Imports: `Mathlib`
and `TauCeti.GroupTheory.SpecificGroups.Braid.Basic`, which exists at the pin and is used. No
`lemma`, `set_option`, `#eval`, `#check`, sorry'd data, `True` placeholder or process word; no
pull-request number in either file. Every Lean name is backticked in the README, and the README
has no own name the file lacks. Headlines: `hurwitz_homological_stability` and
`uniform_betti_bound` are stated; the étale bound, EVW Theorem 4.2 and HW10 Proposition 7.2 are
named in the module docstring with the missing carrier (Hurwitz schemes; the braid-orbit monoid
algebra and K-complex; isotopy classes of arcs), and none has a short native statement. Padding
probe: each of the 15 proved theorems is consumed by a later definition or instance
(`hurwitzAction`, the two `MulAction` instances, `glue`, `glueRepHom`, `conjFibre`,
`unmarkedStabilizer`); neither headline follows from a library lemma. The one same-name library
lead (`UnmarkedFibre.mk`) is an unrelated declaration.

**Declarations (context and computed values).** `a = (12)`, `b = (23)`, `c' = (13)` in `S₃`;
`c` the transpositions. Context `G*` is `{G : Type*} [Group G]`, `G₀` is `{G : Type} [Group G]`.

| Declaration (line) | Context | Instance and values on both sides | Result |
|---|---|---|---|
| `IsNonsplitting` (49) | `G*` | `G = 1`: closure `⊤`, holds. `S₃`: `c ∩ H` has 3, 0, 1, 0 elements. `S₄`, `H = ⟨(12),(34)⟩`: no `x ∈ H` conjugates `(12)` to `(34)`. `C₆`: closure of order 2. `A₄`, class of `(123)` = `{(123),(142),(134),(243)}`: one element in each `C₃`, none in `V₄` | true/false as the Checks say |
| `hurwitzMoveFun` (62), `hurwitzMoveInvFun` (67), `hurwitzMove` (74) | `G*`, `i : Fin (n−1)` | `(a,b) ↦ (c',a)`; products `(13)(12) = (123) = (12)(23)`. Inverse: `(a,b) ↦ (b,c')`, then the move gives `(b c' b⁻¹, b) = (a,b)` | ok |
| `hurwitzMove_comm` (95), `hurwitzMove_braid` (124) | `G*` | `n = 3`, `(a,b,a)`: `m₀m₁m₀` gives `(c',a,a) → (c',a,a) → (b,c',a)`; `m₁m₀m₁` gives `(a,c',b) → (b,a,b) → (b,c',a)` | equal |
| `hurwitzAction` (144), `hurwitzAction_iff` (151), `hurwitzAction_comm` (164) | `G*` | `σ₀ ↦` move 0; `n = 0, 1`: no generator, trivial action | ok |
| `shiftHom` (182), `hurwitzAction_shift` (187) | none / `G*` | `m = 1, n = 2`: native `σ₀ ↦ σ₁`; `(a; a,b) ↦ (a; c',a)` on both sides; `n = 0`: map out of `B_0`; type `natAdd m : B_(n+1) →* B_(m+n+1)` at the pin | ok |
| `hurwitzMoveFun_mem_iff` (217), `closure_range_hurwitzMoveFun` (242), `hurwitzFibre_prop_iff` (281) | `G₀` | `(a,b)` and `(c',a)`: both in `c²`, both generate order 6; `(a,a)` fixed, order 2 | ok |
| `HurwitzFibre` (272), `instMulAction` (291) | `G₀` | `S₃`, `n = 2`: 9 points, 5 orbits (1,1,1,3,3); `full`: 6 points; `n = 0`: 1 point, or 0 with `full` and `G ≠ 1` | ok |
| `glue` (301), `glue_smul` (312), `glueRepHom` (318), `markedStabilizer` (329) | `G₀`; `[Fintype G]`, `k` for the last | `m = 2`, `n = 0`: `∅ ↦ (a,a) + (b,b) + (c',c')`; `G = 1`: one summand | ok |
| `conj_mem_carrier` (337), `conjFibre` (344), `hurwitzMoveFun_conj` (356), `smul_conjFibre` (363), `conjSetoid` (369) | `G₀` | `h = (123)`: `a ↦ b ↦ c' ↦ a`; constant pairs one class, the six others one class | ok |
| `UnmarkedFibre` (378), its action (382), `mk` (393) | `G₀` | `S₃`, `n = 2`: 2 points (`full`: 1); `C₂`: quotient map is the identity | ok |
| `glue_conjFibre` (398) | `G₀` | block entry `h (h⁻¹ g h) h⁻¹ = g` | ok |
| `unmarkedGlueSum` (410), `_conj` (416), `_eq_of_mk_eq` (432), `unmarkedStabilizer` (441) | `G₀`, `[Fintype G]`, `k` | `m = 2`, `s = (a)`: `[aaa] + [bba] + [c'c'a] = [ttt] + 2[ttt']`; the same for `s = (b)` | independent of the representative |
| `hurwitz_homological_stability` (472) | `G₀`, `[Fintype G]`, `hc` | `S₃`, `m = 2`, `p = 0`: marked 6 → 6 (`n = 3 → 5`), `full` 3 → 3, unmarked 2 → 2 (odd `n`) and 3 → 3 (even `n`); `m = 1` would give 2 → 3. `G = 1`: `H_p(B_n) → H_p(B_(n+m))`. Empty fibres (`full`, small `n`): excluded by `A p + B < n` or `0 → 0`. `k = 𝔽₂, 𝔽₃` for `S₃`: excluded, `6 = 0` | true as typed |
| `uniform_betti_bound` (489) | same | `n = i = 0`: rank 1, so `C ≥ 1`; `n ≤ A i + B + a`: `(2|G|)^n ≤ (2|G|)^((A+B+a+1)(i+1))`; larger `n`: descent in steps of `a` with every source `> A i + B` | true |

**README targets (values computed).**

| Statement | Instance | Computed | Result |
|---|---|---|---|
| §0.6 relation, both forms | `g → h`, `h → h⁻¹gh` | `r_h r_(h⁻¹gh) = r_(h·h⁻¹gh·h⁻¹) r_h = r_g r_h` | ok |
| §0.7 `U_(2D) ≠ U_D²` | `S₃` | mixed terms sum to `2(r_a²r_b² + r_a²r_c'² + r_b²r_c'²)`, nonzero as `2 ≠ 0` in a permitted field | ok |
| §0.8, Examples: `D = 1` for `S₃` | orbits of generating tuples | classified by the boundary product: 2 for `n = 2`, 3 for `n ≥ 3`; `r_g²` preserves the product, so all three maps are the same bijection; diagonal `3`, a unit | `D = 1` admissible |
| §0.8 diagonal | `H` of order 2 | `|c ∩ H| = 1`; in general `|c ∩ H|` divides `|H|` (one class of `H`) | ok |
| §1.5 resolution degrees | `F_0 = R̄`, kernel in degrees `≤ e = deg R̄` | `F_i` generated in degrees `≤ i e` | ok |
| §1.6 sequence | `k[t]`, `M = k` | `0 → k → k[1]`, second map of degree 1; in general `m ↦ U ⊗ m` with kernel `R[U] M` | exact in the middle |
| §1.7 induction | `j + u = b`, `j ≥ 2` | `(b−u−1)A1 + a + δ + A1 u = (b−1)A1 + a + δ ≤ bA1 + δ` iff `a ≤ A1` | ok |
| §1.9 | segment of §1.3 | `deg Tor_1^R(R̄, M) ≤ e + max(h₁, 3e + h₀) ≤ max + 4A1` | ok |
| §1.11 Check on `A₄` | `g = (123)`, `h = (134)` | same class; `h² = (143)` does not commute with `g`; products `h²gh⁻¹ ≠ gh` | ok |
| §1.13 identity | tuple `w`, basis `s`, `b = ∂s` | `i = 0` term: `x^(∂w) = b g b⁻¹`, `r_(bgb⁻¹) s = s r_g`; other terms: the prefix of `S_g(d(w; s))` is computed from `∂(w ∖ g_j) · g_j^(suffix) · b = ∂w · b`, unchanged | `dS + Sd = · r_g` |
| §1.15 | `k[t]`; general | `d : K_(q+1) → K_q` is `t` (`q` even), `0` (`q` odd); `U` bijective on `(K_q)_n` for `n − q > A1`, on cycles for `n > A1 + q` | `deg H_q ≤ A2 + q` |
| §1.16 with `A1 = 0` | `G = 1`, `M = k` | bound `1 + 0 + 0 + 1 = 2`, `deg H_3 K(k) = 3`; EVW16 line 984 has `H_(q−i)`, so the slope needs `A1 ≥ 1` | the README's constants repair it |
| §1.17 | `(g,h) ⊗ m` | image `(r_h r_(h⁻¹gh) − r_g r_h) ⊗ m = 0`; `R_+ = Σ r_g R` | surjection ok |
| §1.18, §1.19 | — | `A1 q + 4A1 + A2 ≤ (5A1 + A2) q` iff `4A1 ≤ 4A1 q`; `A(M) ≤ b + 5A1 < b + A0` | ok |
| constants | `G = 1`; `C₂` | `(A1, A2, A0) = (1, 2, 7)`; `(2, 4, 14)` | ok |
| §2.3–2.4 | `q = 1, 2` | faces `bσ₁L₀`, `bL₀`; `∂_i∂_q` and `∂_(q−1)∂_i` both `b s_(q−1,i) L_(q−2)` as `σ_q ∈ L_(q−2)`; vertex 2 is `bσ₁σ₂σ₁L₀ = bσ₂σ₁L₀` | ok |
| §2.3 injectivity sketch | `m` points in a small disc | lift to the cover recording the block, forget the other block, shrink: the composite `Conf_m(D') → Conf_m(D)` is a homotopy equivalence | valid |
| §2.5 face formula | `q = 2`, `i = 0` | `σ₂ : (a₀,a₁) ↦ (a₀,a₂)`, then `σ₁ ↦ (a₁,a₂) = ∂₀v₂` | ok |
| §2.2 order | `∗ = −i`, `P₁ < P₂` | directions `(P_j, 1)`, arguments `arccot P₁ > arccot P₂` | `P₁` first clockwise |
| §2.6 cutting | bad `p`-simplex, `d` endpoints | pieces are discs (the arcs and `∂S` form a connected set), each `Δ_i ≠ ∅`, `Σ|Λ_i| = |Λ| − d`, `d ≤ (p+1)/2 ≤ p`; join connectivity `Σ(|Λ_i| − 2) + 2(c − 1) = |Λ| − d − 2` | family closed |
| §2.1 non-closed `Diff_c` | `φ = exp(−1/(1−r)²)` | `φ_j = 0` for `r ≥ 1 − 1/j`, `φ_j = φ` for `r ≤ 1 − 2/j`, `φ(1 − 1/j) = e^(−j²) > 0` | ok |
| §3.3 faces | `((12),(23))`; general `i` | `σ₁⁻¹`: `((23); (13))`; `s_(q,i)⁻¹`: `(…ĝ_i…; g_i^(g_(i+1)⋯g_q))`; `[b, t] ↦ [bs, s⁻¹t]` | matches §1.11 |
| §3.4, Examples | `G = 1`, `n = 2` | `E² = k` at `(0,0)` and `(1,0)`; `X(2) ≃ ℝ/ℤ`, `H_0 = H_1 = k` | ok |
| §4.1 | — | `E²_(j,P−j)`: `A2 + A0(3P + 1 − 2j)`; sources of `d^r`: `A2 + A0(3P + 4 − 2r)`, `r ≥ 2`; `n ≥ 3 + 21P` gives `P < n − 2` | ok |
| §4.3 | strata | filtration by `|H'|` is `U`-stable; total and quotient isomorphisms give the top stratum by the five lemma; diagonal `U_Q` with coefficient 1 (EVW16 line 1325 has `|c|/|c ∩ Q|`) | README's correction right |
| §4.4 | `S₃`, `n = 2` | 5 orbits; conjugation joins the 3 constant ones and swaps the two of products `(123)`, `(132)`: 2; `F/G` has 2 points | ok |
| §5.1 | `n = 0, 1, 3` | `1`; `1 ≤ 2|G|`; `(1, 2, 1)`; `2^(n−1)|G|^n ≤ (2|G|)^n`; `4cos²(π/5) = 2.618… = (3+√5)/2` | ok |
| §5.3 | `G = 1`; hypotheses | handled separately; hypotheses equal EVW16 lines 1578–1582 and the parent's *Fixed-degree Hurwitz mod-`ℓ` comparison* | ok, with S04 |

**Sibling citations resolved.** InverseGaloisAndArithmeticFundamentalGroups at its open head: the
twelve cited targets of §§IG.3.2, IG.5.1, IG.5.2, IG.5.3 and IG.5.5 exist under the cited titles,
with the hypotheses the README repeats (S04 is the one difference). GeometricTopology on main:
§1.7.2 (cutting bullet), Layer 3 / §3.1, §3.3 (restriction fibration), §3.4 (Smale's disc theorem
in the collar form), Layer 1 by headings. AlgebraicTopology on main: the Stage-to-Layer table,
§5.3 (regular covers, simply transitive deck action), §5.5, §8.1 (exact sequence of a based pair),
§8.2 (relative simplicial approximation), §§4.7 and 5.1 by heading. ClassifyingSpaces Stage 4,
items 16–17. ReductiveGroups Layers 11A and 11B (S01; 11B has the two-skeleton alternative and no
cell count, so the declared gap is not already provided). DGAInfinity Layer 5.
ArithmeticStatisticsPartVIII §§5.16, 5.19 and its scope line on this roadmap, at its open head.

**Declared gaps.** The eight slugs and `needs` sentences agree between `design/plan.json` and the
README, each with a named supplier and section. None is provided at the pins (grep of Tau Ceti:
no graded `Tor`, no Borel construction, no filtration of `fatRealization`, no weak
contractibility of `TauCeti.DiscDiff 2`). None is raised.

**Ownership against open work.** `roadmaps grep` over the open heads and main for the arc complex
and for the mapping class group of the marked or punctured disc: no owner other than this roadmap
(the parent says the identification is not part of it; GeometricTopology has the Artin action
on the free group, not the mapping class group). The sibling checkouts were searched through
that tool, not file by file. Overlaps and citation leads supplied with the job: none.

## Not verifiable

- PAL60 and ALEX23: settled as uncertified; their locators were not read.
- `Suggested.lean` was not elaborated in this pass; the supplied elaborated signatures were used,
  and the repair report records an elaboration with exit code 0 at this head.
- The end-to-end orientation of `Ẽ ×_{B_n} X` (deck action against `π_1`, which ClassifyingSpaces
  item 16 leaves to be stated): the §2.1 witness is correct under transport `f ↦ f ∘ h_*⁻¹` and
  Mathlib's product `p * q = q.trans p` (checked at the pin), and that assumption is the
  supplier's to fix.
- CD95 Theorem 1.4.1 and Corollary 2.2.3 were not re-read in this pass (round 1 read them).
- The sources behind the parent roadmap's §IG.5 targets were not read; only its statements were
  compared.

## Source issues

- **Error** in EVW16 at Proposition 4.13 with (4.5.3), pp. 18 and 21: the source says the K-homology bound has slope the first constant, which is zero for the trivial group; it should be a slope at least one; affects a stated result.
- **Error** in EVW16 at proof of Lemma 4.7, p. 19: the source says the spliced resolution joins two unshifted copies of the ring by multiplication by the central element; it should shift the second copy and the later terms by its degree; affects the proof.
- **Error** in EVW16 at (6.1.6), p. 29: the source says the central element acts on a stratum as the stratum's own element times the ratio of the class sizes; it should be the stratum's own element with coefficient one; affects the proof.
- **Misprint** in EVW16 at proof of Lemma 4.6, p. 18: the source says the kernel is covered by the tensor product with the module on the left of the torsion ideal; it should have the torsion ideal on the left; affects nothing.
- **Misprint** in EVW16 at (7.8.3), p. 35: the source says the stabilization raises the number of branch points by the exponent of Lemma 3.5; it should be by the degree of the central element; affects nothing.
- **Gap** in EVW16 at §5.2, p. 23: the source says the simplices in every degree are the cosets of the tail subgroup; it should be no simplices in degrees at least the number of points; affects nothing.
- **Gap** in EVW16 at §5.5 and proof of Proposition 5.6, p. 25: the source says arcs are ordered counterclockwise without fixing the direction of the half twist; it should fix both, clockwise order going with the counterclockwise twist; affects the proof.
- **Gap** in HW10 at Lemma 7.1 and Proposition 7.2, pp. 34–35: the source says the set of boundary points is finite; it should also be nonempty, as its proof assumes for the cut pieces; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "ec906334c99dc5ce7d3c3d15804df52f32d16bcd", "job": "RT-InverseGaloisAndArithmeticFundamentalGroupsPartII~2a", "model": "fable", "worker": "chris-x25"} -->
