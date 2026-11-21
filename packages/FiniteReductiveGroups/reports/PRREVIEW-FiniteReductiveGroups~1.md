# Review of FiniteReductiveGroups (pull request #2881 at bddcb9a)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/FiniteReductiveGroups/`
**Verdict:** needs changes

**Summary.** The roadmap needs changes for three findings; the mathematics checked holds. The three Lean headline statements were tested numerically and their definitions pin the intended objects. The first finding is that 3.2(d), and through 3.3 the whole Deligne–Lusztig layer, rests on perfectness of compactly supported cohomology along finite étale torsors over an arbitrary base, which no roadmap owns: the cited supplier proves it only over a smooth affine curve. The second is that the family index lists Local factors of twists and types after this roadmap although 6.0 consumes its §2.1. The third is that the hypothesis `f(α) ≠ 0` of the local type statement 6.5, read with the README's own definition of a label, says the opposite of what the proof needs, and the statement is then false. There are four small corrections and two format notes. The human reviewers have to decide on the licence and scope of the formal-proof source and on a main source that could not be read.

## R01 (P1) — The perfectness behind 3.2(d) has no owner: EtaleCohomologyFoundations §F.10.4 proves it only for a torsor over a smooth affine curve

3.2(d), the vanishing of `L(γ, X)` for a free action, feeds 3.3, the Jordan decomposition formula. That formula gives the unipotent values in 4.2 and the character formula 4.3, so the rest of Layer 4 inherits an input that no layer, supplier section or pinned declaration provides. The route of 3.2(d) (lines 902–904) takes `RΓ_c(X, ℤ_ℓ)` to be perfect over `ℤ_ℓ[Γ]` "in the form for every separated base of finite type". 3.3 applies it to the stabiliser strata of an arbitrary quasi-projective `X` (lines 924–928). On main, EtaleCohomologyFoundations §F.10.4 (its README, line 2150 ff.) assumes that `U` is a smooth affine curve over a field and `V → U` a finite étale torsor, and §F.10.5 works on the same domain. The Scope (lines 2224–2226) and the contract table (line 2327) record the mismatch themselves. A search of the roadmaps on main and at the open heads found no other statement of this perfectness over a general base.

The smallest repair is to make the input owned. One option is to state it here, as a target of 3.2(d) with its own route and `*Needs:*`: for a finite group `Γ` acting freely on a quasi-projective `X` over `k̄` and `Λ = ℤ/ℓ^ν`, `RΓ_c(X, Λ)` is perfect over `Λ[Γ]`. The other is to declare it as a supplier gap of EtaleCohomologyFoundations under `## Exact supplier contracts`, with a one-sentence `needs`.

## R02 (P2) — The family index puts Local factors of twists and types after this roadmap, yet 6.0 consumes its §2.1

The family index (`RiemannHypothesisForDirichletLFunctions/README.md`, lines 27–28) says that the roadmaps are listed in merge order and that each cites only roadmaps listed above it. It lists Finite reductive groups at line 71, Hermitian forms and lattices at line 86 and Local factors of twists and types at line 90. Merged in that order, 6.0 would cite an unmerged supplier, and so would 6.1, 6.3 and 6.5 through it. 6.0's `*Needs:*` (line 1994), the Layer 6 Dependencies (line 2125) and the supplier table (line 2355) all cite LocalFactorsOfTwistsAndTypes §2.1. At that roadmap's open head, §2.1(a), (c) and (d) say what 6.0 uses. LocalFactorsOfTwistsAndTypes in turn consumes HermitianFormsAndLattices §§2.1, 4.2 and never cites this roadmap. The description's sentence "Sub-roadmaps of the family … merge first" is therefore untrue for this supplier. The roadmaps listed between the two positions mention this roadmap only in the index line. The repair is to list Finite reductive groups directly below Local factors of twists and types in the family index (above Base change and Galois representations for unitary groups, its first consumer in the family). Every family pull request carries the index, so the same reordering applies to all of them.

## R03 (P2) — With labels defined as functions on orbits, the hypothesis `f(α) ≠ 0` of 6.5 says that `α` occurs in `f`, and the local type statement is then false

