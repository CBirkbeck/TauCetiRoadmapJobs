<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/14748#issuecomment-6858108875 -->
Review (claude) of f019614

Verdict: needs_changes

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

1. **F01** (P2) The Cartan (KAK) decomposition and P = MAN have earlier owners

   **Location.** README line 9: "the Cartan decomposition with its parameter … boundary stabilisers with their Langlands decomposition"; §1.4 (line 189): "Prove then that G = K·{g_t}·K (Cartan decomposition)"; §1.5 (line 206): "that P_∞ = M·A·N with unique decomposition". Plan targets 1.4 and 1.5 (API `langlands_decomposition`).

   **Claim.** These two decompositions of G = PU(1,n) are this roadmap's own, proved from §§1.3–1.4 alone.

   **Witness.** Main, `TauCetiRoadmap/RepresentationTheory/LieGroups/README.md:1362`: "G=K exp(a_bar_plus) K (`kakDecomposition`) and uniqueness of the middle factor". Open head of RealSemisimpleLieGroups, README §3.1 (line 808): "`M × A × N → P` is a diffeomorphism … `G = KP`", for every connected G with semisimple Lie algebra and finite centre.

   PU(1,n) is in both classes: it is connected with trivial centre and Lie algebra 𝔰𝔲(1,n), and RealSemisimpleLieGroups §5.7 gives it the Cartan datum (θ(X) = −X*, 𝔭 = {Y_v}). The README cites neither section: it names no section of RealSemisimpleLieGroups other than §§5.2–5.7 and never names LieGroups. This is the round-3 R02 pattern in two places the repair did not reach. The round-3 list of what to keep named "Siegel/Cayley and horospherical formulas"; the abstract decompositions are not formulas of that kind.

   **Exact repair.**

   - §1.4: replace "Prove then that G = K·{g_t}·K (Cartan decomposition) … with |t| determined by g through tanh|t| = |g·0|" by: "By LieGroups Layer 9's `kakDecomposition`, read on the Cartan datum of RealSemisimpleLieGroups §5.7 with 𝔞 = ℝ·Y_v for a unit vector v, G = K·exp(𝔞)·K with the middle factor unique up to the restricted Weyl group C₂. Prove the explicit form: for v = −i·e₁, exp(tY_v) = g_t, and the parameter is given by tanh|t| = |g·0|." Keep the unimodularity proof; it needs only the decomposition.
   - §1.5: replace "that P_∞ = M·A·N with unique decomposition" by: "Take the minimal parabolic subgroup P = MAN, the diffeomorphism M × A × N → P and G = KP from RealSemisimpleLieGroups §3.1, for 𝔞 = ℝ·Y_{eₙ}. Prove the comparison: under the Cayley transform the supplier's M, A, N are M = U(n−1), {a_s} and the Heisenberg group of the Conventions, and P is the stabiliser P_∞ of ∞." Transitivity on ∂B then follows from G = KP and stays as a consequence.
   - Add both sections to the scope paragraph, the supplier contracts (a `From TauCetiRoadmap.RepresentationTheory/LieGroups` entry for Layer 9; §3.1 in the RealSemisimpleLieGroups entry), the two *Needs:* lines, the Layer 1 Dependencies, and plan 1.4, 1.5 and `suppliers`.

   Tested on the instances that separate the conventions. n = 1: the supplier's SL₂(ℝ) Check has M = {±1}, trivial in PSL₂(ℝ), A the dilations and N the translations, as §1.5's third Check says. n = 2: dim M + dim A + dim N = 1 + 1 + 3 = 5, the value in the Layer 1 Examples. KAK: the Weyl group C₂ acts by t ↦ −t (conjugation by [diag(1, −1, 1, …)], already in §1.4), so "unique up to C₂" is "abs(t) determined". exp(tY_{eₙ})·0 = tanh(t)·eₙ tends to b₀ = eₙ, the point the Cayley transform sends to ∞; g_t·0 = −i·tanh(t)·e₁ is a K-conjugate direction, so the two sections use different, conjugate choices of 𝔞 and the repair must say which.

