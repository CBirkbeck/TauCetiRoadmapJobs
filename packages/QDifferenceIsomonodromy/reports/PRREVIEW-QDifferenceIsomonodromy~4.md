# Review of QDifferenceIsomonodromy (pull request #3020 at 61d3245)

**Verdict:** accepted

**Summary.** Accepted: the change of the analytic convention from `|q| > 1` to `0 < |q| < 1` was followed through every formula, Check and example that depends on it (slopes, Newton polygon, theta function, Birkhoff–Guenther window, summation equation, extension of local maps, the worked examples at `q = 1/2`), and nothing was found false or inconsistent. The new coefficient recurrences of §§3.5, 4.2 and 4.3 were recomputed, the rank-two Schlesinger example was redone in exact arithmetic, and the sampled locators were read in the sources, this time including the published text of S24. There are six small corrections and three format notes, none blocking; all nine were raised on the previous head and none is repaired (one is restated for the new theta function). Three points are left for the human reviewers.

## C01 — `Suggested.lean` states none of the roadmap's headline theorems, and its docstring does not say that they are not statable

A reader of the file cannot tell what the finished roadmap is tested against. The headline results of the Summary are the slope filtration with the classification of marked analytic modules by `H¹(E_q, Λ_I(A₀))` (§§3.2, 4.6), the representability of the marked functor by an affine space (§4.2), the global equivalence with connection data (§5.4), and the commuting discrete Schlesinger transformations on a nonempty Zariski-open set (§§7.3–7.5). The file has two theorems, the Sylvester equation and a one-step gauge identity, and its docstring (lines 9–15) says only that it "gives suggested forms for selected algebraic targets".

None of the four is statable at the pins with simple definitions: the first three need slopes and purity over the field of meromorphic germs, holomorphic bundles on `ℂˣ/q^ℤ` with their sheaf cohomology, and meromorphic functions on `ℂˣ`; the fourth needs rational maps on the space of factors with prescribed spectra. The smallest change is one sentence per headline in the module docstring naming the carrier it lacks.

## C02 — Five definitions of `Suggested.lean` serve no theorem of the file

`Linearization`, `ScalarExtensionModels`, `FixedObjectModels`, `IsHorizontal` and `TimeSquare` (lines 25–55) appear in no stated theorem. The first three are abbreviations of Mathlib's `ModuleCat.extendScalars`, `CategoricalPullback` and `Core` and do match §§0.1–0.2, but nothing tests that they are usable. Either state one target on them or leave them to the README. Two that are short at the pins: §7.4's square as a `TimeSquare` of four `rightFactorGauge` matrices under the two Schlesinger relations, or the composition law of §0.3 for `IsHorizontal`.

## C03 — `rightFactorGauge_horizontal` does not need `q ≠ 0`, and it is the definition rearranged

With `R(z) = 1 − z⁻¹B` one has `z • 1 − B = z • R(z)` and, for `z ≠ 0`, `z • 1 − q⁻¹ • B = z • R(qz)` (also at `q = 0`, where `0⁻¹ = 0` in Lean), so both sides are `z • (R(qz) * L * D * R(z))`. A copy of the theorem without `hq`, proved by these two rewritings and associativity, elaborates at the pins. At `z = 0` the statement fails (`−L D B` against `−q⁻¹ B L D`), so `hz` is needed.

As a target it asks an implementer for little. Would you drop `hq` and mark it as a sanity check of the convention of §7.2, or state instead the two-factor refactorization of §7.1: for `X, Y` with disjoint spectra and the Sylvester solution `Λ` invertible, `(z − X)(z − Y) = (z − S)(z − T)` with `S = X + Λ⁻¹`, `T = Y − Λ⁻¹`?

## C04 — The theta function, character and logarithm of §2.2 are not those of the two sources cited for them

