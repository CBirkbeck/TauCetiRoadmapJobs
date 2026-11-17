# Review of PurityForFlatCohomology (pull request #1840 at 64dca7d)

**Verdict:** needs changes

## R01 (P3) — the type of a group of multiplicative type has two Checks

**Location:** `TauCetiRoadmap/PurityForFlatCohomology/README.md` lines 2705–2718 (§7.12d): "Define the **type** of a group `G` of multiplicative type over `S` at `s ∈ S` as the isomorphism class of the stalk of `X^*(G)` at a geometric point over `s`."

**Claim:** A definition carries at least three discriminating Checks; this one, now the subsection's only target, carries two (`Spec(k × k)`; the norm-one torus over `ℝ`).

**Witness:** Neither Check separates the stalk of `X^*(G)` from the character group of the reduced geometric fibre: both groups are smooth, so the two models agree on them (`ℤ`, `ℤ/2`; `ℤ`).

**Repair:** Add the Check: "`𝔾_m × μ_4 = D_ℤ(ℤ × ℤ/4)` over `Spec ℤ` has type `ℤ × ℤ/4` at every point, the prime `2` included, where the fibre is not reduced: the reduced fibre over `𝔽_2` is `𝔾_m`, with character group `ℤ`, so a type read off the reduced geometric fibre would lose `ℤ/4` at `2` and would not be locally constant."

## R02 (P3) — §7.12b states no target

**Location:** `TauCetiRoadmap/PurityForFlatCohomology/README.md` lines 2622–2631 (§7.12b): "GroupSchemesOverABase §1.3 proves that `D_S(M)` is smooth over `S` iff … GroupSchemesOverABase §1.4 proves that, for every homomorphism `φ : N → M`, the kernel of `D_S(φ)` …"

**Claim:** A layer subsection names a target with its *Needs* and Checks; what another roadmap states is deferred in Scope and ownership and in the supplier contracts only, and a target that moved away is deleted, not kept as a heading.

**Witness:** §7.12b has 0 "Prove"/"Define", 0 *Needs* lines, 0 Checks; its two sentences repeat README lines 590–595 (the GroupSchemesOverABase contract, §§1.3–1.4). No *Needs* line of the README names §7.12b.

**Repair:** Delete §7.12b. In the contract write "(§7.13)" for "(§7.12b)" at line 591 (§7.13(c) uses the smoothness of `D(ℤ^r)`) and "(§§7.12a, 7.12e, 7.13)" at line 595; write "§§7.12a, 7.12c–7.12e" at lines 70, 96, 142, 2204.

## Previous findings

- The previous review (of `a825987`) listed no finding. Its question for the human reviewers, the ownership of §§7.12a–7.12e against GroupSchemesOverABase, is settled at this head: GroupSchemesOverABase is on main, the README cites its §§0.1, 1.1–1.5, 2.1–2.3, 2.7 (lines 578–614), and §§7.12a, 7.12c–7.12e keep only the comparison with Tau Ceti's `𝔾_m` and `μ_n`, the Cartier-dual criterion, `IsTorus`, the type, and kernels, closedness and `m`-torsion.

## Verified sound

| # | Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|---|
| 1 | §1.5 local Lefschetz | DVR, `f` uniformizer; `k⟦x, y⟧`, `f = x`; `f = 0` | `H⁰_𝔪(R) = 0 → H⁰(k) = ℤ/ℓ` injective, not onto; degrees `≤ 1` both `0`, degree `2`: `0 → ℤ/ℓ(−1)`; identity | agrees with CS24 line 1356–1360, p. 33 | none |
| 2 | §3.3 nilpotent invariance | `α_p` over `𝔽_p[ε]/(ε²)`; `μ_p` over `ℤ/p²` (also `p = 2`) | `H⁰ = 𝔽_pε → 0`, `H¹ = R/R^p ≅ 𝔽_pε → 0`; `μ_p(ℤ/p²) = 1 + pℤ/p² ≅ ℤ/p → 1`, `(1+2a)² ≡ 1 mod 4` | surjective, not injective below the stated degrees; CS24 lines 2366–2383, p. 57 | none |
| 3 | §3.2 Check, `A = 𝔽_p ⊕ 𝔽_p[1]`, `μ_p` | fibre sequence with `M = 𝔽_p[1]` | `RHom(L, 𝔽_p[2])` in degrees `−2, −1`; `H⁰(A, μ_p) ≅ Ext¹(e^*L, 𝔽_p) = 𝔽_p`, `μ_p(𝔽_p) = 1` | agrees with §3.3 (bijective only for `i ≥ 1`) | none |
| 4 | §5.3 arc hyperdescent of the Dieudonné side | `𝕄(ℤ/p) = A_inf/p`, base `W(A′^♭)` against a base `B` with `p`-torsion | `p` injective on `W(A′^♭)`; `Tor₁(A_inf/p, B) = B[p] ≠ 0` | CS24 Lemma 4.2.6 (line 1717), Proposition 4.2.7 (line 1735), p. 42 | none |
| 5 | §6.3, `etaleDepth_ge_virtualDimension` | `k⟦x, y⟧/(xy)`, `i = 0`; a field; `ℤ_p`, `G = ℤ/p` | `vdim = 2 − 1 = 1`: `ℤ/n → (ℤ/n)²` diagonal, injective, not bijective (`0 + 1 < 1` false); `vdim = 0`: `ℤ/n → 0`, hypothesis `0 < 0` false; `H⁰_𝔪 = 0` | CS24 line 3540, pp. 84–85; Lean signature equals §6.3 | none |
| 6 | §6.5 regular rings, degree `dim R` | DVR, `μ_p`; a field `K` | `H⁰_𝔪 = H¹_𝔪 = 0`, `H²_𝔪 ⊇ K^×/(R^×K^{×p}) = ℤ/p`; `H⁰_𝔪(K, ℤ/n) = ℤ/n ≠ 0` | "not a field" needed; CS24 line 3566, p. 85 | none |
| 7 | §7.1 corrected bound `max(d − 1, 1)` | `Spec k ⊔ Spec k`, `Z` one point, `d = 1`, `G = ℤ/2` | `(ℤ/2)² → ℤ/2` not injective; source bound `d − 1 = 0` admits the field | CS24 line 3632 has `≥ d − 1`; README bound excludes it | none |
| 8 | §7.2, `free_of_endomorphisms_iso_pi` | `M = Rⁿ`; `M = 0`; second syzygy of `k` over `k⟦x, y, z⟧` | `End = R^{n²} = M^{⊕n}`; `0 ≅ 0^{⊕r}`, free; rank `2`, `pd = 1`, not free | invoked at CS24 line 3684, p. 88 | none |
| 9 | §7.8 Picard of complete intersections | `ℙ²`; quadric surface; cuspidal cubic; `f_1 = 1` | quotient `0`; quotient `ℤ`, (b) needs `1 + 3 ≤ 3`, false; `Pic/ℤ[𝒪(1)] ≅ ℂ × ℤ/3`, torsion `ℤ/3`, (a) needs `1 + 2 ≤ 2`, false; excluded by `0 < d` | Lean hypotheses match | none |
| 10 | §7.6 local Picard headlines | node; `A_1`; field; DVR | `Pic(U_R) = ℤ` torsion free; `ℤ/2` at `dim 2`, excluded by `3 ≤ dim`; `U = ∅`; `U = Spec K` | both Lean statements hold on the instances | none |
| 11 | §7.12a points of `D_S(ℤ/p)` | `Spec 𝔽_p[ε]/(ε^p)` | `(a + x)^p = a`, so `a = 1`: the units `1 + x`, `x ∈ (ε)` | agrees with `mu S p` | none |
| 12 | §7.12e kernels, `m`-torsion | norm `Res_{ℂ/ℝ}𝔾_m → 𝔾_m`; `𝔾_m × μ_3`; `t ↦ t^p` | coker of `1 ↦ 1 + σ` is `ℤ` with `σ = −1`; `X^*/3 = (ℤ/3)²`, rank `9`; kernel `μ_p ≠ 1` | (a)–(c) hold | none |
| 13 | §7.13(a), (b) | `M = ℤ ⊕ ℤ/n`, `m = n`; `M` torsion free; `μ_n` | `S = D(nℤ)`, kernel `μ_n × μ_n`, composite `(tⁿ, 1) = [n]`; `n = 1`, `L = X^* × ℤ` free; `S = D(0)` | `ker(x ↦ mx)` is the torsion exactly when `m` kills it | none |
| 14 | §7.14, `etaleCohomology_two_gm_torsion_purity` | `U = X`; `U = ∅`; CS24 Theorems 7.2.8, 1.1.4 | vacuous, identity; generic point of dimension `0` fails both disjuncts | CS24 lines 3828–3845, 122–125 | none |
| 15 | §7.15 higher degrees | node, `d = 3`; regular, `Z` of codimension `≥ 2` | `H¹(R, 𝔾_m) = 0`, `Pic(U_R) = ℤ`; bijective `i ≤ 1`, injective `i = 2` | CS24 lines 3871–3878, p. 92 | none |
| 16 | §8.2, `IsOfDimLEOne` | `ℝ`; separably closed; `𝔽_p((t))` | `H²(ℝ, ℤ/2) = ℤ/2`; all vanish; `Br = ℚ/ℤ` | C19 lines 111, 130, 147, 172, 568–570, pp. 3–5, 15 | none |
| 17 | §8.3, torus on `U_R` | `ℝ⟦x, y⟧`, norm-one torus | `H¹(U_R, T) ≅ H¹(ℝ, T) = ℝ^×/N(ℂ^×) = ℤ/2` | residue-field hypothesis needed; C19 line 87 | none |
| 18 | §8.4 coniveau with supports | `Z = {x}` closed | one column, `a = dim 𝒪_{X,x}` | ILO14 lines 16269–16282 (Lemma 2.2, (2.a), printed p. 333) | none |
| 19 | §8.5, §8.6, `etaleCohomology_torus_purity`, `etaleCohomology_gm_purity_regular` | `V(x) ⊂ 𝔸²`; `𝔸²_ℂ` minus the axes; `U = X` | `H¹_Z(𝔾_m) = ℤ`; generic points of the axes have dimension `1`, hypothesis fails | C19 lines 30–32, 493–518, pp. 1, 13 | none |
| 20 | §8.8, §8.9 generic injectivity | `Spec K`; `ℙ¹_ℝ`, norm-one torus | `V = X`, identity; empty intersection `= H²(K, T)`; a nonzero class dying in `H²(ℝ(t), T)` | C19 lines 520–535, 543–550 | none |
| 21 | §8.13 | `ℚ_p`; `k((t))`, `k` separably closed imperfect; (b) | `Br(ℚ_p^{unr}) = 0`; `Br(K^{unr})[p] = Br(k((t)))[p] ≠ 0`; `α` extends iff its boundary in `H³_𝔪(𝒪, μ_{ℓⁿ}) ≅ H³_𝔪(𝒪̂, μ_{ℓⁿ})` is `0` | Poo17 lines 8099–8128, pp. 196–197 | none |
| 22 | §8.17 | `ℤ_p⟦x⟧` | `(p)`: `𝔽_p((x))`, `x` not a `p`-th power; `(x)`: `ℚ_p`, characteristic `0` | C19 lines 560–563, p. 14 | none |
| 23 | §1.1 `virtualDimension`, §1.8 Zariski–Nagata | `k⟦x, y⟧/(x, y)²`; `k⟦x⟧ = k⟦x, y⟧/(y)`; `k⟦x, y⟧/(xy)`; `A_1`; dimension `0` | `2 − 3 = −1`; `2 − 1 = 1`; `vdim 1`, `U_R` disconnected; `vdim 2`, `π_1(U_R) = ℤ/2`; `vdim ≤ 0` | hypotheses `2 ≤`, `3 ≤` exclude each failure | none |
| 24 | §5.6 Katz | `M = K`, `F = cφ`; `M = 0` | fixed line spanned by a root of `x^{p−1} = c⁻¹`; empty basis | Lean signature equals README | none |
| 25 | §8.1, punctured Brauer | `k⟦t⟧`, `k` separably closed imperfect | dimension `1`: `Br(k((t)))[p] ≠ 0` | `2 ≤ dim` needed | none |
| 26 | R01, §7.12d type | `𝔾_m × μ_4` over `ℤ` at `2` | stalk of `X^*` is `ℤ × ℤ/4`; reduced fibre `𝔾_m`, characters `ℤ` | third Check missing | R01 |
| 27 | R02, §7.12b | the subsection | targets `0`, *Needs* `0`, Checks `0` | no target | R02 |
| 28 | GroupSchemesOverABase citations (lines 578–614) | §§0.1, 1.1–1.5, 2.1–2.3, 2.7 on main | its README lines 286, 337–423, 453–517, 592; its consumer bullet (line 1435) names the same sections | each cited statement is made there | none |

