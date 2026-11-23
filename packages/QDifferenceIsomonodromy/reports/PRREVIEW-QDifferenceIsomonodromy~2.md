# Review of QDifferenceIsomonodromy (pull request #3020 at fb49452)

**Verdict:** accepted

**Summary.** Accepted: no statement, formula, Check or worked example was found false. Every displayed identity and every worked example of Layers 0–7 was recomputed, including the rank-two Schlesinger example by exact arithmetic, and the sampled locators were read in the sources. There are six small corrections (the acceptance file states none of the headline theorems and does not say why; four locator or link slips; one unnecessary hypothesis) and two format notes, none blocking. Three points are left for the human reviewers: a link to a third party's copy of Atiyah's paper, the published text of one source that could not be read, and two headline results that no cited source proves in the generality stated.

## C01 — `Suggested.lean` states none of the roadmap's headline theorems, and its docstring does not say that they are not statable

A reader of the file cannot tell what the finished roadmap is tested against. The Summary's headline results are the slope filtration with the classification of marked analytic modules by `H¹(E_q, Λ_I(A₀))` (§§3.2, 4.6), the representability of the marked functor by an affine space (§4.2), the global equivalence with connection data (§5.4), and the commuting discrete Schlesinger transformations (§§7.3–7.5). The file has two theorems, the Sylvester equation and a one-step gauge identity, and its docstring (lines 6–11) says only that it "gives suggested forms for selected algebraic targets".

None of the four is statable at the pins with simple definitions: the first three need the field of meromorphic germs with its `q`-shift as a difference field, holomorphic bundles on `ℂˣ/q^ℤ` and their sheaf cohomology, and meromorphic functions on `ℂˣ`; the fourth needs rational maps on the space of factors with a prescribed spectrum. The smallest change is one sentence per headline in the module docstring naming the carrier it lacks.

## C02 — Four definitions of `Suggested.lean` serve no theorem of the file

`DifferenceModule`, `DifferenceModule.Hom`, `IsHorizontal` and `TimeSquare` (lines 18–55) appear in no stated theorem, so they are an interface sketch and the build does not test that they are usable. Either state one target on them, or leave them to the README. Two that are short at the pins: §7.4's square for the gauges of §7.2 as a `TimeSquare` of four `rightFactorGauge` matrices under the two Schlesinger relations, or §0.3's composition law for `IsHorizontal`.

## C03 — `rightFactorGauge_horizontal` does not need `q ≠ 0`, and it is the definition rearranged

With `R(z) = 1 − z⁻¹B` one has `z • 1 − B = z • R(z)` and `z • 1 − q⁻¹ • B = z • R(qz)` for `z ≠ 0`, and both sides of the statement equal `z • (R(qz) * L * D * R(z))`. The second identity also holds at `q = 0` with Lean's `0⁻¹ = 0` (both sides are `L D (z − B)`), so `hq` is unused: a six-line proof without it elaborates in a scratch file. At `z = 0` the statement fails (`−L D B` against `−q⁻¹ B L D`), so `hz` is needed.

As a target it asks an implementer for very little. Would you drop `hq` and mark it as a sanity check of the convention of §7.2, or state instead the uniqueness of the refactorization of §7.1: for `X, Y` with disjoint spectra and the Sylvester solution `Λ` invertible, `(z − X)(z − Y) = (z − S)(z − T)` with `S = X + Λ⁻¹`, `T = Y − Λ⁻¹`, and `S, T` the only such pair with the spectra of `Y, X`?

## C04 — The theta function of §2.2 is that of RSZ13, not of the two sources cited, and S00 defines its functions in §0.1