§2.2 (lines 441–451) now uses `Θ_q(z) = Σ q^(m(m − 1)/2) z^m`, `e_c = Θ_q(z)/Θ_q(cz)`, `ℓ_q = −zΘ′_q/Θ_q`, with `e_(qc) = cz e_c`, and cites `[S00, §1.1.2]` and `[S03, §1.2.2]`. Both sources work with `|q| > 1` and the series `Σ (−1)ⁿ q^(−n(n−1)/2) zⁿ`, zeros on `q^ℤ`, `Θ(qz) = −qzΘ(z)`, `ℓ = zΘ′/Θ`, `e_c = Θ(z)/Θ(z/c)` and `e_(qc) = z e_c` (S03 line 375–400; S00 line 151–157). The README's formulas are correct for its own functions (recomputed: `σ_qΘ_q = z⁻¹Θ_q`; `Θ_q(−1) = 0` by pairing `m ↔ 1 − m`; `σ_q e_c = c e_c`; `σ_q ℓ_q = ℓ_q + 1`; `e_(qc) = cz e_c`), so only the pointer misleads: a reader who opens either source finds other signs and another character shift. The nearest printed form is VPR07 §1.1 (VPR07 line 123–135), whose `Θ` is `Θ_q(−z)` for the same `|q| < 1`. Cite it for `Θ_q`, and say that S00 and S03 use the expanding shift and the theta function with zeros on `q^ℤ`.

In S00 the functions `ℓ_q` and `e_(q,c)` are defined in §0.1; §1.1.2 says so itself (S00 line 361–362). So `[S00, §1.1.2]` is right for §2.3 and should be `[S00, §0.1]` in §2.2.

## C05 — In §2.1 the bundle `V_B` is cited to a section of S03 that does not contain it

In §2.1 (line 430), `[S03, §1.2]` stands after the bundle defined by `(z,v) ∼ (qz, B(z)v)` and its sections. S03 §1.2 is on Fuchsian equations and their local solutions (S03 line 339); the bundle and its sections are S03 §2.3.1 (S03 line 824–843). Cite `[S03, §2.3.1]`.

## C06 — The link for Atiyah's paper is to a copy on another mathematician's page

The reference `[A57]` (line 1479) is labelled "Published text" and links a PDF on a personal page at Berkeley that is not the author's. Link the publisher's record instead, `https://doi.org/10.1112/plms/s3-7.1.414`, and keep the page numbers.

## N01 — Imports

`Suggested.lean` opens with seven `Mathlib.<submodule>` imports. The house form is the single line `import Mathlib`.

## N02 — Names

The README never mentions the eight declaration names of `Suggested.lean`, so a prose target cannot be matched to its formal statement. Naming `sylvester_existsUnique` in §7.1, `rightFactorGauge` in §7.2 and the two model abbreviations in §0.2 would do it.

## N03 — Descent along the finite cover has an owner that the `Needs` lines do not name

§§3.8, 4.6 and 5.3 list "finite descent along the isogeny", "descent along the finite analytic cover" and "finite analytic descent" without a supplier. The owners are already in the supplier table: ComplexManifolds Milestone 4 and ComplexTori Milestone 1. Naming them in the three lines would let an implementer find them.

## Verified sound