2. **F02** (P2) §11.3 passes from 𝐆 to 𝐆^ad with no owner for the step

   **Location.** §11.3 (line 821): "the component stabiliser Γ_a = 𝐆^ad(ℚ)₊ ∩ aK_f a⁻¹ … has image Γ_a^eff in G that is arithmetic and commensurable with Γ"; its *Needs:* line; plan 11.3.

   **Claim.** Commensurability of Γ_a^eff with Γ follows from the listed inputs.

   **Witness.** Γ is commensurable with the image of 𝐆(ℤ); Γ_a is arithmetic in 𝐆^ad(ℚ), a different group. AdelicAlgebraicGroups §3.4 (head, lines 3186–3196) compares arithmetic subgroups of one group only. `roadmaps grep "image of an arithmetic"`: no match anywhere.

   The missing statement is: for the central isogeny π: 𝐆 → 𝐆^ad, π(𝐆(ℤ)) is commensurable with 𝐆^ad(ℤ). It is not vacuous. For 𝐆 = SL₂, π(SL₂(ℤ)) = PSL₂(ℤ) has index 2 in PGL₂(ℤ) = GL₂(ℤ)/{±1}, so equality fails and commensurability has to be proved. §11.3 gives no route for it, §11.1 (b) does not cover it (it compares subgroups of 𝐆), and ArithmeticLocallySymmetricSpaces ALS.2.3 uses a similar fact in passing without stating it as a target. The identification of G with the identity component of the noncompact factor "through p" also needs one sentence: p and pr_H ∘ π_ℝ have the same kernel.

   **Exact repair.** Add to §11.1 a third statement and cite it in §11.3:

   "(c) Passage to the adjoint group. For the central isogeny π: 𝐆 → 𝐆^ad and a faithful representation 𝐆^ad ⊂ GL_M, π(𝐆(ℤ)) is commensurable with 𝐆^ad(ℤ). The representation ρ ⊕ (ρ′ ∘ π) of 𝐆 is faithful, so by model independence (AdelicAlgebraicGroups §3.4) a subgroup Γ₁ of finite index in 𝐆(ℤ) has π(Γ₁) ⊂ 𝐆^ad(ℤ). The map 𝐆(ℝ)⁰ → 𝐆^ad(ℝ)⁰ is surjective with finite kernel, so π(Γ₁ ∩ 𝐆(ℝ)⁰) is a lattice in 𝐆^ad(ℝ)⁰ (§3.4, image theorem) contained in the lattice 𝐆^ad(ℤ) ∩ 𝐆^ad(ℝ)⁰, hence of finite index in it. The kernels of p and of pr_H ∘ π_ℝ are both {g : Ad(g) is trivial on 𝔰𝔲(1,n)}, so p factors as an isomorphism H⁰ ≅ G after pr_H ∘ π_ℝ."

   State "a lattice contained in a lattice has finite index" for a general unimodular group where §5.1 states it for G, or cite VonNeumannAlgebras Layer 9 for it. Add to §11.3's *Needs:* "§11.1 (c)", and add a Check: SL₂ → PGL₂, index 2. Tested on that instance: Γ₁ = SL₂(ℤ), π(Γ₁) = PSL₂(ℤ) ⊂ PGL₂(ℤ) of index 2, and both project onto lattices of PU(1,1) commensurable with PSL₂(ℤ).

