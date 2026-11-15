# Review of LocallyAnalyticDistributions (pull request #854 at 473fb50)

**Verdict:** needs changes

## R01 (P2) — PhiGammaModulesAndIwasawaCohomology §4.0, §4.1 and the eight supplier names are gone from its head

**Location:** `TauCetiRoadmap/LocallyAnalyticDistributions/README.md:99`: “§4.0, *Compact character spaces and scalar Mellin coordinates*, supplies `compactCharacterSpace` … `abelianAnalyticDistributions`, the topological algebra isomorphism `scalarAbelianMellin` … §4.1, *Relative analytic Γ rings*, supplies `analyticGammaRing` and `relativeMellin`”. The same §4.0/§4.1 citations appear at lines 20, 53, 54, 1917, 2013, 2015, 2025, 2027, 2035, 2037 and 2123.

**Claim:** the supplier's open head (`e1f38c1`, renumbered since `444887a` was reviewed) has these sections as §2.7 and §2.8, and declares none of the cited names. That leaves 13 supplier citations and 8 backticked supplier names pointing at nothing, and the README's `distributionMellin(μ)=scalarAbelianMellin(i_G(μ))` contract at line 99 has no counterpart there.

**Witness:** `PhiGammaModulesAndIwasawaCohomology/README.md` at `e1f38c1`: line 1257 “2.7 Compact character spaces and scalar Mellin coordinates”, line 1320 “2.8 Relative analytic Γ rings”; Layer 4 opens at §4.2. The eight names occur 0 times in its README and `Suggested.lean`.

**Repair:** replace “§4.0” by “§2.7” and “§4.1” by “§2.8” at the 13 places. Then replace the backticked names, which that head no longer declares, with the interface as §2.7–§2.8 export it. Line 99 would read: “§2.7, *Compact character spaces and scalar Mellin coordinates*, supplies the character space `W_G` of a compact abelian `G` with its universal character, generator changes, finite coefficient extension and the exported geometric interface (component, section, universal, pullback and base-change API); the strong-dual carrier `D(G,E)` and its topological algebra isomorphism with `O(W_G)_E`, with moment coefficients and extensionality. … in these identifications the Mellin transform of `μ` is the supplied transform of `i_G(μ)`. … §2.8, *Relative analytic Γ rings*, supplies `R_A^∞(Γ_K)` and the A-coefficient Mellin comparison”. At line 2013 drop the label `rigidCharacterSpace`, and at line 2025 write `scalarAbelianMellin_coefficients` as “the supplied moment coefficients”. The alternative is to restore the names in PhiGammaModulesAndIwasawaCohomology and cite them there.

## R02 (P3) — One shared hypothesis block is still copied into eleven subsections

**Location:** `README.md:1083`, repeated verbatim at lines 1346, 1542, 1608, 1642, 1725, 1807, 2009, 2095, 3037 and 3229: “(a) Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p with v_p(p)=1, X is a compact finite-dimensional Q_p-analytic manifold, and an affinoid coefficient A has a chosen complete submultiplicative ultrametric Banach norm”.

**Claim:** this is the previous review's R03, unchanged at this head. The targets of §§0.2 and 2.2 mention no manifold, affinoid or slope. In §§1.4, 1.5, 2.3 and 3.3 a manifold appears only in *Needs* lines. The §0.2 targets state field hypotheses that conflict with clause (a), so a reader has to resolve each target through the escape clause.

**Witness:** line 1083 (“K is a finite extension of Q_p”) against line 1093 (“Let K be spherically complete”). `K = 𝔽_p((t))` satisfies the Hahn–Banach hypothesis and not the block's.