- Source locators checked against the text: 31 (CS24 21, C19 8, ILO14 1, Poo17 1), all 15 seeded targets among them; the README flags no locator as unverified.
- Library declarations opened at the pins: 17 (among them `TauCeti/AlgebraicGeometry/Sites/Big/StructureSheaf.lean` lines 148, 230; `TauCeti/RingTheory/RegularLocalRing/UniqueFactorization.lean` line 59, which has `ringKrullDim R ≤ 2`, so §7.4 is not at the pin; `Mathlib/CategoryTheory/Sites/SubcanonicalOver.lean` line 25).
- Cross-roadmap citations resolved: GroupSchemesOverABase, LocalPurity §§1.3, 2.1, 2.2, DeformationAndDerivedPatchingAlgebra §6.9, DerivedDeRhamCohomology §§0.19, 0.21, 1.10, SchemeAndStackFoundations §2.22 on main; PrismaticCohomologyPartIII §6.0 at its open head. The six names the resolver lists are supplier-roadmap targets, each found in its README. PrismaticCohomologyPartIII §6.0 states the animated construction, the deformation fibre sequence and the Bégueri resolution in its proof-route paragraph; SchemeAndStackFoundationsPartII declares the same three as gaps on that section.
- Declared gaps: the three slugs stand at README lines 645, 720, 739, each with one supplier, one section and one statement.
- Gate at `64dca7d`: every counter `0`, `OK`. Dependency check: `depcheck: 240 roadmaps, 2530 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. Outside-folder diff against `origin/main`: empty.
- Elaboration of `TauCetiRoadmap/PurityForFlatCohomology/Suggested.lean`: 15 warnings, all ``declaration uses `sorry` ``, 0 errors. `Suggested.lean` is unchanged since `a825987`; the 25 elaborated signatures were compared with the README, none lost a binder. One-tactic probe (`simp`, `rfl`, `infer_instance`, `constructor <;> infer_instance`) on a scratch copy: 0 of 15 theorems close. All 15 statable headlines are stated; the docstring names the 8 groups that are not and the carrier each lacks.
- Title and description against the head: no sentence contradicted; the pull request adds the roadmap and removes nothing; GroupSchemesOverABase is on main and needs no entry in the dependency list.
- Overlap check: read SchemeAndStackFoundationsPartII, LocalPurity, GroupSchemesOverABase; fppf cohomology with supports, Layer 3 and §7.10: owner PurityForFlatCohomology, cited by SchemeAndStackFoundationsPartII; the punctured spectrum, purity for regular local rings and Stacks 0BLL, 0EY7: owner LocalPurity, cited here; diagonalizable groups, multiplicative type, tori, character sheaves: owner GroupSchemesOverABase, cited here.
- Source independence: 14 passages compared with 4 sources (CS24, C19, ILO14, Poo17), none shared beyond theorem hypotheses; largest share CS24, 135 of about 283 locators; contents compared with CS24: independent (its §4 is split over Layers 2, 4, 5 with Layer 3 from its §5 between, its §6.1 is in Layer 5, its §2 is no layer; the *Needs* lines of §§4.2 and 5.8 force Layer 3 before Layers 4 and 5); the title of Layer 7 shares five consecutive words with the title of CS24 §7.
- Research link: the headline targets are the theorems of Česnavičius–Scholze 2024 (purity for flat cohomology, Gabber's local Picard and Brauer conjectures) and Česnavičius 2019 (purity for the Brauer group, Grothendieck's conjecture), with Gabber's étale-depth bound and Zariski–Nagata purity; README Summary and CS24 §1, C19 §1.

## Not verifiable

- SGA3 VIII–X (§§7.12c–7.12e, 7.13): uncertified, cited by locator only.
- Aus62 Theorem 1.3 (§7.2): uncertified; only its invocation at CS24 line 3684 was read.
- Avr77 Proposition 3.6 (§1.2), DF84 Remark 3 (§8.18), Gro68 Brauer III 2.1 and 6.1 b) (§§7.11, 8.15), MB85 Lemme 2 (§7.3), Bou78 V 4.9 (§7.12), Gab04b (§§7.6, 7.12), BH Definition 2.3.1 (§1.1), SGA4 and SGA5 (§§0.3, 1.4, 3.4): uncertified.
- The description's "AI assistance" sentence describes the job board, not the head.

## Source issues

- **Error** in CS24 at Theorem 7.1.2, printed page 87: the source says the regular local rings along `Z` have dimension at least `d − 1`, which for `d = 1` admits fields; it should be at least `max(d − 1, 1)`, as Theorem 6.2.7 excludes fields; affects a stated result.
- **Gap** in CS24 at Lemma 4.1.12, printed page 40: the source says the integer `n` is less than `dim R`, while the proof of Theorem 6.2.7 applies the lemma with `n = dim R`; it should be stated for every integer `n`, which its proof gives; affects the proof.
- **Misprint** in CS24 at the proof of Theorem 6.2.7, printed page 85: the source says `f` lies in the square of `(p, x_1, …, x_n)`; it should be `(p, x_1, …, x_d)`, the ring having `d` variables; affects nothing.

## For the human reviewers

- none