The Conventions define a label as "a finitely supported function `m` from Frobenius orbits to `ℕ`" (line 131). Read that way, `f(α) ≠ 0` (line 2106) says that the orbit `{α}` occurs in `f`. Here is a counterexample under that reading. Take `a = b = 1` and `f = {α}`, and let `π = (α̃∘det) ⊗ St` on `GL₂(F)`. Its Iwahori-fixed line is acted on by `J` through `α` of the lower-right entry. Its `GL₁(k)`-span is the `α`-line, which the series idempotent of `f` does not kill. Yet `π` is not an irreducible parabolic induction `π_f × (α̃∘det ⊗ π_sph)`. The route needs the opposite condition, "the inertial supports of the two factors are disjoint" (line 2113). With `{α}` outside the support of `f`, every character in the cuspidal support of `π_f` differs from `α̃` on `𝒪^×`, and the induced representation is irreducible. The intended meaning is the polynomial one of the labelled form (`α` not a root of `f`), but the text does not say so. The repair is to replace `f(α) ≠ 0` by "the orbit `{α}` does not occur in `f` (in the labelled form, `α` is not a root of `f`)".

## C01 — Most sampled targets carry no source locator, and the general case of the headline 2.2 is cited without a theorem or page

0.4, 1.1, 1.3, 2.5, 3.1, 3.3, 4.2, 4.7, 5.2, 5.9 and 5.11 give no locator at the claim. Their routes are mostly complete, so no stated result is left unsupported. The exception is 2.2: the route proves multiplicity one only for `GL_n` and its products, and leaves the general case, which is a headline, to "Steinberg, *Lectures on Chevalley groups*; Digne–Michel" (line 507) with no theorem or page. 4.5(b) likewise cites "Deligne–Lusztig, §8; Digne–Michel" for the analysis of the strata. Adding the theorem and page at each claim would let an implementer of the general case find the proof. 2.2 and 4.5(b) matter most.

## C02 — For `F/ℚ_p` finite, 6.1 is the depth-zero case of SmoothRepresentationsOfLocalGroups SR.5.2, which the Scope does not say

On main, SR.5.2 *distinguished-cuspidal-types* (its README, lines 3484–3503) covers `F` finite over `ℚ_p`. In depth zero (`β = 0`, `K = GL_n(𝒪)`) it gives intertwining `F^×K`, irreducible cuspidal `c-Ind`, and the fact that every cuspidal representation contains such a type. These are 6.1's irreducibility and exhaustion. 6.1 is wider, since it covers every nonarchimedean `F`, and its Check already makes the comparison. Still, the Scope lists 6.1 as owned without the clause that says how it differs. One sentence would fix this: "6.1 extends SR.5.2's depth-zero case to local fields of positive characteristic."

## C03 — The `Suggested.lean` docstring understates the root subgroups that Tau Ceti has at the pin

The docstring (line 43) says that Tau Ceti has root subgroups "only for special linear and a few other explicit groups". The pin has `TauCeti.UniversalEnvelopingAlgebra.kostantRootSubgroupPoints` (`TauCeti/Algebra/Lie/UniversalEnveloping/Kostant/RootSubgroup/`), the root subgroups of every Chevalley group given by a Kostant integral form. The conclusion stands. What is missing is a rational Borel subgroup with its root subgroups for an arbitrary connected reductive group over `𝔽_q`, non-split ones included. The docstring would say that instead.

## C04 — 6.0 restates LocalFactorsOfTwistsAndTypes §2.1(a), (d) as a numbered item of this roadmap

The isomorphism `(π^{K₁})^{N(k)} ≅ (π_N)^{M∩K₁}`, its corollary for supercuspidal `π`, and the depth of the supercuspidal support are §2.1(d) (its `GL_n` sentence) and §2.1(a) at that roadmap's head. The Scope already attributes them there. An implementer could still take 6.0 for a target of this roadmap. Saying in 6.0 that it is the imported statement and not a target here, or folding it into the Layer 6 introduction, would avoid planning it twice.

## N01 — LaTeX commands occur in code spans

`\overline{…}` appears on thirteen lines (4.5(d), 5.6(b), 5.11), and `1_{\{1\}}` appears in the Check of 2.5 (line 638). The house style would write `θ(t)‾`, `conj θ(t)` or `θ̄(t)`, and `1_{1}`.

## N02 — "TypeAHeckeAlgebras H1" is that roadmap's former numbering

The citation remains valid, because TypeAHeckeAlgebras keeps the map "Layers 1–3 were H1–H3". Citing Layer 1 (§1.2 for split semisimplicity) would match its present headings (lines 394, 427, 450, 2314).

## Verified sound