**Repair:** give each subsection the hypotheses its targets use:
- §0.2 (line 1083): “(a) K is a complete nontrivially valued field; each target states whether K must be nonarchimedean or spherically complete.”
- §0.3 and §1.3 (lines 1346, 1542): “(a) Unless a target states broader field hypotheses, K is a finite extension of ℚ_p with v_p(p) = 1, and X, Y are compact finite-dimensional ℚ_p-analytic manifolds.”
- §§1.4, 1.5, 2.2, 2.3, 3.3 and 3.4 (lines 1608, 1642, 1725, 1807, 2009, 2095): “(a) Unless a target states broader field hypotheses, K is a finite extension of ℚ_p with v_p(p) = 1.”
- §§4.16 and 4.17 (lines 3037, 3229) keep the block as in §4.15.

## R03 (P3) — The description credits this roadmap with the stages, the Amice theorem and Coleman's spectral mapping theorem

**Location:** pull request description, paragraph 2: “Layer 0 constructs the Banach stages `LA_h` … Layer 1 proves Colmez's unbounded Amice theorem `D(ℤ_p, L) ≅ R⁺` … Layer 4 develops Serre's, Coleman's and Buzzard's Fredholm theory over a Noetherian Banach algebra, Coleman's spectral mapping theorem”.

**Claim:** the head imports all three. `LA_h` comes from PadicFunctionalAnalysis §4.3 and the Amice bijection from its §4.7. Complete continuity, Fredholm determinants, the resolvent, Riesz decompositions and Coleman's spectral mapping theorem come from CompactOperators. This roadmap owns the Fréchet topology, the dictionary and the further Fredholm theory.

**Witness:** `README.md:6–8` “over the Banach stages `LA_h` of PadicFunctionalAnalysis”. `README.md:1485` “Supplied by PadicFunctionalAnalysis §4.7”. `README.md:21–23` “Layer 4 takes complete continuity, Fredholm determinants, the resolvent, Riesz decompositions at a root and Coleman's spectral mapping theorem from CompactOperators”.

**Repair:** replace the Layer 0, 1, 3 and 4 clauses with: “Layer 0 gives the space `LA` its compact-type topology and the dual `D` of distributions its projective-limit topology over the Banach stages `LA_h` of PadicFunctionalAnalysis, with the nonarchimedean locally convex calculus (strict sequences, left hearts, completed tensors, compact-type duality), and builds the Hyodo–Kato cohomology of semistable Stein curves and curve towers (§0.CR.6.6); Layer 1 makes the Amice bijection `D(ℤ_p, L) ≅ R⁺` of PadicFunctionalAnalysis §4.7 an isomorphism of Fréchet spaces and builds on it the operator dictionary and the non-splitting of differentiation; … Layer 3 identifies `D(G, K)` with the compact abelian Mellin algebra of PhiGammaModulesAndIwasawaCohomology and develops its growth, weight and geometric comparisons; Layer 4 takes complete continuity, Fredholm determinants, the resolvent, Riesz decompositions at a root and Coleman's spectral mapping theorem from CompactOperators and develops over a Noetherian Banach algebra the fixed-rank spectral transform and truncation limits, finite-slope decompositions and perfect complexes, and the torus order on slopes.” In the summary block, change “and Fredholm theory over a commutative Noetherian K-Banach algebra A” to “and, on the Fredholm theory of CompactOperators, finite-slope theory over a commutative Noetherian K-Banach algebra A”.

## R04 (P3) — The description's supplier paragraphs predate the merge of the Coram roadmaps

**Location:** pull request description: “Supplier roadmaps by WilliamCoram now in pull requests: #930 (PadicFunctionalAnalysis), #932 (CompactOperators) and #937 (RigidAnalyticGeometry)”, and “Roadmaps already on main that the README cites (SchemeAndStackFoundations, PadicMeasuresIwasawaAlgebras, AdicSpacesPartII, RigidAnalyticGeometry …”.

**Claim:** all three roadmaps are on main, as the second sentence itself says of RigidAnalyticGeometry. RestrictedPowerSeries, the fourth supplier by the same author, is not named. The README never cites SchemeAndStackFoundations.