3. **F03** (P3) Five locator, dependency-line and notation points

   **Location and witness, one per item.**

   1. §2.1 (line 239) and plan 2.1 cite "BaldiUllmo2023 line 35 to line 36" for Cartan's theorem and G ≅ Aut(B). Those lines introduce the quotient S_Γ = Γ\X; the extraction contains no occurrence of "biholomorph" or "Aut(". Repair: delete that locator in both files. Mok2012 line 320 (a lattice "of automorphisms (hence necessarily isometries …)") supports only the last sentence of §2.4 and may be cited there.
   2. §11.4 (line 833) rests "both compactifications … add finitely many points" on "Mok2012 line 123 to line 128", a recalled fact, and its *Needs:* lists ShimuraVarieties §§1.2, 2.7, 3.3, 3.5. The rational boundary components are ShimuraVarieties §2.1 and compactness of the Satake quotient is §2.2. Repair: add "ShimuraVarieties §§2.1–2.2" to the *Needs:* line, the Layer 11 Dependencies and plan 11.4, with the sentence "the proper boundary components of 𝔹ⁿ are points, so the rational ones are points, finitely many modulo Γ by §2.2".
   3. §§12.1–12.3 use W for two objects. §12.3 (line 889): "every totally geodesic subvariety W ⊂ S_Γ … r_W(Γ ∩ H_W) is a lattice", where r_W and H_W are indexed by a subspace of V (§3.1). Repair: write the subvariety as Z in §§12.1–12.3 (W stays the subspace) and the algebraic subvariety of §12.4 as a third letter, in both files.
   4. `finSumFinEquiv` is cited at `Mathlib/Logic/Equiv/Fin/Basic.lean:223`; line 223 is its docstring and the `def` is at line 224. Every other pin citation points at the declaration line. Repair: 224, in the contract and plan 1.1.
   5. §6.1 (2) cites "Garland–Raghunathan's Theorem 4.10 … their Theorem 0.7" without the manifest key, and the References omit the work, although `sources.toml` records `GarlandRaghunathan1970` (waived). Repair: write the key at the citation and add a References line "(waived)".

   No Lean declaration is involved in any item.

Three findings, two blocking. All four round-3 findings are repaired. The two blocking findings are a residue of the round-3 ownership pattern in Layer 1 (R01) and a step of §11.3 that has no owner and no route (R02). R03 collects five locator, dependency-line and notation points. I changed no file of the design and fetched no source. This is a design: there is no `Suggested.lean`.

## Previous findings, checked first

Locations are in `packages/BallQuotientsAndComplexHyperbolicLattices/design/README.md` unless a file is named. The repair report marked no finding "not actionable in this package".

| Round-3 finding | Repaired passage and check | Status |
| --- | --- | --- |
| R01 (P1), elliptic fixed point in the thin part | §6.1 (1): "The finite case consists of the points x whose whole group Γ_ε(x) is finite. A point fixed by an elliptic element of Γ lies in it only when Γ_ε(x) has no element of infinite order". New last Check of §6.1 and the Layer 4 Examples agree. Recomputed: zᴴHz = 2(Im v − abs(u)²) on (1,u,v); R̃, T̃ preserve H, det 1; √2·asinh(1/2000) = 0.00070710675. Plan 6.1 carries the same text. | Repaired |
| R02 (P2), ball geometry owned twice | §§1.1–1.4, 2.2–2.4, 3.1–3.3, 5.2–5.3 now open with "Take … from RealSemisimpleLieGroups §5.7" (or §§5.2, 5.3, 5.4, 5.6) and prove only comparisons and additions. Each consumed clause was found in the supplier's text at its open head (README lines 1105–1338). Adapter values recomputed (table below). | Repaired for the listed sections; the same pattern remains in §§1.4–1.5 (new R01) |
| R03 (P2), arithmetic predicate owned twice | §11.1: "Read AdelicAlgebraicGroups §3.4's arithmetic lattices in a real Lie group on the connected group G"; §11.2 proves only the cocompactness transfer. Supplier text read at its head, lines 3385–3425: predicate, three invariances and the image-lattice theorem are there. WitteMorris2015 line 3676 and lines 3909–3911 hold Theorem 5.1.11 and Proposition 5.3.1. | Repaired |
| R04 (P3), three plan entries | Plan 1.3 says "inverse of the affine chart"; plan 5.1 lists `target:1.4`; README §9.2 Check reads "ℓ − 2 for ℓ ≥ 2 (and 0 for ℓ = 1)". h⁰(O(ℓ−3)) = 0, 0, 1 at ℓ = 1, 2, 3. | Repaired |