Earlier remarks, checked on this head: C01 (headlines not named in the docstring) not repaired, the Lean file is unchanged; C02 not repaired; C03 not repaired; C04 not repaired, and restated above because §2.2 now has another theta function while the two citations stay; C05 not repaired ("`[S03, §1.2][S03]`" still closes §2.1); C06 not repaired (the Berkeley link stands); N01–N03 not repaired. The S24 link now points to an open archive, and its printed numbering was read.

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: slope sign, endpoints | rank one `A = cz^(−m)`; `w = 1/z`; reversal | `Φ(1) = c⁻¹z^m`, points `(0,m),(1,0)`, slope `m`; raw at ∞: `C = cw^m`, `−m`; reversed `c⁻¹q^(−m)w^(−m)`, `m` | holds; VPR07 §1.3 has `Φe = cz^t e` slope `t` | none |
| §0.1 linearization vs semilinear operator (sample) | `σ` automorphism; supplier text; KL15 Conv. 1.5.1 | `L(a⊗m) = aΦ(m)`; supplier §0.1 has `F(m) = L(1⊗m)`, no inverse of `σ`; KL15 line 938 | holds | none |
| §0.3 reversal, Layer 0 example | `q = 1/2`, `A = z − 1`; `cz^m` | `σ⁻¹(A)⁻¹ = (2z − 1)⁻¹`; `c⁻¹r^m z^(−m)`; `G = z^m`: `c ↦ q^m c` | holds | none |
| §0.4 coefficient fields (sample) | `q` of infinite order; `z = u^r`, `p^r = q` | `f(qz) = f` forces `(q^n − 1)fₙ = 0`; basis `1,…,u^(r−1)`, deck group `μᵣ`; RSZ13 §2.1.1, VPR07 §1.1 read | holds | none |
| §1.8 endpoint localization (sample) | finite jet; moving pole `1/(z − s)` | `(𝒪/z^(m+1))[z⁻¹] = 0`; completing first gives `𝒪_S[[z]][z⁻¹]`; pole meets `z = 0` at `s = 0` | examples true; no locator | none |
| §2.2 theta, character, q-logarithm (sample) | series; `z = −1`; `c ↦ qc` | `σ_qΘ = z⁻¹Θ`; `Θ(−1) = 0`; `σ_q e_c = ce_c`; `σ_qℓ = ℓ + 1`; `e_(qc) = cz e_c` | holds; sources use other functions | C04 |
| §2.3 constant systems (sample) | `C = [[1,1],[0,1]]`; `c → qc` | `σ_q[[1,ℓ],[0,1]] = C·[[1,ℓ],[0,1]]`; `H = z`: `qz·c = qc·z`; S00 §1.1.2 line 357 | holds | none |
| §2.4 nonresonant reduction | coefficient of `z^m` in `(σH)C = AH` | `q^m HₘC − CHₘ = Σ AⱼH_(m−j)`; operator tends to `X ↦ −CX` as `q^m → 0` | holds | none |
| §2.5 regular singular morphisms (sample) | `H = Σ Hₘz^m`; eigenvalues in `|q| < |c| ≤ 1` | `q^m HₘC = DHₘ`; `q^m α = β` in the annulus forces `m = 0`; S03 Lemma 2.1.3.2 line 640 | holds | none |
| §3.1 degree, Layer 3 example 1 | `A = [[0,z⁻¹],[1,0]]` | `Φ²e₁ = qz e₁`, points `(0,1),(2,0)`, slope `1/2` twice; `−v₀(det A) = 1` | holds | none |
| §3.2 slope filtration (headline) | `diag(1,z⁻¹)` to `[[1,z⁻¹],[0,z⁻¹]]`; reverse order | `σ_q f − zf = 1`, `fₘ = q^(−m(m+1)/2)`, radius 0; reverse: `fₘ = q^(m−1)f_(m−1) − u_(m−1)` converges | holds; VPR07 line 199–204 | none |
| §3.5 difference cohomology | rank one, slopes `−d, 0, d` | `q^n xₙ − Cx_(n−d) = yₙ`: kernel 0, band `0 ≤ n < d` independent modulo image; slope `d`: forward recurrence, both 0; slope 0: 1, 1 | holds; VPR07 Thm 2.5 | none |
| §3.7 bundle degree | line with factor `z⁻¹` | `Θ_q` is a section with one simple zero, degree 1 = slope of `A = z⁻¹`; VPR07: `Φe = z⁻¹e` gives `𝒪(−[1])` | holds | none |
| §4.2 normal form, representability (headline) | two blocks, gap `δ`; ranks `(1,1)`, `(1,1,1)`, `(1,2)` | `(σX)Cⱼ − z^δCᵢX = z^(μⱼ)U`; window `−μⱼ ≤ ℓ < −μᵢ`; dimensions 3, `1+2+1 = 4`, 1 (ramified 2) | holds | none |
| §4.3 summation (sample) | block `(i,j)`; `A₀ = diag(1,a/z)`, `U = z⁻¹`, `c = a` | `σθ_c = (c/z)θ_c`; displayed equation rederived; operator `q^n XCⱼ − c^δCᵢX`; constant terms 1 and 0 | holds; S24 Thm 3.1, Lemma 3.2 line 652–694 | none |
| §4.4 Stokes sheaf | block of `(σS)A₀ = A₀S` | `σS_ij = z^(μⱼ−μᵢ)CᵢS_ijCⱼ⁻¹`, factor of degree `−rᵢrⱼδ`; S24 Cor. 3.4 line 732 | holds | none |
| §4.5 gap filtration, Stokes classes (sample) | block `(i,j)` | Hom bundle degree `rᵢrⱼ(μᵢ − μⱼ) < 0`, `χ = deg`, `dim H¹ = rᵢrⱼ(μⱼ − μᵢ)`; RSZ13 Thm 4.4.1 line 2226; S24 Thm 3.5 line 752 | holds | none |
| §4.6 rational slopes (headline) | `G_(k+1) = Gₖ^jG`, `Gᵣ = I` | `H^jG = r⁻¹(G₁ + … + Gᵣ) = H`; with `r + 1` terms the sums differ by `G₁ − I` | holds with `r` terms | source issue |
| §5.1 Laurent models, extension | `A = cz^(−m)`; `H(z) = B(z)⁻¹H(qz)A(z)` | `B_∞(z) = D(1/(qz))⁻¹` from `C(qw)⁻¹ = D(w)`; `qz` nearer 0 for `|q| < 1` | holds; VPR07 Thm 4.3 line 1021 | none |
| §5.2 Birkhoff factorization (sample) | two factorizations; rank 0 | `F′₀F₀⁻¹ = F′_∞F_∞⁻¹` meromorphic on `ℙ¹`, so rational; S00 §2.2 line 746, S03 Prop. 3.1.1.3 line 1056 | holds | none |
| §5.4 global equivalence (sample, headline) | objects and maps; `A = z − a` | `(σF₀)B₀F₀⁻¹ = (σF_∞)B_∞F_∞⁻¹ ⇔ (σR)B₀ = B_∞R`; endpoint slopes 0 and −1 | holds | none |
| §5.5 connection matrix | `P = E_(C_∞)⁻¹ME_(C₀)`; systems 1, 3 at `q = 1/2` | `σ_qP = P`; gauge needs `g(qz) = 3g(z)`, so `q^m = 3` | holds | none |
| §5.6 forgetful functors (sample) | theta section | `Θ_q` maps the trivial bundle to the degree-one line; `Hom` of the slope 0 and 1 modules is 0 | holds; RSZ13 §6.3.1 line 3740 | none |
| §6.1 transport (sample) | composable arrows | full faithfulness of §5.4 gives unique `B_g` with `B_(hg) = B_hB_g` from `b_(hg) = b_hb_g` | holds | none |
| §6.2 time square (sample), `TimeSquare` | `A = I₂`, `I + E₁₂`, `I + E₂₁`; reversal | products `[[2,1],[1,1]] ≠ [[1,1],[1,2]]`; `A ↦ A(q⁻¹z)⁻¹`; B04 (3q)–(7q) line 247–256 | holds | none |
| §6.3 uniqueness of transport (sample) | two horizontal maps equal at `z₀` | difference vanishes on `q^ℤz₀`, an infinite set; a nonzero rational function has finitely many zeros | holds | none |
| §6.4 gauge test (sample) | `P′ = P` | `Y′₀Y₀⁻¹ = Y′_∞Y_∞⁻¹` on the overlap; rational under the extension hypotheses; S03 §3.1 line 969 | holds | none |
| §6.7 continuous equations | `q = 1/2`, `B = z²/(z² − s)`; `B = (I + sE₁₂)(I + tE₂₁)` | `AB = z²/(z² − 4s) = B(z/2)`; `∂ₛA = 3z²/(z² − 4s)²` both sides; `Ωₜ = [[s,−s²],[1,−s]]`, both `[[1,−2s],[0,−1]]` | holds | none |
| §7.1 `sylvester_existsUnique` | one-tactic probe | `simp`, `rfl`, `aesop` do not close it; no matrix Sylvester-equation theorem in either library | holds | none |
| §7.2 `rightFactorGauge_horizontal` | `q = 0`; `z = 0`; example `B₁` | `7B₁ = [[27,24],[2,29]]`, `tr 8`, `det 15`; copy without `hq` elaborates | holds; `hq` unused | C03 |
| §7.3 step equation (headline) | `d = 1`; `q = 1/2` example, both orders | `C′ = q⁻¹L⁻¹CL`; both orders give `[[6,−2],[0,10]]`, `[[10,−12],[4,26]] = 2L⁻¹CᵢL`; step equation exact for `i = 1, 2` | holds | none |
| §7.4 q-Schlesinger equations (headline) | same example | `B₁(k) − B₁(k+e₂) = B₂(k) − B₂(k+e₁)`; `B₂(k+e₁)B₁(k) = B₁(k+e₂)B₂(k)`; `C₁(k) = B₁(k+e₂)`: all exact | holds | none |