§2.2 (line 365) cites `[S00, §1.1.2]` and `[S03, §1.2.2]` for `Θ_q(z) = Σ q^(−m(m+1)/2) z^m`, its zeros `−q^ℤ`, and `e_qc = (z/(qc)) e_c`. Both sources use `Σ (−1)ⁿ q^(−n(n−1)/2) zⁿ`, with zeros on `q^ℤ` and `Θ(qz) = −qzΘ(z)` (S00 line 151–157; S03 line 375–382), and S03 normalises so that `e_(q,qc) = z·e_(q,c)` (S03 line 399–401 and 418). The series of §2.2 is equation (1.3) of RSZ13 §1.3.1 (RSZ13 line 383–388). The README's three formulas are correct for its own `Θ_q` (recomputed: `σ_q Θ_q = zΘ_q`, `Θ_q(−1) = 0`, `e_qc = (z/(qc))e_c`), so only the pointer misleads: a reader who opens S00 or S03 finds other signs. Cite RSZ13 §1.3.1 for `Θ_q`, and say that S00 and S03 use the theta function with zeros on `q^ℤ`.

In S00 the functions `ℓ_q` and `e_(q,c)` are defined in §0.1; §1.1.2 says so itself (S00 line 361–362) and builds the constant-coefficient solutions from them. So `[S00, §1.1.2]` is right for §2.3 and should be `[S00, §0.1]` in §2.2.

## C05 — Two locators point at the wrong section or the wrong statement

In §2.1 (line 344), `[S03, §1.2]` is cited for the bundle `V_B` defined by `(z,v) ∼ (qz, B(z)v)`. S03 §1.2 is on Fuchsian equations; the bundle and its sections are S03 §2.3.1 (S03 line 827–843).

In §5.4 (line 845), `[VPR07, Theorem 4.3]` stands after the global equivalence between rational modules and triples. That theorem is the local statement, already cited correctly in §5.1: Laurent-polynomial modules with an ascending slope filtration are equivalent to difference modules over `ℂ({z})` (VPR07 line 1021–1024). The global equivalence in the cited literature is S03 Proposition 3.1.1.3, for systems Fuchsian at both endpoints (S03 line 1056–1075). The argument of §5.4 for arbitrary slopes is sound (the two expressions for `A` agree exactly when `(σ_q R)B₀ = B_∞ R`; the glued map is `N₀f₀F₀⁻¹ = N_∞f_∞F_∞⁻¹`), so say what each source supplies: "Laurent models and their maps: [VPR07, Theorem 4.3]; the Fuchsian case of the equivalence: [S03, Proposition 3.1.1.3]".

## C06 — The link for Atiyah's paper is to a copy on another mathematician's page

The reference `[A57]` (line 1289) links a PDF on a personal page at Berkeley that is not the author's. Link the publisher's record instead, `https://doi.org/10.1112/plms/s3-7.1.414`, and keep the page numbers.

## N01 — Imports

`Suggested.lean` opens with four `Mathlib.<submodule>` imports. The house form is the single line `import Mathlib`.

## N02 — Names

The README never mentions the seven declaration names of `Suggested.lean`, so a prose target cannot be matched to its formal statement. Naming `sylvester_existsUnique` in §7.1 and `rightFactorGauge` in §7.2 would do it.

## Questions for the author

- §§3.8 and 4.6 use pullback of bundles along the cyclic isogeny `ℂˣ/p^ℤ → ℂˣ/q^ℤ` and cite ComplexTori Milestones 1 and 3 for "finite isogeny comparisons". Milestone 3 is headed "equivariant descent and monodromy" and I read only its opening; is the isogeny and descent along it stated there, or should §3.8 state it?
- §3.8 cites `[A57, Lemmas 2, 5, 6′ and 8–11]`, pp. 420–423 and 427–428. I could not read a legal copy; do these numbers match the published paper?