| Statement | Instances tried | Values computed (roadmap side / check side) | Result |
|---|---|---|---|
| 0.4 class counts | `n ≤ 3`; `GL₂` families; pairs `n = 2` | `k₁,k₂,k₃ = q−1, q²−1, q³−q` from the product; `(q−1)+½(q−1)(q−2)+(q−1)+½q(q−1) = q²−1`; pairs `½q(q−1)+½(q²+q−2) = q²−1` | holds |
| 1.1 cuspidality, twists | `GL₂(𝔽₂) ≅ S₃`; `GL₂(𝔽₃)`; `GL₃` | `U^F` a transposition: sgn has no fixed vector; `α₀∘N = θ⁴` sends `σ_θ↔σ_{θ⁵}` and fixes `σ_{θ²}`; `σ×α`: `*R_T = 0`, `*R_L ≠ 0` | holds |
| 1.3–1.4 endomorphism algebra | `GL₃`, `σ = 1`; `GL₃(𝔽₂)`; `GL₃(𝔽₃)`, `χ` quadratic | `1+4+1 = 6 = |S₃|`; `T_{s₁}` eigenvalues `2 (×7), −1 (×14)`, trace 0; `B_s`: `−3 (×13), 1 (×39)`, `−39+39 = 0` | holds |
| 2.4(c), (d) | `GL₃`; `d = 2, q = 2` | `(q−1)(q²−1), −(q−1), 1`; `dim σ×σ = 35 = 5·7`, constituents `28 + 7`; `ψ_{2d}/(q^d−1)² = (q^d+1)B` | holds |
| 2.5 kernel bound | `q = 3`; `q = 2, n = 3`; `n = 1` | `∏(1−3^{−i})^{−1} ≈ 1.785 ≤ 2`; `8/3 > 5/2`; both sides `(q−1)Σ‖v_x‖²` | holds |
| 2.7(b), `bessel_pairing_eq` | all `k, i`, every Jordan type, `n ≤ 6`, `q ∈ {2,3,4,5}` | 365 per-type comparisons, 0 mismatches; dropping entry `(i,c)`: 8 mismatches (`q=2, n=4`); coefficient `q^{k−j}`: 9/9 mismatch | holds |
| 2.8(b) bounds | `q=2, n=7, k=3, L=T`; `GL₃, k=2` | `m = 35+4+14+21 = 74 > 60`, `< 8·(3/2)⁷ ≈ 136.7`; `m = q²+2q, q², q²−q` | holds |
| 3.1 Lefschetz numbers | `𝔾_m`, `g = 1` and `x ↦ x⁻¹` | `L = −1+1 = 0`, `R(∞) = −1+1`; inversion `L = (−1)(−1)+1 = 2`, one fixed point in char 2 | holds |
| 3.2(d) supplier (R01) | §F.10.4 hypothesis vs use in 3.3 | supplier: smooth affine curve `U`; use: strata of quasi-projective `X` of any dimension | unowned |
| 4.2 sign convention | `B` rational | Lefschetz number `#{xU^F : x⁻¹gx ∈ t⁻¹U^F}`; sum gives `Ind_{B^F}θ`; `θ(t)` gives `Ind θ⁻¹` | holds |
| 4.3 regular `s` | `s` regular, `T' = C°(s)` | `x⁻¹sx ∈ T ⟺ xTx⁻¹ = T'`, `Q^{T'}_{T'}(1) = 1`: sum over `T'^F`-cosets | holds |
| 4.7 degree | `GL₂`; second route `n = 2`, all `n` | `1−q = −(q²−1)(q−1)/(q²−1)`; `½(q+1)+½ε′(q−1) = 1 ⇒ ε′ = −1`; `h_n ↦ (−1)^n/ψ_n(q)` gives `1` | holds |
| 4.6 Steinberg | `U₃`; `GL₃`; `diag(a,a,b)`; three `SL₂` cycled | `2−1−1+1 = 1` vs `5`; sixteen terms `1`; `3(q+1)−2(q+2)+1 = q`; `N_∅ = 2` iff `∏w_i = 1` | holds |
| 5.2 / `HasCuspidalValues` / `exists_cuspidal_of_regular` | `GL₂(𝔽₃)`, `GL₂(𝔽₅)`, `GL₃(𝔽₂)`, `GL₃(𝔽₃)`, `GL₄(𝔽₂)`, all regular orbits | norms 1; degrees `2, 4, 3, 16, 21 = ψ_{n−1}(q)`; `U_P`-sums 0; cross pairings `≤ 3.5·10⁻¹⁵` | holds |
| 5.2 separation | 14 pairs `(q,n)`, all exceptions | 0 coinciding orbit pairs; `(2,6)`: `63 ≤ 66` holds, `63 ≤ 60` fails after dropping `d_S = 1` | holds |
| 5.5 / `exists_regular_of_isCuspidal` | `n = 1`; counts above | `χ = θ∘algebraMap`; regular orbits `3, 10, 2, 8, 3 = N*_q(n)` | holds |
| 5.9 counting | `n ≤ 40`, `q ∈ {2, 5/2, 3, 4, 5, 7}` | `q^n−q^{n−1} ≤ k_n ≤ q^n` throughout; `q^n−k_n = 1,1,q,q,q²+q−1,q²` | holds |
| 5.10 Gauss sums | `n = 2`; `(2,8)`, `(3,6)`, `(4,5)` | total `−q(q−1)G₂(θ)`; `2⁴ ≡ −1 (17)`, `3³ ≡ −1 (28)`, `2⁵ ≡ −1 (33)`; `3 ∉ ⟨2⟩ mod 17` | holds |
| 5.11(a) norm fibres | `GL₂(𝔽₂) ⊂ GL₂(𝔽₄)` | `1·180/6 = 30`, `3·180/6 = 90`, `2·180/6 = 60` | holds |
| 6.0 locator | LocalFactorsOfTwistsAndTypes §2.1 at its head | (a) depth of support; (d) `GL_n`: `(π^{K₁})^{N(k)} ≅ (π_N)^{M∩K₁}` | matches |
| 6.2 count | `n = 2`, `q` odd | `(q+1)−2` or `q+1`, halved; `½(q−1)·q` total | holds |
| 6.5 (R03) | `a=b=1`, `f={α}`, `α̃⊗St` | hypothesis met; conclusion "irreducible induced" fails; with `{α} ∉ f` the ratio is ramified, irreducible | fails as written |
| family order (R02) | index positions | index lines 71, 86, 90 (Finite reductive groups, Hermitian forms, Local factors); 6.0 cites Local factors §2.1 | upward in index |
| 0.5 locator | Steinberg1965 Lemma 3.2, Theorem 3.3 | finitely many Borels ⟺ exactly one ⟺ all simple components `≠ 1` (`G` semisimple there) | matches |
| `IsCuspidal` | `n = 1`; non-standard maximal parabolic | vacuous for `n = 1` (tori: all cuspidal); conjugation to standard `(k, n−k)` | correct object |
| DL package headline | pin | Mathlib has pro-étale `H^i(X, ℤ_ℓ)` only (`ElladicCohomology.lean:76`), no compact supports | not statable, as docstring says |
| GG multiplicity one headline | `GL₂`; `D₈` control | `(q−1)q+½(q−1)(q−2)(q+1)+½q(q−1)² = (q−1)(q²−1)`; `End ≅ M₂(ℂ)` for `D₈` | holds |