- Source locators checked against the text: 31 in seven texts (KL15, S00, S03, VPR07, RSZ13, S24 as published, B04), all right except those of C04 and C05; one error in a source. K16, R16, S09, M19 and the Stacks Project tags were not reopened this round.
- Library declarations opened at the pins: `CategoricalPullback` (`Mathlib/CategoryTheory/Limits/Shapes/Pullback/Categorical/Basic.lean:81`), `Core` (`Mathlib/CategoryTheory/Core.lean:37`), `liftNCRingHom` (`Mathlib/Algebra/SkewMonoidAlgebra/Lift.lean`), `TauCeti.homCokernelEquivExt` (`TauCeti/Algebra/Homology/Ext/Presentation.lean:88`); the linked germ, Jordan, affine-bundle and skew-polynomial files exist. The two Tau Ceti files that mention Sylvester (`LinearAlgebra/Matrix/InvSub.lean`, `LinearAlgebra/Matrix/Rank.lean`) hold the determinant identity and the rank inequality, not the equation of §7.1.
- Cross-roadmap citations resolved on main: all 14 supplier roadmaps exist; PhiGammaModulesAndIwasawaCohomology §§0.1–0.2 read at their anchors; FormalLaurentPuiseux has L1, L4 and L6.
- Dependency check: `depcheck: 94 roadmaps, 1058 edges, 0 problem(s)`; no UPWARD or CYCLE line. The pull request changes nothing outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` gives two `sorry` warnings and nothing else; no `set_option`, no sorried data; the file is unchanged since the previous head, and the eight elaborated types were compared with the README again, no needed binder lost.
- Pull request text read against the head: eight layers, 51 numbered targets (5+8+5+8+7+6+7+5), two admitted theorems, `0 < |q| < 1`, the `q = 1/2` checks, suppliers on main; nothing contradicted.
- Overlap check: read PainleveEquations, PadicDifferentialEquationsAndRigidCohomology, VectorBundlesAndIsocrystals, CountingBundlesAndHallAlgebrasOfCurves, TriangulineVarietyAndItsLocalModel; nothing shared. PainleveEquations excludes difference and q-difference dynamics in its scope; linearized modules and their two-term complex are owned by PhiGammaModulesAndIwasawaCohomology and cited; a search of all open heads and main for q-difference modules, q-Stokes data, Birkhoff factorization and the matrix Sylvester equation found no second owner.

Source independence: 11 passages compared with 6 sources, none shared; largest share RSZ13, 17 of 73 locators; contents compared with RSZ13: independent (its chapters 2–6 are spread over Layers 0, 3 and 4, with its chapter 5 before its chapter 4 here, and Layer 3 also carries the bundle theory of VPR07). The text of A57 could not be read.

Research link: Layers 3–4 state the local analytic classification of Ramis–Sauloy–Zhang (2013) and Sauloy (2024); Layer 5 extends Sauloy's (2003) form of Birkhoff's classification using van der Put–Reversat (2007); Layer 7 is Borodin's (2004) q-Schlesinger system. Rests on the sources read.

## Not verifiable

- A57 (Atiyah 1957): paywalled at the publisher, and the linked copy is not a legal place to read it; the lemma numbers and pages of §3.8 were not checked.

Automatic checks set aside as false positives: the report that FormalLaurentPuiseux has no Layer 1 (its layers are headed L1, L4 and L6 and exist on main); the report that the two model abbreviations lost their category instances (the elaborated types carry them) and that the gauge definition lost a finiteness binder (its body does not use one).

## Source issues

- **Error** in S24 at the proof of Proposition 3.11, p. 677 (S24 line 1268–1280): the source says the averaged gauge is one over r+1 times the sum of the r+1 iterates G(0), …, G(r), and that composing with G returns it; it should be the average of the r iterates G(0), …, G(r−1), since with r+1 terms the two sums differ by G(1) − I; affects the proof.

## For the human reviewers

- Licence: the reference A57 (`TauCetiRoadmap/QDifferenceIsomonodromy/README.md` line 1479) links a PDF of Atiyah's 1957 paper on another mathematician's page at Berkeley, labelled "Published text"; C06 asks for the DOI instead.
- Not tested: A57 could not be read, so the lemma numbers cited in §3.8 are unchecked. R16 is an author's manuscript dated 2016, cited once for a remark.
- Scope: B04 states the q-difference equations (3q)–(7q) without proof; Layer 7 transposes its §4 through Remark 4.14. No cited source states the global equivalence of §5.4 for arbitrary slopes; M19 is an unrefereed preprint.