## Verified sound

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §1.4 determinant divisor formula (sample) | `G = diag(z−a,1,…)`, `A` with simple zero at `a` | `d_(A′)(a) = 1+0−1 = 0`; `d_(A′)(a/q) = 0+1−0 = 1`; K16 Def. 1.7, Rem. 1.8 read (K16 line 151–168) | holds; agrees with §1.5 and §7.2 | none |
| §1.6 relative connections (sample) | Stacks 31.19.1, 31.19.3 | base change of a flat effective Cartier divisor; sum of two relative ones | locators right | none |
| §1.8 endpoint localization (sample) | finite jet, moving pole `1/(z−s)` | `(𝒪/z^(m+1))[z⁻¹] = 0`; completing first gives `𝒪_S[[z]][z⁻¹]`; pole meets `z=0` at `s=0` | examples true; no locator | none |
| §2.2 theta, characters, q-logarithm (sample) | series, `z = −1`, `c ↦ qc` | `σ_qΘ = zΘ`; `Θ(−1) = 0` by pairing `m ↔ −1−m`; `σ_q e_c = c e_c`; `σ_q ℓ = ℓ+1`; `e_qc = (z/(qc))e_c` | holds; sources use another theta | C04 |
| §2.3 constant systems (sample) | `C = [[1,1],[0,1]]` | `σ_q[[1,ℓ],[0,1]] = [[1,ℓ+1],[0,1]] = C·[[1,ℓ],[0,1]]`; S00 §1.1.2 read | holds | none |
| §2.4 recurrence | coefficient of `z^m` in `(σ_qH)C = AH` | `q^m H_m C − C H_m = Σ_(j=1)^m A_j H_(m−j)` | holds | none |
| Conventions: slopes, reversal | `A = cz^m`; `A = [[0,z],[1,0]]`; `r = 1/2`, `A = z−1` | slopes `m, −m, m`; `Φ²e₁ = q⁻¹z⁻¹e₁`, slope `1/2` twice, `v₀(det A) = 1`; `A^rev = (2z−1)⁻¹` | holds | none |
| §3.5 difference cohomology and Ext | rank one, slopes `−1, 0, 1`; `diag(1,z)` extension | slope `−1`: `Γ⁰ = 0`, `dim Γ¹ = 1`; slope 0: `1, 1`; slope 1: `0, 0`; `f_m = −q^(m(m−1)/2)`; RSZ13 Thm 3.1.1 `rs(ν−μ)` | holds | none |
| §4.2 dimension of the marked space | ranks `(1,1)`, `(1,1,1)`, `(1,2)` | slopes `(0,3)`: 3; `(0,1,2)`: `1+1+2 = 4`; `(0,1/2)`: 1, ramified 2; RSZ13 Thm 3.1.4 read | holds | none |
| §4.3 summation and admissible directions (sample) | `A₀ = diag(1,az)` | `ac·g(qz) − g(z) = uΘ_q(z/c)`, solvable and unique iff `ac ∉ q^ℤ`; forbidden `c ≡ a⁻¹`; S24 preprint Thm 2, Lemma 1 | holds; published numbering unread | none |
| §4.4 Stokes sheaf and cocycle (sample) | block `(i,j)` of `(σ_qS)A₀ = A₀S` | `σ_qS_ij = z^(μᵢ−μⱼ)CᵢS_ijCⱼ⁻¹`; `F_c⁻¹F_d` holomorphic off `{−c,−d}`; S24 preprint Cor. 3; RSZ13 §4.4 | holds | none |
| §4.6 descent by averaging | `G_(k+1) = G_k^j G`, `G_r = I` | `H^jG = r⁻¹(G₁+…+G_r) = H`; `C^j = (H^jG)[B] = C` | holds with `r` terms; S24 preprint line 1046 prints `r+1` | source issue |
| §5.2 Birkhoff factorization (sample) | rank 0; two factorizations | circle avoiding poles of `R, R⁻¹` exists; `F′₀F₀⁻¹ = F′_∞F_∞⁻¹` meromorphic on `ℙ¹`, rational; S00 §2.2 (line 809–811), S03 line 1073–1076 | holds | none |
| §5.3 filtered elliptic bundles (sample) | `A = z−a`; nontrivial `0→𝒪→V→L→0`, `deg L = 1` | degree of slope-`μ` rank-`r` piece `rμ`; `V` stable of slope `1/2`, filtration slopes `0,1`; S09 Thm 2.4, Lemma 2.5; M19 §10.1.3; VPR07 Thms 2.3, 2.5 | holds | none |
| §5.4 global equivalence (headline) | objects and maps | `(σF₀)B₀F₀⁻¹ = (σF_∞)B_∞F_∞⁻¹ ⇔ (σR)B₀ = B_∞R`; `R′f₀ = f_∞R ⇔ N₀f₀F₀⁻¹ = N_∞f_∞F_∞⁻¹` | holds; VPR07 Thm 4.3 is local | C05 |
| §5.5 connection matrix | `P = E_(C_∞)⁻¹ M E_(C₀)`; `q=2`, systems 1 and 3 | `σ_qP = E⁻¹C_∞⁻¹(C_∞MC₀⁻¹)C₀E = P`; `3 ∉ 2^ℤ` | holds | none |
| §6.1 transport along a groupoid (sample) | lift of `b_g` by full faithfulness | uniqueness from §5.4; no locator | consistent with §5.4 | none |
| §6.2 q-zero curvature (sample) | `A = I₂`, gauges `I+E₁₂`, `I+E₂₁` | spatial equations hold; products `[[2,1],[1,1]] ≠ [[1,1],[1,2]]`; B04 (3q)–(7q) read (B04 line 247–256) | holds | none |
| §6.4 gauge test by connection matrices (sample) | `P′ = P` | `Y′₀Y₀⁻¹ = Y′_∞Y_∞⁻¹` on overlap, rational under the extension hypotheses; S03 §3.1, S00 line 789–797 | holds | none |
| §6.6 gluing with pole bounds (sample) | `q=2`, `B = z²/(z²−s)` | `(z²−s)B = z²` polynomial; `B⁻¹` has bound `2[0]`; collision at `s=0` allowed | holds; no locator | none |
| §6.7 continuous-time equations (sample) | same family; `B = (I+sE₁₂)(I+tE₂₁)` | `AB = 4z²/(4z²−s) = B(2z,s)`; `Ω = 1/(z²−s)`; `Ω_t = [[s,−s²],[1,−s]]`, both sides `[[1,−2s],[0,−1]]` | holds | none |
| §7.1 refactorization and `sylvester_existsUnique` | `X = C₁`, `Y = C₂` below; empty index | `ST = XY` from `YΛ−ΛX = I`; exact check `(z−X)(z−Y) = (z−S)(z−T)`, `tr S = 18`, `tr T = 8`; `simp`, `exact?` fail | holds; not in the libraries | none |
| §7.2 gauge step and `rightFactorGauge_horizontal` | `q = 0`; `z = 0`; example below | `A^(1)(0) = q⁻¹B₁A(0)B₁⁻¹` exact; `q=0`: both sides `LD(z−B)`; `z=0`: `−LDB` vs `−q⁻¹BLD` | holds; `hq` unused | C03 |
| §7.3 step equation (headline) | `d=1`; `q=2`, `L=[[1,1],[0,1]]`, `C₁=[[3,1],[0,5]]`, `C₂=[[7,0],[2,11]]` | `d=1`: `C′ = q⁻¹L⁻¹CL`; both `i=1,2` equations hold exactly with `C(k+e₁) = ([[25,20],[2,31]]/14, [[43,−17],[12,83]]/7)` | holds | none |
| §7.4 q-Schlesinger equations (sample, headline) | same example | `7B₁ = [[27,24],[2,29]]`; both relations exact; both orders give `[[3/2,−1/2],[0,5/2]]`, `[[5/2,−3],[1,13/2]]`; `C₁(k) = B₁(k+e₂)` | holds; B04 (3q)–(6q) | none |
| §3.8 pure modules and semistable bundles | same-slope Hom; deck orbits | slope-0 Hom: only `n=0`, eigenvalue 1, both sides; invariant idempotent in a quotient of local `End(V)` is trivial | holds; A57 unread | question |