The repair report also corrected `Matrix.indefiniteDiagonal` to `LieAlgebra.Orthogonal.indefiniteDiagonal`: confirmed at the pin (`Mathlib/Algebra/Lie/Classical.lean:175`, inside `namespace LieAlgebra`, line 70, and `namespace Orthogonal`, line 162).

## Verified sound

### Coverage, shape and principles

I read the whole README (940 lines), the plan's 57 targets (parsed: every `target:` prerequisite is earlier than its target, every target has at least three tests, every definition-kind entry has an API), the manifest (17 entries: 8 certified, 8 uncertified, 1 waived; every key cited in the README is recorded) and both previous reports. The README has the required sections, twelve layers each ending with Examples and Dependencies, a *Needs:* line and at least three Checks in every subsection. No route-specific shortcut (all n ≥ 1, all lattices, torsion kept where the theorems allow it), no algorithm, no `set_option`, no pull-request number, date or machine path in the roadmap text. No second copy on main. The layer order is forced by the dependency lines (group → metric → isometries → lattices → cusps → quotient → toroidal → projective → extension → arithmetic → special subvarieties) and no layer is named after a source's section.

The round-1 finding on the compound gap `normality-analytification` was repaired in round 2 and accepted in rounds 2 and 3; I did not reopen it. Both gaps name ComplexComparisonPartII with matching slugs in README and plan, and neither asks for something already supplied: the supplier's §C4.5 (head, lines 2915–2917) says explicitly that its route avoids "the normality of the analytification of a normal scheme and the extension theorem on normal analytic spaces".

### Computed adversarial table