**Witness:** main `3cf7342` added PadicFunctionalAnalysis in `313bdca6` (2026-10-15), CompactOperators in `da437b14`, RigidAnalyticGeometry in `9d5af13c` and RestrictedPowerSeries in `9b855b8a`. `SchemeAndStackFoundations` occurs 0 times in `README.md` and in `Suggested.lean`.

**Repair:** delete the “Supplier roadmaps by WilliamCoram now in pull requests …” paragraph and write the next sentence as: “Roadmaps already on main that the README cites (PadicFunctionalAnalysis, CompactOperators, RestrictedPowerSeries and RigidAnalyticGeometry, the roadmaps of W. Coram; PadicMeasuresIwasawaAlgebras, AdicSpaces, AdicSpacesPartII, AdicSpacesPartIII, AdicSpacesPartIV, ReductiveGroups and ReductiveGroupsPartII) are consumed from main and are not prerequisites.”

## Previous findings

- R01 — repaired: line 647 “For the nilpotent N (e_1 ↦ e_0) with output-column bounds b_0 = 1, b_1 = 0, v_1 = N has norm 1 = max(b_0, b_1) and v_2 = N² = 0, as the product bound b_0b_1 = 0 forces.”
- R02 — repaired: line 454 “u_s = diag(p^(i+1))_(i<s) … ‖u − u_s‖ = p^(−s−1) … P_(u_s)(1) = ∏_(1≤i≤s)(1 − p^i) → ∏_(i≥1)(1 − p^i) = P_u(1), a unit of ℤ_p”.
- R03 — not repaired: line 1083 and ten copies still read “Unless the statement explicitly gives broader field hypotheses, K is a finite extension of Q_p … X is a compact … manifold, and an affinoid coefficient A …”. This is R02 above.
- R04 — repaired: line 829 “For u=1 and the monic Q=T−1 (unit constant coefficient −1) on a line, Q*(u)=1−u=0 and Q is not coprime to P_u=1−T.”

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| L450 Gauss convergence under a common column majorant (Check L454) | `u = diag(p^(i+1))`, truncations `u_s`, `p = 2` | `‖u − u_s‖ = p^(−s−1)`; output norms `r_j = p^(−j−1) = b_j` bound all `u_s`; `c_1(u_s) = −Σ_(i<s)p^(i+1) → −p/(1−p)`, at `p = 2` equal to `2` | ✓ |
| same, value at one | `s = 1, 2`; limit | `1 − p`; `(1 − p)(1 − p²) ≡ 1 mod p`; limit in `1 + pℤ_p`, nonzero. The old `diag(p^i)` gave `0 → 0` | ✓ discriminating |
| L640 adjugate bound (Check L647) | `N: e_1 ↦ e_0`, Convention 2 | `a_10 = 1`, so `r_0 = 1`, `r_1 = 0`; `V_1 = N + c_1 = N` (`c_1 = −tr N = 0`), norm `1 ≤ max = 1`; `V_2 = c_2 + N² = 0 ≤ b_0b_1 = 0` | ✓ |
| same, first Check | `diag(p, p²)` | `V_1 = diag(p,p²) − (p + p²) = diag(−p², −p)`, norm `p^(−1)`; `V_2 = p³ + diag(−p³, −p³) = 0 ≤ p^(−3)` | ✓ |
| L824 monic invertibility criterion (Check L829) | `Q = T − 1`, `u = 1` on a line | `Q* = 1 − T`, `Q*(u) = 0`; `P_u = 1 − T`; ideal `(T − 1)` not the unit ideal; rescaled `−Q = 1 − T` has `Q(0) = 1`, unit leading coefficient | ✓ |
| same, wrong model `Q(u)` for `Q*(u)` | `Q = T − c`, `u = a`, `c = 2`, `a = 1/2` | at L829 both `Q(1)` and `Q*(1)` vanish; §4.14 Check (L2853): `Q(u) = −3/2` invertible, `Q*(u) = 1 − ca = 0` | excluded by §4.14 |
| L97–99 PhiGamma contract (R01) | supplier head `e1f38c1` | §2.7 at line 1257, §2.8 at 1320, Layer 4 starts at §4.2; 0 occurrences of each of the 8 names | R01 |
| L1083 shared block (R02) | `K = 𝔽_p((t))`; §0.2, §2.2 | spherically complete and not finite over `ℚ_p`; 0 mentions of manifold, affinoid or slope in §§0.2, 2.2 | R02 |
| Description, layer paragraph (R03) | head L6–8, L21–23, L1485, L158 | `LA_h` from PadicFunctionalAnalysis §4.3; Amice bijection “Supplied by PadicFunctionalAnalysis §4.7”; spectral mapping from CompactOperators | R03 |
| Description, supplier paragraphs (R04) | main `3cf7342`; `grep` | 3 of 3 “in pull requests” are on main since 2026-10-15/16; SchemeAndStackFoundations: 0 citations | R04 |

