# Review of QDifferenceIsomonodromy (pull request #3020 at ad5ecff)

**Verdict:** accepted

**Summary.** Accepted: no statement, formula, Check or worked example of this head was found false, including the new material that moves the algebra onto the linearized modules of PhiGammaModulesAndIwasawaCohomology §§0.1–0.2 and adds scalar-extension models and relative connections for a general automorphism. The identities and examples of Layers 0–7 were recomputed (the rank-two Schlesinger example in exact arithmetic, both orders of the two steps) and the sampled locators were read in the sources. There are six small corrections and three format notes, none blocking; five of the six corrections were already raised on the previous head and are still open. Three points are left for the human reviewers.

## C01 — `Suggested.lean` states none of the roadmap's headline theorems, and its docstring does not say that they are not statable

A reader of the file cannot tell what the finished roadmap is tested against. The headline results of the Summary are the slope filtration with the classification of marked analytic modules by `H¹(E_q, Λ_I(A₀))` (§§3.2, 4.6), the representability of the marked functor by an affine space (§4.2), the global equivalence with connection data (§5.4), and the commuting discrete Schlesinger transformations on a nonempty Zariski-open set (§§7.3–7.5). The file has two theorems, the Sylvester equation and a one-step gauge identity, and its docstring (lines 9–15) still says only that it "gives suggested forms for selected algebraic targets".

None of the four is statable at the pins with simple definitions: the first three need slopes and purity over the field of meromorphic germs, holomorphic bundles on `ℂˣ/q^ℤ` with their sheaf cohomology, and meromorphic functions on `ℂˣ`; the fourth needs rational maps on the space of factors with prescribed spectra. The smallest change is one sentence per headline in the module docstring naming the carrier it lacks.

## C02 — Five definitions of `Suggested.lean` serve no theorem of the file

`Linearization`, `ScalarExtensionModels`, `FixedObjectModels`, `IsHorizontal` and `TimeSquare` (lines 25–55) appear in no stated theorem. The first three are abbreviations of Mathlib's `ModuleCat.extendScalars`, `CategoricalPullback` and `Core` and do match §§0.1–0.2 (objects `(N, M, α: F N ≅ M)`; for a fixed `M`, isomorphisms `u` with `α′ ∘ F u = α`), but as they stand the file is an interface sketch and nothing tests that they are usable. Either state one target on them or leave them to the README. Two that are short at the pins: §7.4's square as a `TimeSquare` of four `rightFactorGauge` matrices under the two Schlesinger relations, or the composition law of §0.3 for `IsHorizontal`.

## C03 — `rightFactorGauge_horizontal` does not need `q ≠ 0`, and it is the definition rearranged