- Source locators checked against the text: 45 in nine texts (S00, S03, VPR07, S09, RSZ13, S24 preprint, B04, K16, M19) and three Stacks Project tags; one misprint found in a source.
- Library declarations opened at the pins (Mathlib 1b1ccf4, Tau Ceti 2fd255d): `SkewMonoidAlgebra.liftNCRingHom` (`Mathlib/Algebra/SkewMonoidAlgebra/Basic.lean:742`), `single_mul_single` (`:1042`), `SkewPolynomial` (`Mathlib/Algebra/SkewPolynomial/Basic.lean:95`), `ActionCategory` (`Mathlib/CategoryTheory/Action.lean:48`), `AffineSpace.homOverEquiv`, `TauCeti.meromorphicGerms` (`TauCeti/Analysis/Meromorphic/Germ.lean:55`), `homCokernelEquivExt` (`TauCeti/Algebra/Homology/Ext/Presentation.lean:88`), `jordanDecomposition`, `FiniteLocallyFreeSheaf`; all 26 linked files exist. No Sylvester-equation theorem for matrices in either library.
- Cross-roadmap citations resolved on main: 13 roadmaps, 69 sections, layers or milestones, all present under the cited ids.
- Dependency check: `depcheck: 132 roadmaps, 1467 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` gives two `sorry` warnings and nothing else; `#check` of the seven declarations compared with the README, no needed binder lost (the gauge definition does not use finiteness of the index).
- Pull request text read against the head: 8 layers, 51 numbered targets, two admitted theorems, suppliers on main; nothing contradicted.
- Overlap check: read PainleveEquations, PadicDifferentialEquationsAndRigidCohomology, FormalConnectionsOpers, CountingBundlesAndHallAlgebrasOfCurves; nothing shared. OperatorTheory/SpectralSubspacePerturbation owns Sylvester equations for self-adjoint operators only (SSP-B01–B04), not the disjoint-spectrum matrix statement of §7.1.
- Source independence: 12 passages compared with 8 sources, none shared; largest share RSZ13, 16 of 65 locators; contents compared with RSZ13: independent (its chapters 2–6 are spread over Layers 0, 3 and 4, in another order). The published text of S24 could not be read; its arXiv version was compared.
- Research link: Layers 3–4 state the local analytic classification of Ramis–Sauloy–Zhang (2013) and Sauloy (2024); Layer 5 extends Sauloy's (2003) form of Birkhoff's classification with van der Put–Reversat (2007); Layer 7 is Borodin's (2004) q-Schlesinger system. Rests on the sources read.