- Source locators checked against the text: Steinberg1965 Lemma 3.2 and Theorem 3.3 (0.5); cross-roadmap statements LocalFactorsOfTwistsAndTypes §2.1(a), (c), (d), TensorInductionAndFiniteGroupInputs §§6.1–6.2, OrbitMeasuresOnAdelicGroups §4.1.
- Library declarations opened at the pins: Mathlib `ElladicCohomology.lean:64,76`, `card_GL_field` (`GeneralLinearGroup/Card.lean:122`), `frobeniusAlgHom` (`FieldTheory/Finite/Basic.lean:334`), `Rep.ind` (`RepresentationTheory/Induced.lean:102`), `ArithmeticFunction.moebius` (`Moebius.lean:54`); Tau Ceti `upperUnitriangularGroup`, `rationalPointsMulEquiv` (`Frobenius/FiniteField.lean:249`), `ReductiveCommHopfAlgCat` (`Reductive/Basic.lean:169`), `GL2Cuspidal` (`CharacterTable/GL2/Table.lean:205`), `kostantRootSubgroupPoints`.
- Cross-roadmap citations resolved: ReductiveGroups 7, 7a–7f, 7C, 9, 9E; ReductiveGroupsPartII RG2.3.6, RG2.4; SmoothRepresentationsOfLocalGroups SR.0, SR.2.1, SR.2.2, SR.3.1, SR.3a.1, SR.5.2; EtaleCohomologyFoundations 0.8, 0.11, F.2.4, F.2.5, F.2.7, F.3, F.4.5, F.10.1, F.10.4, F.10.5; IG.0.T3; SchemeAndStackFoundations 1.1, 1.15; TypeAHeckeAlgebras (H1 = Layer 1, normalisation `(T−q)(T+q⁻¹)`); CharacterTheory 3.5, Layer 9; SchurWeyl Layers 4, 7; open heads of the four family siblings cited.
- Automatic checks: all passed. Dependency check: `depcheck: 171 roadmaps, 1994 edges, 0 problem(s)`.
- Elaboration: `lake env lean` gives three `sorry` warnings and nothing else. A one-tactic probe (`rfl`, `simp`, `infer_instance`, `trivial`) failed on all three theorems. `#check @name` for all seven declarations shows `[Finite K]`, `[Finite L]` and `Algebra K L` carried explicitly; nothing changed.
- Overlap check: read LocalFactorsOfTwistsAndTypes, BaseChangeAndGaloisRepresentationsForUnitaryGroups, SmoothRepresentationsOfLocalGroupsPartII, ThetaLiftsForDefiniteUnitaryGroups, ThetaKernelsForUnitaryDualPairs (open), and SmoothRepresentationsOfLocalGroups, EndoscopicTransferAndUnitaryTraceComparison, GL2AutomorphicRepresentationsAndTransfer (main). The depth-zero Jacquet comparison is owned by LocalFactorsOfTwistsAndTypes §2.1 and cited here. The depth-zero supercuspidals over `p`-adic `F` are owned by SmoothRepresentationsOfLocalGroups SR.5.2, and 6.1 extends them (C02). LocalGaloisDeformationRings §2.26.2 (main) owns only its type-specific character computations. No other object is shared, and no roadmap plans finite Deligne–Lusztig theory or finite Gelfand–Graev representations.
- Source independence: 3 passages compared with 1 source (Steinberg1965: 0.5 (a), (b) and its route), none shared; largest share DeligneLusztig1976, 7 of 14 in-text locators; contents compared with it: not tested (no legal copy). The order of Layer 4 is forced by its *Needs:* lines (4.4 ← 4.1–4.2, 4.5 ← 4.4, 4.6 ← 4.5, 4.7 ← 4.6, 4.8 ← 4.7, 4.9 ← 4.5, 4.7, 4.10 ← 4.9, 4.11 ← 4.10).
- Research link: Layers 3–4 are Deligne–Lusztig's 1976 theory, Layer 5 is Green's 1955 character theory of `GL_n(𝔽_q)` with Shintani's 1976 descent, and Layer 6 is the depth-zero construction of Moy–Prasad (1994, 1996). BaseChangeAndGaloisRepresentationsForUnitaryGroups §§10.34–10.35 uses Layer 6 for explicit depth-zero Langlands parameters. This rests on the README's References and Downstream consumers.