Rows cover the fifteen sampled targets, every passage the round-4 repair changed, the headline results and the findings. Unchanged statements not listed keep the round-3 computed rows, which I spot-checked where marked.

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| Conventions, h_t | n = 1 | h_tᴴJh_t = J (c² − s² = 1, off-diagonal ics − ics = 0); h_t·0 = −i·tanh t | Pass |
| Conventions, Heisenberg law | a = 1, a′ = i | composition gives t″ = t + t′ − 2·Im⟨a,a′⟩; products (1+i, −2) and (1+i, 2); commutator T₋₄ | Pass |
| §1.1 form comparison | z = (1, i/2), w = (1, 1/2) | here 1 + i/4, supplier 1 − i/4, both ⟨z,z⟩ = 3/4 | Pass |
| §1.2 closed image | limit h of λ_k g_k | hᴴJh = cJ, c = lim abs(λ_k)² > 0 since det h ≠ 0 | Pass |
| §1.3 Cayley | (0, 1/2); (0, 2); inverse | (0, 3i), ρ = 3 = (3/4)/(1/4); (0, −3i), ρ = −3; 1 − wₙ = 2i/(v + i) gives w′ = 2iu/(v + i) | Pass |
| §1.4 section g_w | general w; w = e₁/2 | g_wJg_w = J using γ²(1 − abs(w)²) = 1 and Dw = γw; γ = 2/√3; (γ − 1)/abs(w)² → 1/2 | Pass |
| §1.4 KAK, unimodularity | diag(1,−1) | conjugates h_t to h₋ₜ; dim K + 1 = n² + 1 < n² + 2n | Statement true; ownership R01 |
| §1.5 (sampled) | a_s; n = 2 map to `TauCeti.HeisenbergGroup` | a_{1/2}T₁a_{1/2}⁻¹ = T_{1/4}; scaling s^{2n}; z″ = z + z′ + pq′, the law at `Heisenberg.lean:95` | Pass; P = MAN ownership R01 |
| §2.1 (sampled) | boost with tanh t = −1/2; w/2; z + z² on ℂ | 0 ↦ −1/2; derivative 1/2; unbounded domain | Pass; locator R03.1 |
| §2.2 metric | w = (1/2, 0), u = e₁ | h = 4/3 + 4/9 = 16/9; g = 32/9 on both sides; det h = (1 − r²)^{−(n+1)} | Pass |
| §2.3 scaling | n = 2 | Killing −1/3, −1/12; ×6 gives −2, −1/2; Ric = −½·2(n+1)·g_𝔹 | Pass |
| §2.4 geodesics | Y_v, abs(v) = 1 | exp(tY_v)·0 = tanh t·v; tr(Y_v²) = 2; Killing distance 2√(n+1)·abs(t); ratio √(2(n+1)) | Pass |
| §2.5 (sampled) | (ζ,ζ)/√2; (ζ/2, ζ/2); Df(0)X = 0 | norms 1, 1/√2; zero case trivial; ⟨v, f(ζX)⟩ holomorphic because the form is conjugate-linear in the first slot | Pass |
| §3.1 (sampled) | m = 0; W = {z₁ = z₀/2}; span(e₀ + e₁) | point; form (3/4)abs(z₀)² − abs(z₂)²; no positive vector | Pass |
| §3.3 (sampled) | n = 1; two axes; open piece of a sub-ball | only B; reducible; not closed, so excluded by "closed"/"complete" | Pass |
| §4.1 (sampled) | Jordan block at unit λ; three null eigenlines | λ̄⟨v,v⟩ = 0; λ₁̄λ₂ = 1 for two null eigenvectors forces a third to give abs(λ) = 1, hence elliptic | Pass |
| §4.2 | n_{(a,0)} at (0, iy) | cosh(d/√2) = 1 + abs(a)²/(2y), so d ≈ √2·abs(a)/√y | Pass |
| §4.4 covering argument | left cosets, word length ≤ m | words of length ≤ m lie in B₁; same translate ⇒ a⁻¹b ∈ V⁻¹V ∩ Λ ⊂ Λ₀; stable C_j is F-invariant and contains Λ₀ | Pass |
| §5.3 scaling | n = 1 | (2(n+1))^{−n} = 1/4; π/6 against 2π/3 (supplier §5.6 Check) | Pass |
| §6.1 new Check | y = 1000; ε = 0.1 | 0.00070710675; threshold 1/(2·sinh(0.0707)) = 7.07; ⟨R,T⟩ ≅ C₂ × ℤ, R and T commute | Pass |
| §6.1 (1) parabolic case | γ in Γ_ε(x), γb ≠ b | conjugate parabolic at γb; ping-pong gives F₂, not virtually nilpotent | Pass |
| §6.3 | SL₂(ℤ), Γ(3), Γ(2) | root-of-unity traces −2, −1, 0, 1; mod 3 excludes all but −1; −1 ∈ Γ(2) | Pass |
| §6.4 (sampled) | γ = mν; screw of order 4 | block-triangular lift: eigenvalues of γ are those of m; m^k = 1 and neat ⇒ Ad(m) = 1; eigenvalue i | Pass |
| §8.1 (sampled) | cocycle; n = 2, Γ_b = ⟨n_{(λ,0)}, n_{(iλ,0)}⟩ | LHS/RHS = e^{−4πi·Im/τ}·e^{+4πi·Im/τ} = 1; τ = 4λ², χ((1+i)λ) = e^{−πi} = −1; μ < e^{−4πN/τ} ⇔ ρ > N | Pass |
| §8.4 (sampled) | ℓ = 0, 1; f = 1, q | radial exponent (ℓ−1)(n+1): −(n+1) < −1 integrable; 0 gives ∫dr/r = ∞; dq/q invariant modulo du; K_{X^M} restricted to T_b is L_b⁻¹ | Pass |
| §9.2 | Γ(2)/±1, ℓ = 1, 2, 3; route at ℓ = 2 | dimensions 0, 0, 1 = ℓ − 2 = dim S_{2ℓ}(Γ(2)); σ = (1 − f)ν^ℓ with f vanishing on T_b, so "every ℓ ≥ 2" holds | Pass |
| §9.3 (sampled) | Γ(2)/±1; proper injective immersion | E = O(1), Veronese for ℓ ≥ 2; h⁰(O(−2)) = 0; Φ⁻¹(ζ_b) = T_b makes Φ restricted to X a closed embedding off the ζ_b | Pass |
| §9.6 | Γ₀(11) | index 12, ν₂ = ν₃ = 0, 2 cusps, genus 1 | Pass |
| §10.1 | circle abs(q) = r | 2πr/(√2·r·abs(log r)) = √2π/abs(log r) | Pass |
| §11.1 (sampled) | {1}; SL₂; 𝐆 = SL₂ × compact | {1} not commensurable with an infinite group; ker p = ±1; exactly one factor image is G since G is not abelian | Pass |
| §11.2 | SL₂; components of 𝐆(ℝ) | Γ₀\𝐆(ℝ) is a finite union of translates of Γ₀\𝐆(ℝ)⁰; fibres are ker p-orbits | Pass |
| §11.3 (sampled) | n = 1, 2; centraliser of h₀; SL₂ → PGL₂ | abs(det g)² = −1 impossible for n = 2; n = 1 swap; centraliser K; SV1 type (−1,1), SV3 from ℚ-simplicity; index 2 | Datum passes; commensurability R02 |
| §11.4 (sampled) | X(1); Picard surface | both ℙ¹; boundary a finite set, codimension 2 | Pass; *Needs:* R03.2 |
| §12.2 (sampled) | m = n; neat Γ; γ ∉ Γ_H | identity; ker r_W ∩ Γ_H finite hence trivial, so r_W(Γ_H) torsion-free and §10.3 applies; X_H ∩ γX_H a proper sub-ball | Pass; notation R03.3 |
| §12.4 (sampled) | B × {s}; B × S_Γ; {x₀} × S_Γ; torsion case | (dim W, dim U) = (n,0), (2n,n), (n,0); a component of the pulled-back intersection maps onto U, so it has dim U | Pass |