## Not verifiable

- S24, published version: its host is not one the sources service can read; the content was checked in arXiv:2006.03237v1, whose statements are numbered differently (Théorème 2, Lemme 1, Corollaire 3, Théorème 3, Propositions 5–7, Théorème 4), so the published numbers 3.1–3.13 and §§1.4, 2.3.2, 3.2.2 were not confirmed.
- A57 (Atiyah 1957): paywalled at the publisher and the linked copy is not a legal place to read it; the lemma numbers and pages of §3.8 were not checked.
- ComplexTori Milestone 3 as supplier of the isogeny comparison: only its opening was read.

Automatic checks set aside as false positives: the report that FormalLaurentPuiseux has no Layer 1 (its layers are headed L1, L4, L6 and exist on main); the report that the gauge definition lost a finiteness binder (its body does not use one).

## Source issues

- **Misprint** in S24 at the proof of Proposition 7 of arXiv:2006.03237v1, p. 26, line 1046 of its text (Proposition 3.11 in print, by the README's note): the source says the averaged gauge is one over r times a sum of r+1 iterates, counting the identity twice; it should be the sum of the r iterates G₀ = I, …, G_(r−1), so that H = HʲG holds; affects the proof.

## For the human reviewers

- Licence: the reference A57 (README line 1289) links a PDF of Atiyah's 1957 paper on another mathematician's page at Berkeley; C06 asks for the DOI instead.
- Not tested: the published S24 (Ann. Fac. Sci. Toulouse 33) could not be fetched; wording and locators were compared with its arXiv preprint only.
- Scope: B04 states the q-difference equations (3q)–(7q) without proof ("will appear elsewhere", B04 line 258); Layer 7's proofs transpose its §4 through Remark 4.14.
- Scope: no cited source states the global equivalence of §5.4 for arbitrary slopes; it is assembled from S03 Proposition 3.1.1.3 (Fuchsian case) and VPR07 Theorem 4.3. M19 is an unrefereed preprint.