With `R(z) = 1 − z⁻¹B` one has `z • 1 − B = z • R(z)` and, for `z ≠ 0`, `z • 1 − q⁻¹ • B = z • R(qz)` (also at `q = 0`, where Lean's `0⁻¹ = 0` makes both sides `z • 1`), so both sides of the statement are `z • (R(qz) * L * D * R(z))`. A copy of the theorem without `hq`, proved by these two rewritings and associativity, elaborates at the pins. At `z = 0` the statement fails (`−L D B` against `−q⁻¹ B L D`; a `1 × 1` instance over `ℚ` with `q = 2`, `L = D = B = 1` elaborates as a refutation), so `hz` is needed.

As a target it asks an implementer for little. Would you drop `hq` and mark it as a sanity check of the convention of §7.2, or state instead the two-factor refactorization of §7.1: for `X, Y` with disjoint spectra and the Sylvester solution `Λ` invertible, `(z − X)(z − Y) = (z − S)(z − T)` with `S = X + Λ⁻¹`, `T = Y − Λ⁻¹`, and `S, T` the only such pair with the spectra of `Y, X`?

## C04 — The theta function of §2.2 is that of RSZ13, not of the two sources cited, and S00 defines its functions in §0.1

§2.2 (line 451) cites `[S00, §1.1.2]` and `[S03, §1.2.2]` for `Θ_q(z) = Σ q^(−m(m+1)/2) z^m`, its zeros `−q^ℤ`, and `e_qc = (z/(qc)) e_c`. Both sources use `Σ (−1)ⁿ q^(−n(n−1)/2) zⁿ`, with zeros on `q^ℤ` and `Θ(qz) = −qzΘ(z)` (S00 line 151–157; S03 line 375–383), and S03 has `e_(q,qc) = z·e_(q,c)` (S03 line 400). The series of §2.2 is equation (1.3) of RSZ13 §1.3 (RSZ13 line 383–388). The README's formulas are correct for its own `Θ_q` (recomputed: `σ_qΘ_q = zΘ_q`, `Θ_q(−1) = 0` by pairing `m ↔ −1−m`, `e_qc = (z/(qc))e_c`), so only the pointer misleads: a reader who opens S00 or S03 finds other signs. Cite RSZ13 (1.3) for `Θ_q`, and say that S00 and S03 use the theta function with zeros on `q^ℤ`.

In S00 the functions `ℓ_q` and `e_(q,c)` are defined in §0.1; §1.1.2 says so itself (S00 line 361–362). So `[S00, §1.1.2]` is right for §2.3 and should be `[S00, §0.1]` in §2.2.

## C05 — In §2.1 the bundle `V_B` is cited to a section of S03 that does not contain it

In §2.1 (line 430), `[S03, §1.2]` stands after the bundle defined by `(z,v) ∼ (qz, B(z)v)` and its sections. S03 §1.2 is on Fuchsian equations and their local solutions (S03 line 339); the bundle and its sections are S03 §2.3.1 (S03 line 824–832). Cite `[S03, §2.3.1]`. The other half of this remark on the previous head, the locator of §5.4, is repaired: line 950 now cites VPR07 Theorem 4.3 for the Laurent models and S03 for the factorization used in Proposition 3.1.1.3.

## C06 — The link for Atiyah's paper is to a copy on another mathematician's page

The reference `[A57]` (line 1453) is labelled "Published text" and links a PDF on a personal page at Berkeley that is not the author's. Link the publisher's record instead, `https://doi.org/10.1112/plms/s3-7.1.414`, and keep the page numbers.

## N01 — Imports

`Suggested.lean` opens with seven `Mathlib.<submodule>` imports. The house form is the single line `import Mathlib`.

## N02 — Names

The README never mentions the eight declaration names of `Suggested.lean`, so a prose target cannot be matched to its formal statement. Naming `sylvester_existsUnique` in §7.1, `rightFactorGauge` in §7.2 and the two model abbreviations in §0.2 would do it.

## N03 — Descent along the finite cover has an owner that the `Needs` lines do not name

§§3.8, 4.6 and 5.3 list "finite descent along the isogeny", "descent along the finite analytic cover" and "finite analytic descent" without a supplier. The owners are already in the supplier table: ComplexManifolds Milestone 4 (descent of equivariant bundle maps and invariant sections along a free quotient) and ComplexTori Milestone 1 (the homomorphism of tori induced by a lattice inclusion, with its kernel). Naming them in the three lines would let an implementer find them.

## Verified sound

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §0.1 linearization vs semilinear operator (new) | `σ` automorphism; `𝔽_p[t]`, `σ(t) = t^p` | `L(a⊗m) = aΦ(m)`; Frobenius case: `L` invertible, image of `Φ` is `𝔽_p[t^p]`, `t` outside | holds; matches supplier §0.1 and KL15 Convention 1.5.1 | none |
| §0.2 tensor, dual, scalar change, models (sample) | balancing of `s⊗m ↦ τ(s)⊗Φm`; Check over `(ℂ[ε]/ε²)[z,z⁻¹] → ℂ({z})` | `τ(s f(a))⊗Φm = τ(s)⊗σ(a)Φm`; `1+ε` horizontal, extends to `1`, so nonidentity model automorphism | holds | C02 |
| §0.3 gauge, reversal | `G = z^m`, `A = c`; `r = 1/2`, `A = z−1`; `cz^m` | `q^m c`; `A^rev = (2z−1)⁻¹`; `c⁻¹r^m z^(−m)`; matrix of `L` is `A⁻¹` | holds | none |
| §1.3 Smith type and determinant divisor (sample) | `diag(t,t⁻¹)`; degree | Smith type `(−1,1)`, `d_A = 0`; `deg d_A = deg σ^*E − deg E = 0`; K16 Def. 1.6 gives pole/zero only | holds | none |
| §1.4 determinant divisor formula (sample) | `G = diag(z−a,1,…)`, simple zero at `a` | `d_(A′)(a) = 1+0−1 = 0`; `d_(A′)(a/q) = 0+1−0 = 1`; K16 Def. 1.7, (1.3) read | holds | none |
| §1.5 elementary modifications (sample) | zero case; pole case `G = diag(t⁻¹,1,…)` | ratio `(qz−a)/(z−a)`, degree `+1`; pole: `d(a) = −1+0+1 = 0`, `d(a/q) = −1`, degree `−1` | holds; agrees with §§1.4, 7.2 | none |
| §1.6 relative connections (new text) | `D` vs `2D`; `σ^*`; Check on `𝔾_m × ℙ¹` | same localization; `Supp σ^*D = σ⁻¹(Supp D)`; `π^*𝒪(1)` restricts to `𝒪(1)` on `z = 1`; Stacks 31.19.1, 31.19.3 read | holds | none |
| §1.8 endpoint localization (sample) | finite jet; moving pole `1/(z−s)` | `(𝒪/z^(m+1))[z⁻¹] = 0`; completing first gives `𝒪_S[[z]][z⁻¹]`; pole meets `z = 0` at `s = 0` | examples true; no locator | none |
| §2.2 theta, characters, q-logarithm | series; `z = −1`; `c ↦ qc` | `σ_qΘ = zΘ`; `Θ(−1) = 0`; `σ_q e_c = c e_c`; `σ_q ℓ = ℓ+1`; `e_qc = (z/(qc))e_c` | holds; sources use another theta | C04 |
| §2.3 constant systems (sample) | `C = [[1,1],[0,1]]` | `σ_q[[1,ℓ],[0,1]] = [[1,ℓ+1],[0,1]] = C·[[1,ℓ],[0,1]]`; S00 §1.1.2 read (line 357–377) | holds | none |
| §3.5 difference cohomology and Ext (sample) | rank one, slopes `−1, 0, 1`; `diag(1,z)` extension | `−1`: `Γ⁰ = 0`, `dim Γ¹ = 1`; `1`: `0, 0`; `f_m = −q^(m(m−1)/2)`; `δ_N` balanced, `ε δ = 0`; RSZ13 Prop. 2.1.3, Thm 3.1.1 | holds | none |
| §3.8 pure modules and semistable bundles (sample) | VPR07 Thm 2.3, Thm 2.5; rank 2, degree 1 | bijection on classes; `dim coker = −λ·dim M`; slope `1/2` example has `Φ² − q⁻¹z⁻¹`, `v₀(det A) = 1` | holds; A57 unread | none |
| §4.1 marked formal type (sample) | RSZ13 Def. 2.3.1, §3.1.2 | pairs `(M,g)`, `g = g′∘gr(f)`, `f` automatically an isomorphism; functor on `ℂ`-algebras (line 798–802, 1097–1103) | locators right | none |
| §4.2 normal form, representability (sample, headline) | ranks `(1,1)`, `(1,1,1)`, `(1,2)` | slopes `(0,3)`: 3; `(0,1,2)`: `1+2+1 = 4`; `(0,1/2)`: 1, ramified 2; RSZ13 Thm 3.1.4, 3.3.5 read | holds | none |
| §4.5 gap filtration, Stokes classes (sample) | block `(i,j)` | Hom bundle degree `rᵢrⱼ(μᵢ−μⱼ) < 0`, `χ = deg`, so `dim H¹ = rᵢrⱼ(μⱼ−μᵢ)`; RSZ13 Thm 4.4.1 read | holds; S24 print numbers unread | none |
| §4.6 correspondence for rational slopes (sample, headline) | `G_(k+1) = Gₖ^j G`, `Gᵣ = I` | `H^jG = r⁻¹(G₁+…+Gᵣ) = H`; S24 preprint Prop. 7 prints `r+1` terms | holds with `r` terms | source issue |
| §5.1 Laurent models (sample) | `A = cz^m` at infinity; fibre of an equivalence | `D(w) = c⁻¹q^m w^m`, slope `m`; `B_∞(z) = D(1/(qz))⁻¹`; VPR07 Lemma 4.2, Thm 4.3, Obs. 4.5 read | holds | none |
| §5.4 global equivalence (headline) | objects and maps | `(σF₀)B₀F₀⁻¹ = (σF_∞)B_∞F_∞⁻¹ ⇔ (σR)B₀ = B_∞R` | holds | none |
| §5.5 connection matrix | `P = E_(C_∞)⁻¹ M E_(C₀)`; `q = 2`, systems 1 and 3 | `σ_qP = E⁻¹C_∞⁻¹(C_∞MC₀⁻¹)C₀E = P`; `3 ∉ 2^ℤ` | holds | none |
| §6.4 gauge test by connection matrices (sample) | `P′ = P` | `Y′₀Y₀⁻¹ = Y′_∞Y_∞⁻¹` on the overlap; rational under the extension hypotheses; S03 §3.1 (line 969) | holds | none |
| §§6.2, 6.7 time square, continuous equations | `I+E₁₂`, `I+E₂₁`; `B = z²/(z²−s)`; `B = (I+sE₁₂)(I+tE₂₁)` | products `[[2,1],[1,1]] ≠ [[1,1],[1,2]]`; `AB = 4z²/(4z²−s)`; `Ωₜ = [[s,−s²],[1,−s]]`, both sides `[[1,−2s],[0,−1]]` | holds | none |
| §7.1 refactorization, `sylvester_existsUnique` | identity `ST = XY`; empty index; one-tactic probe | `Λ(−XΛ⁻¹+Λ⁻¹Y−Λ⁻²)Λ = YΛ−ΛX−I = 0`; `simp`, `rfl`, `exact?` do not close it | holds; not in the libraries | none |
| §7.2 gauge step, `rightFactorGauge_horizontal` | `q = 0`; `z = 0`; `B₁` of the example | `7B₁ = [[27,24],[2,29]]` is a right root, `tr 8`, `det 15`; `z = 0`: `−LDB` vs `−q⁻¹BLD` | holds; `hq` unused | C03 |
| §7.3 step equation (headline) | `d = 1`; `q = 2` example | `C′ = q⁻¹L⁻¹CL`; `i = 1` then `i = 2` and `i = 2` then `i = 1` both give `[[3/2,−1/2],[0,5/2]]`, `[[5/2,−3],[1,13/2]]` exactly | holds | none |
| §7.4 q-Schlesinger equations (headline) | same example | `C(k+e₂) = ([[55,−65],[32,161]]/27, [[187,22],[−10,299]]/54)`; `C₁(k)` is a right root there, so `C₁(k) = B₁(k+e₂)` | holds | none |
| §7.5 lattice action (sample) | Smith types of `Rᵢ`; `d = 1` | `det Rᵢ = ∏(z−a)/zⁿ`: `(−1,…,−1)` at 0, `(0,…,0,1)` at each `a`; `C(k) = q^(−k)L^(−k)C(0)L^k` | holds; no locator | none |
| Reuse table, Mahler row (new) | R16 p. 2 | `z = e^u` turns the germ at `z = 1` into a `q`-difference equation with `q = ℓ` at `u = 0` (R16 line 45–47) | locator right | none |

- Source locators checked against the text: 38 in eleven texts (KL15, R16, S00, S03, VPR07, RSZ13, S24 preprint, K16 and three Stacks Project chapters), all right except those of C04 and C05; one misprint in a source.
- Library declarations opened at the pins (Mathlib 1b1ccf4, Tau Ceti 2fd255d): `CategoricalPullback` (`Mathlib/CategoryTheory/Limits/Shapes/Pullback/Categorical/Basic.lean:81`), `Core` (`Mathlib/CategoryTheory/Core.lean:37`), `SkewMonoidAlgebra.liftNCRingHom` (`Basic.lean:742`), `single_mul_single` (`:1042`), `singleOneRingHom` (`:1047`), `FiniteLocallyFreeSheaf.finiteProjectiveEquiv` (`TauCeti/AlgebraicGeometry/VectorBundle/Affine/Basic.lean:112`), `ModuleCat.hasLeftDualOfFiniteProjective` (`…/FiniteProjective/Dualizable.lean:39`), `ModuleCat.dualTensorIhom_app_eq` (`…/DualTensorIhom.lean:69`), `homCokernelEquivExt` (`…/Ext/Presentation.lean:88`), `jordanDecomposition` (`…/JordanChevalley/Multiplicative.lean:233`); all 31 linked files exist. No Sylvester-equation theorem for matrices in either library.
- Cross-roadmap citations resolved on main: 14 roadmaps, 71 sections, layers or milestones, all present under the cited ids, including the two new anchors into PhiGammaModulesAndIwasawaCohomology §§0.1–0.2, whose text supplies what §§0.1–0.2 and 3.5 take from it.
- Dependency check: `depcheck: 132 roadmaps, 1468 edges, 0 problem(s)`; no UPWARD or CYCLE line. The pull request changes nothing outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` gives two `sorry` warnings and nothing else; no `set_option`, no sorried data; `#check` of the eight declarations compared with the README, no needed binder lost.
- Pull request text read against the head: eight layers, 51 numbered targets, two admitted theorems, the reuse of the supplier's linearized modules, suppliers on main; nothing contradicted.
- Earlier remarks on this head: the §5.4 half of the locator correction is repaired; the other five corrections and both format notes stand as C01–C06, N01–N02; the question on the isogeny is settled by ComplexTori Milestone 1 (N03).
- Overlap check: read PainleveEquations, PadicDifferentialEquationsAndRigidCohomology, VectorBundlesAndIsocrystals, CountingBundlesAndHallAlgebrasOfCurves, TriangulineVarietyAndItsLocalModel; nothing shared. Linearized modules and their two-term complex are owned by PhiGammaModulesAndIwasawaCohomology and cited; OperatorTheory's Sylvester equations are for operators with domains, not the matrix statement of §7.1.

Source independence: 12 passages compared with 7 sources, none shared; largest share RSZ13, 17 of 70 locators; contents compared with RSZ13: independent (its chapters 2–6 are spread over Layers 0, 3 and 4 in another order). The published text of S24 and A57 could not be read.

Research link: Layers 3–4 state the local analytic classification of Ramis–Sauloy–Zhang (2013) and Sauloy (2024); Layer 5 extends Sauloy's (2003) form of Birkhoff's classification using van der Put–Reversat (2007); Layer 7 is Borodin's (2004) q-Schlesinger system. Rests on the sources read.

## Not verifiable

- S24, published version: the journal's host is not one the sources service reads; the content was checked in arXiv:2006.03237v1, whose statements are numbered differently (Théorème 2, Lemme 1, Corollaire 3, Propositions 5–7, Théorème 4), so the printed numbers 3.1–3.13 and §§1.4, 2.3.2, 3.2.2 were not confirmed.
- A57 (Atiyah 1957): paywalled at the publisher, and the linked copy is not a legal place to read it; the lemma numbers and pages of §3.8 were not checked.

Automatic checks set aside as false positives: the report that FormalLaurentPuiseux has no Layer 1 (its layers are headed L1, L4 and L6 and exist on main); the report that the two model abbreviations lost their category instances (the elaborated types carry them) and that the gauge definition lost a finiteness binder (its body does not use one).

## Source issues

- **Misprint** in S24 at the proof of Proposition 7 of arXiv:2006.03237v1, p. 26, S24 line 1046 (Proposition 3.11 in print, by the README's note): the source says the averaged gauge is one over r times a sum of r+1 iterates, counting the identity twice; it should be the sum of the r iterates G₀ = I, …, G_(r−1), so that H = HʲG holds; affects the proof.

## For the human reviewers

- Licence: the reference A57 (README line 1453) links a PDF of Atiyah's 1957 paper on another mathematician's page at Berkeley, labelled "Published text"; C06 asks for the DOI instead.
- Not tested: the published S24 (Ann. Fac. Sci. Toulouse 33) could not be fetched; wording and locators were compared with its arXiv preprint only. R16 is an author's manuscript dated 2016, cited once for a remark.
- Scope: B04 states the q-difference equations (3q)–(7q) without proof; Layer 7 transposes its §4 through Remark 4.14. No cited source states the global equivalence of §5.4 for arbitrary slopes; M19 is an unrefereed preprint.