### Seeded source sample

| Target | Locator read and what it supports |
| --- | --- |
| 1.5 | BaldiUllmo2023 lines 517–519 (unipotent radical and its centre) and 559–571 (Siegel domain, D(N)); Mok2012 lines 138–154 (the group law in Siegel coordinates, the generator λ_τ). Supported. |
| 2.1 | Goldman1999 Ch. 3 is uncertified. BaldiUllmo2023 lines 35–36 do not contain the statement: R03.1. The proof is the roadmap's own. |
| 2.5 | Kiernan1972 lines 64–65: holomorphic maps decrease the Kobayashi distance. Cited for that only; the tangent argument is the roadmap's. |
| 3.1 | BaldiUllmo2023 lines 496–506: subspace, stabiliser. The README states the compact-kernel extension, not the source's product. |
| 3.3 | Same lines: stabilisers of sub-balls only. The analytic classification is deduced here and the README says so. |
| 4.1 | Mok2012 lines 325–335: the trichotomy for negatively curved manifolds. Supported; the eigenvector argument is the roadmap's. |
| 6.4 | WitteMorris2015 lines 2969–2973 (Theorem 4.8.4); BaldiUllmo2023 lines 523–524 and Proposition 3.3.3, line 530. Supported. |
| 8.1 | Mok2012 lines 152–178, equations (5)–(6) at lines 173–175: vertical component written kτ, no multiplier. The README's correction is justified by its fourth Check. |
| 8.4 | Mok2012 lines 568–572 and 600–612; the frame at line 607. Supported. |
| 9.3 | Mok2012 Main Theorem, lines 546–562. Supported, hypotheses retained. |
| 11.1 | WitteMorris2015 Definition 5.1.19, lines 3732–3739; BaldiUllmo2023 Proposition 2.3.3, lines 333–339. Supported. |
| 11.3 | BaldiUllmo2023 lines 445–454; MilneSVI lines 1686–1689. Supported for the datum; the adjoint passage is R02. |
| 11.4 | MilneSVI Theorem 3.12, line 1686, and Remark 3.13, lines 1722–1727; Mok2012 lines 123–128; BaldiUllmo2023 line 457. BailyBorel1966 is uncertified. |
| 12.2 | BaldiUllmo2023 Corollary 3.4.6, lines 686–702; lines 433–434 and 474. Supported for algebraicity, closedness and total geodesy. |
| 12.4 | BaldiUllmo2023 Theorem 1.2.2, lines 91–97. The README claims only the ordinary dimension inequality. |