## Not verifiable

- DeligneLusztig1976 (Theorems 4.2, 6.8, 6.2, 9.16, 10.7, Corollary 7.7, §8): JSTOR only; the publication page of one of its authors lists it without a file.
- Green1955: the sources service does not classify the publisher's host.
- Shintani1976: the Project Euclid PDF returned a bot-challenge page, not the text.
- Zelevinsky (LNM 869, Ch. III), Digne–Michel, Carter, Howlett–Lehrer, Macdonald, Kondo, Gelfand–Graev, S. Gelfand, Bushnell–Henniart, Moy–Prasad: books or paywalled journals; not fetched.
- [FormalProof], the source of 2.7(b) and 2.8: not read; 2.7(b) was checked numerically instead.

Automatic checks set aside as false positives: the citation resolver reported the family sibling Tensor induction and finite-group inputs as found nowhere, but that roadmap's open pull request carries §§6.1–6.2, and their statements match what 5.11 uses.

## Source issues

- none

## For the human reviewers

- Scope: the family follows a Lean formalisation ([FormalProof], README line 2407). The repository's own README says that the formalisation "claims a proof" of the Riemann hypothesis and that its verification has not been run. This roadmap's own subject is Deligne–Lusztig 1976, Green 1955 and Moy–Prasad.
- Licence: [FormalProof] is cited as the source of 2.7(b) and 2.8. Its repository says the submission "was published without a license". `bessel_pairing_eq` was not compared with its source files.
- Licence: [Announcement] (README line 2412) is a PDF on a host I could not classify, and it is cited at 2.7(b) and 2.8.
- Not tested: DeligneLusztig1976, the source with the largest share of locators (7 of 14), could not be read legally, so wording and arrangement were not checked against it.