The rows for the untouched statements, including the four Lean headlines (`Suggested.lean` is unchanged), stand as in the previous review, of `444887a`.

- Head `473fb50`: 3 README lines changed since `444887a`; `git diff --stat origin/main...HEAD` outside the folder is empty; the folder holds `README.md`, `Suggested.lean` and `metadata.toml` only.
- Gate run here: every scanner 0, `depcheck=0`, `OK` (exit 0), matching the worker's gate (`build=0`). Dependency check: `depcheck: 245 roadmaps, 2213 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- `lake env lean` on `Suggested.lean`: four `declaration uses 'sorry'` warnings (lines 61, 72, 116, 130), exit 0. The 8 elaborated signatures in `signatures.md` are unchanged and lose no binder.
- Supplier citations re-resolved, 5 roadmaps: CompactOperators on main §1.3 (line 389), §2.4 (580), §3.4 (739, criterion 761 → §4.14); PadicLocalLanglandsForGL2Qp §0.1 at `84416ad` (line 206, 5 of 5 names); CrystallineCohomology CR.6.2 (10451, 10496) and CR.6.5 (11099, 11101, 11183) at `b97c462`; PadicFunctionalAnalysis §§0.4–4.7 and RigidAnalyticGeometry §§2.1, 2.2, 7.2 at revision heads `89357f3`, `705e4f6`; PhiGammaModulesAndIwasawaCohomology at `e1f38c1`: R01.
- Description, other claims checked against the head and found to hold: Mathlib's bounded Amice transform (`AbstractMeasure.amiceTransform`, `Mathlib/NumberTheory/Padics/Measure/AmiceTransform.lean:76`), Tau Ceti's resultant–norm library (`AdjoinRoot.norm_mk_eq_resultant`), Convention 6 (no `IsCompactOperator`), Convention 9 (slope endpoint included), the carriers named in the summary, and the consumers named in it, which match `## Downstream consumers`.
- Overlap check: read PadicFunctionalAnalysis (main and the heads `89357f3`, `705e4f6`), CompactOperators, RestrictedPowerSeries, LocallyAnalyticDistributionsPartII (it cites §§0.0, 0.2 here), PadicDifferentialEquationsAndRigidCohomology and ColemanIntegration (both consumers of this roadmap). Shared objects: Fredholm theory on `c₀`, owned by CompactOperators and cited here; `LA_h` and the Amice bijection, owned by PadicFunctionalAnalysis and cited here; nothing else shared.
- Source independence: changed passages only. 3 changed Check bullets compared with CompactOperators §§1.3, 2.4, 3.4, the contracts they restate; they share only formulas. No layer was added, removed or reordered, so contents were not compared again. Largest share by a text count: Colmez, about 19 of roughly 125 source-bearing locators.

## Not verifiable

- Kohlhaase, Prop. 4.2 and Cor. 4.3 (§1.5): not re-read; outside the changed passages. The review of `444887a` found the scan image-only before OCR was installed on this worker.
- BGR, Ingleton, and Coleman's published pagination: as in the review of `444887a` (paywalled, historical attribution only, and the author manuscript read instead).

## Source issues

- none

## For the human reviewers

- none