### Pins and supplier citations

Pins match `lake-manifest.json` (Mathlib `1b1ccf4b…`, Tau Ceti `2fd255d9…`). I opened all 37 cited declarations at their file and line: 23 in Mathlib and 14 in Tau Ceti. All exist where cited, with the one-line offset of R03.4. `Matrix.ProjectiveSpecialLinearGroup` and `EuclideanSpace.equiv` also exist. `ProperlyDiscontinuousSMul.finite_stabilizer'` has no separation hypothesis, as the contract says.

Cross-roadmap citations resolved now:

- RealSemisimpleLieGroups (open, adds a new folder): §§5.2, 5.3, 5.4, 5.6, 5.7 at README lines 1105, 1134, 1169, 1254, 1286; every clause of the README's contract paragraph is in those sections. Its scope (lines 138–143) leaves Selberg's lemma, finite generation, non-arithmetic ball quotients and Cartan's uniqueness theorem outside.
- AdelicAlgebraicGroups §1.1 and §3.4; ShimuraVarieties §§P.1, P.2, P.6, 0.1, 0.4, 0.5, 1.2, 2.7, 3.3, 3.4a, 3.5 (all eleven `TauCeti.Shimura.*` names found at its head); PELModuli §M5.5 (three names found); ShimuraData §3.8; AlgebraicModuliForArithmeticGeometry §§5.4, 9.5; ComplexComparisonPartII §§C−1.1, C−1.2, C0.6, C1.4, C1.6, C1.9, C4.1, C4.2, C4.4 (ten names found; the heading of §C0.6 is "Fibre-dimension loci" and its body defines `analyticSetGeometry`).
- On main: FuchsianOrbifolds Layers 0–4 and L2.1; RiemannianGeometry R4.7, R5a; ComplexKahlerGeometry K1–K4, K6.0; ComplexManifolds Milestones 4–7; VonNeumannAlgebras Layer 9; SchemeAndStackFoundations §1.17 (`finiteGroupQuotient_projective`); Completed/ConformalMapping Layer 2; Completed/HopfRinow.

The fourteen "Lean names found nowhere" leads are supplier targets of ShimuraVarieties and AdelicAlgebraicGroups, all resolved above. No roadmap cites this one, so there is no cycle.

Dependency check, exact output:

```text
candidate: BallQuotientsAndComplexHyperbolicLattices is not in the merge order yet; checked as if placed after ShimuraData (the intake inserts it when its design is accepted)
depcheck: 238 roadmaps, 2149 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. RealSemisimpleLieGroups is not in the merge-order file, so the check does not see that edge; it is an open pull request adding a new folder, which may be a supplier, and the placement must come after it.

### Duplication and overlap audit

Searched by object with `roadmaps grep` (main and open heads): Selberg's lemma, Zassenhaus neighbourhoods, neat subgroups, Cartan's uniqueness theorem and the biholomorphism group of the ball have no other owner. GeometricTopology §7.3 on main proves the Margulis lemma for real hyperbolic space, a different group. The board's three indexed packages (AnalyticNumberTheory, LawrenceVenkateshMethod, LogicAndDefinabilityInNumberTheory) do not touch the subject. The overlap file lists no competing head, dropped id or revision-only id, and I found none. The shared objects found are those of R01.

Overlap check: read RealSemisimpleLieGroups, ArithmeticFuchsianGroups, KleinianGroups, ShimuraVarieties, FuchsianOrbifoldsPartII, FuchsianOrbifolds, ConformalMappingPartII, ComplexKahlerGeometry (the last five by their scope, as resolved in round 3 and unchanged in what they own); form, groups, ball, metric, sub-balls → RealSemisimpleLieGroups §5.7; KAK → LieGroups Layer 9 and P = MAN → RealSemisimpleLieGroups §3.1 (R01); n = 1 quotient and cusps → FuchsianOrbifolds; arithmetic quotients and Baily–Borel → ShimuraVarieties; Kähler and analytic-set theory → ComplexKahlerGeometry; nothing else shared.

### Headlines and Lean

Headline theorems from the Summary: Aut(B) = PU(1,n); the cusp structure theorem; finite generation; Selberg's lemma in eigenvalue form; the analytic quotient; the toroidal compactification; projectivity of S*_Γ; the extension theorem, Borel algebraicity and uniqueness of the model; the Baily–Borel comparison; Γ-special ⇔ totally geodesic; the dimension inequality in 𝔹ⁿ × S_Γ. There is no `Suggested.lean` at the design stage, so there is nothing to probe for padding and no binder comparison. Elaboration: not available (this lane does not elaborate; say so in the report). No Lean command was run.

### Wording, arrangement and reuse

I set sixteen passages beside their sources while checking locators: the fifteen sampled targets (2.1 against the lines cited, which do not contain the statement) and §11.2 against WitteMorris2015 lines 3676 and 3909–3911. I read them side by side and did not compute shared word runs mechanically. No sentence, list or proof plan follows a source clause by clause; what is shared is formulas and standard names (the Heisenberg law, the Siegel domain, "elliptic, parabolic"). No table, figure or example list is taken over. The arrangement comparison of round 3 against the contents of BaldiUllmo2023 and Mok2012 stands: the README's layers were not reordered by the repair, and BaldiUllmo2023's §§3.2–3.4 still feed Layers 1–3, 8, 6 and 12, not a run in order.

Source independence: 16 passages compared with 5 sources (BaldiUllmo2023, Mok2012, Kiernan1972, WitteMorris2015, MilneSVI), none shared; largest share BaldiUllmo2023, 39 of about 120 citation occurrences before References (Mok2012 26, WitteMorris2015 15); contents compared with BaldiUllmo2023 and Mok2012: independent. Goldman1999, Raghunathan1972 and Cartan1957 are uncertified and their wording was not compared.

## Not verifiable

- Goldman1999 Ch. 3; Raghunathan1972 Ch. VIII and XIII; Borel1969 §17; Alperin1987; Borel1972 Theorem A; BailyBorel1966 Theorem 10.11; SiuYau1982; Cartan1957: settled as uncertified, cited by locator only, not read.
- GarlandRaghunathan1970 Theorems 0.7 and 4.10: waived. The reduction theory of §6.1 (2) was read only in its secondary statement, BaldiUllmo2023 lines 649–661.
- Lean elaboration and the one-tactic probe: no `Suggested.lean`, and this lane does not elaborate.
- The merge-order placement after RealSemisimpleLieGroups: the dependency check cannot see a supplier that is not in the merge-order file.
- Ownership against open pull requests was checked at the index of 2026-11-13 through the roadmaps tool; later heads were not seen.

## Source issues

The eight issues recorded in round 3 stand; I re-read two of them at their locators and found no new one.

- **Error** in Mok2012 at §1.1, equations (5)–(6), printed p. 5, lines 173–175: the source says the vertical component of every lattice element is an integral multiple of τ; it should allow a coset t_a + τℤ, with a unitary multiplier; affects a stated result.
- **Error** in BaldiUllmo2023 at §3.2, printed p. 12, lines 500–502: the source says the stabiliser of a subspace is a product of PU(1,m) and a compact group; it should be an extension with compact kernel; affects a stated result.

## For the human reviewers

- **Scope/ordering.** The design now depends on RealSemisimpleLieGroups, another author's open roadmap that is absent from the merge-order file; the dependency check places this roadmap after ShimuraData only (gate output above).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "f01961411ab9c5fec58706ea3eb9e3da39b517e0", "job": "REV-DESIGN-BallQuotientsAndComplexHyperbolicLattices~4", "model": "fable", "worker": "chris-x8"} -->
