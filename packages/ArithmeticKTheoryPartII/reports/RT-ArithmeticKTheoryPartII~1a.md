<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13846#issuecomment-6903236950 -->
Red team round 1 pass a (claude) of 68c3405

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) The homology coefficient Bockstein is at the pin; the gap asks for it and two sentences say the library lacks it

   **Location.** `packages/ArithmeticKTheoryPartII/README.md:45`: "The pinned coefficient Bocksteins
   […] are cohomological; no Bockstein on singular homology is supplied."
   `packages/ArithmeticKTheoryPartII/README.md:165` (`gap:pontryagin-bockstein-cap`): "Provide the
   singular-homology coefficient Bockstein β_r:H_j(X;ℤ/p^r)→H_(j−1)(X;ℤ_p), the connecting map of
   0→ℤ_p→ℤ_p→ℤ/p^r→0 […] natural in X, and show […]".
   `packages/ArithmeticKTheoryPartII/Suggested.lean:26-28`: "lack a coefficient Bockstein on singular
   homology, hence the integral indecomposable quotient".

   **Claim.** Neither pinned library has the connecting map of a coefficient sequence on singular
   homology, so AlgebraicTopology must provide it.

   **Witness.** Tau Ceti pin, `TauCeti/AlgebraicTopology/SimplicialSet/Homology/Coefficients.lean:36`,
   `CategoryTheory.ShortComplex.ShortExact.map_simplicialChains`: a short exact coefficient sequence
   gives a short exact sequence of simplicial chain complexes (any AB4 coefficient category, any
   simplicial set); its module docstring (line 19) says this "gives the coefficient connecting
   homomorphisms, including Bockstein maps". The connecting map is Mathlib's
   `CategoryTheory.ShortComplex.ShortExact.δ` (`Mathlib/Algebra/Homology/HomologySequence.lean:282`),
   natural by `HomologicalComplex.HomologySequence.δ_naturality`
   (`Mathlib/Algebra/Homology/HomologySequenceLemmas.lean:56`). It is already used on singular chains of
   a space with the sequence ℤ→ℤ→ℤ/2 in
   `TauCeti/AlgebraicTopology/Singular/Coefficients/TwoDivisible.lean:60`. The local-coefficient form
   is `CategoryTheory.ShortComplex.ShortExact.twistedHomologyδ`
   (`TauCeti/AlgebraicTopology/Singular/Twisted/Coefficients.lean:151`). What the pin does not have is a
   declaration named for the singular-homology Bockstein and the Künneth Tor identification.

   **Repair.**

   1. README line 45, replace the last sentence by: "The pinned Bocksteins with their own names, among
      them `TopCat.singularCohomologyBockstein` in `TauCeti/AlgebraicTopology/Cohomology/Bockstein.lean`,
      are cohomological. On singular homology the coefficient connecting map is available without a
      name of its own: `CategoryTheory.ShortComplex.ShortExact.map_simplicialChains` in
      `TauCeti/AlgebraicTopology/SimplicialSet/Homology/Coefficients.lean` makes singular chains exact in
      the coefficients, and Mathlib's `CategoryTheory.ShortComplex.ShortExact.δ` is then β_r for
      0→ℤ_p→ℤ_p→ℤ/p^r→0, natural in the space by `HomologicalComplex.HomologySequence.δ_naturality`.
      Its compatibility with the cross product and the Künneth Tor map is not pinned."
   2. README line 165 and the same slug in `design/plan.json`, replace the `needs` sentence by: "For
      X,Y with finitely generated integral homology, with β_r the connecting map of 0→ℤ_p→ℤ_p→ℤ/p^r→0
      (first map multiplication by p^r) built from Tau Ceti's `map_simplicialChains`: if u,v generate
      cyclic summands ℤ/p^r,ℤ/p^s of H_*(X;ℤ_p),H_*(Y;ℤ_p), d=min(r,s), and β_d(x)=p^(r−d)u,
      β_d(y)=p^(s−d)v, then β_d(x×y) maps under the Künneth Tor map to a generator of
      Tor₁(⟨u⟩,⟨v⟩)≅ℤ/p^d." (Tested on the README's own instance K(ℤ/p²,1)×K(ℤ/p,1): r=2, s=1, d=1,
      β₁(x)=pu, Tor₁=ℤ/p; unchanged.)
   3. README line 163, replace "the homology coefficient Bockstein and its Künneth Tor identification
      are the extension below" by "the Künneth Tor identification of the homology coefficient Bockstein
      is the extension below". In the *Needs* lines of §§8.1 and 8.2 (lines 955, 970) and the Layer 8
      Dependencies, add `CategoryTheory.ShortComplex.ShortExact.map_simplicialChains`; §8.1 then no
      longer needs the AlgebraicTopology contract (it uses only β_r and its naturality), §8.2 keeps it.
   4. `Suggested.lean` lines 26–29, replace by: "The integral indecomposable product and low-range
      Hurewicz theorems lack a Pontryagin product for H-spaces (the pinned one covers strict monoid
      objects of TopCat) and the Künneth identification of the homology Bockstein; the Hurewicz theorem
      also lacks spectra."

2. **F02** (P2) §8.5 plans Borel's invariant-form comparison again; ArithmeticKTheory §3.4 owns it at a generality that contains Sp_(2g)

   **Location.** `packages/ArithmeticKTheoryPartII/README.md:1013`: "Prove the stable rational symplectic
   comparison with the compact dual and identify its polynomial primitive generators in degrees 4k−2."
   Line 1011: "The stable polynomial calculation is a symplectic target here". Line 15: "The stable
   symplectic integral calculation and rational Hodge generators belong to §§8.4–8.5 here". The *Needs*
   line 1021 names no owner of the comparison.

   **Claim.** No earlier roadmap supplies the comparison of the real cohomology of Sp_(2g)(ℤ) with
   invariant forms, so it is a target here.

   **Witness.** ArithmeticKTheory §3.4 at its open head (earlier in the merge order, and already a
   supplier here): `borelInvariantFormComparison`, "j_Γ^q : H^q(Lie G(ℝ), K; ℝ) → H^q(Γ; ℝ)" for every
   connected semisimple ℚ-group with G(ℝ) connected and every arithmetic Γ, bijective when 4q<rk_ℚ of
   each almost simple factor. Sp_(2g) qualifies: ℚ-rank g, Sp_(2g)(ℝ) connected.

   **Repair.**

   1. §8.5 proof plan, replace its first sentence by: "Apply ArithmeticKTheory §3.4's
      `borelInvariantFormComparison` to G=Sp_(2g), K=U(g), Γ=Sp_(2g)(ℤ): Sp_(2g) is connected,
      ℚ-simple of ℚ-rank g, and Sp_(2g)(ℝ) is connected, so H^q(𝔰𝔭_(2g)(ℝ),U(g);ℝ)→H^q(Sp_(2g)(ℤ);ℝ) is
      bijective for 4q<g. The target here is the computation of the left side: the invariant forms on
      the compact dual Sp(g)/U(g) form, in degrees below the stable range, a polynomial algebra on
      primitive classes of degree 4k−2, compatibly with block inclusion (borel1974 §10.6 and §11.4)."
      (Tested at q=2: bijective for g≥9, value ℝ·x₂, as the Check of §8.5 has it.)
   2. Line 1011, replace "The stable polynomial calculation is a symplectic target here" by "The
      comparison with invariant forms is ArithmeticKTheory §3.4; the invariant-form calculation for
      (𝔰𝔭_(2g),U(g)) and the identification of its generators with Hodge characters are targets here".
   3. Add "ArithmeticKTheory §3.4 (`borelInvariantFormComparison`)" to the *Needs* line of §8.5, to the
      Layer 8 Dependencies, and to the ArithmeticKTheory contract (line 49: "§§3.1–3.5" already covers
      the section; add the sentence "Consume §3.4's `borelInvariantFormComparison` for Sp_(2g)").
   4. Line 15, replace "The stable symplectic integral calculation and rational Hodge generators belong
      to §§8.4–8.5 here" by "Integral symplectic homology stability (§8.4) and the symplectic
      invariant-form calculation with its Hodge generators (§8.5) belong here; the comparison of
      arithmetic cohomology with invariant forms is ArithmeticKTheory §3.4".

3. **F03** (P2) Two gap contracts are stated in terms of this roadmap's own objects, so the supplier cannot state them

   **Location.** `packages/ArithmeticKTheoryPartII/README.md:135` (`gap:relative-homology-edges`):
   "Provide relative chain quotients and long exact sequences and the finite and compact relative
   homological Hochschild–Serre edges for the arithmetic pairs used here."
   `packages/ArithmeticKTheoryPartII/README.md:119` (`gap:graded-moore-realization`): "Provide a
   homotopy-coherent realization of the graded ppav Γ-diagrams preserving products, finite Moore
   smashing before completion at p=3, […]".

   **Claim.** Each sentence says exactly what the supplier must provide.

   **Witness.** "The arithmetic pairs used here" names no group, subgroup or hypothesis; the pairs are
   only in §§0.5 and 7.3 of this roadmap. "The graded ppav Γ-diagrams" are 𝒵(T) of §§4.1–4.2 here
   (merge-order position 340); EtaleHomotopyTypes (position 239) has no ppav, abelian-variety or
   Γ-diagram object in its README, so it would have to import this roadmap: a cycle.

   **Repair.** Replace the two `needs` sentences, in the README and under the same slugs in
   `design/plan.json`, by statements on the supplier's own carriers.

   - `gap:relative-homology-edges`: "For a discrete or profinite group G, a closed normal subgroup N
     with quotient Q, a closed subgroup H with HN=G, and a G-module M that is finite or a compact
     finite-type ℤ_p-module (chains completed in the profinite case): provide the relative chains
     C_*(G,H;M)=C_*(G;M)/C_*(H;M) with their long exact sequence, the relative Hochschild–Serre
     spectral sequence H_a(Q;H_b(N,N∩H;M))⇒H_(a+b)(G,H;M), natural in such data, and its edge
     isomorphism H₁(N,N∩H;M)_Q≅H₁(G,H;M)." (Tested on §7.3: G=G_q, N=Gal(H_q/K_q), H=D_q, HN=G because
     D_q≅Gal(K_q/ℚ), N∩H=1; the edge gives H₁(N;M_q)_Q≅H₁(G_q,D_q;M_q), the statement used. At q=3 both
     sides are 0.)
   - `gap:graded-moore-realization`: "For a functor from finite pointed sets to simplicial
     quasi-projective ℚ-schemes with a specified open-and-closed grading by a commutative monoid, each
     grade having finite-dimensional mod-p étale cohomology in every degree: provide Et_p^gr of §6.6 as
     a homotopy-coherent functor of such diagrams that preserves the graded finite products, with the
     Aut(ℂ)-naturality of §6.9 as a coherent action on the diagram; the variant in which each connected
     grade, pointed by a ℚ-point, is smashed with the Moore space M(ℤ/p^n,2) before completion,
     compatible with the reductions in n; and compatibility of both with the homotopy limit over n."
     §§4.2–4.4 then state that 𝒵(T) satisfies these hypotheses (dimension-vector grading, finite
     mod-p cohomology on each grade), which they already assert.

4. **F04** (P3) The auxiliary prime of §7.6 is Dirichlet's theorem, which is at the Mathlib pin; it is cited to Chebotarev Layer 10

   **Location.** `packages/ArithmeticKTheoryPartII/README.md:129`: "For the sphere-unit comparison choose
   an auxiliary prime whose residue class is primitive modulo p²; its image topologically generates
   ℤ_p×, and it avoids any prescribed finite set." Line 909 *Needs*: "Chebotarev Layer 10".

   **Witness.** `Mathlib/NumberTheory/LSeries/PrimesInAP.lean:431`,
   `Nat.infinite_setOfPred_prime_and_eq_mod`: for a unit a of `ZMod q` infinitely many primes are ≡ a.
   With q=p² and a a primitive root this is the statement used (p=3: 2 has order 6 modulo 9).

   **Repair.** Move the sentence of line 129 to "From Mathlib" as: "For the sphere-unit comparison of
   §7.6 use `Nat.infinite_setOfPred_prime_and_eq_mod` in `Mathlib/NumberTheory/LSeries/PrimesInAP.lean`
   at modulus p² and a primitive residue class: infinitely many primes ℓ topologically generate ℤ_p×."
   In the second *Needs* line of §7.6 and the Layer 7 Dependencies replace "Chebotarev Layer 10" by that
   declaration. Chebotarev Layer 10 stays for §2.3.

5. **F05** (P3) §8.4 forms Qᶦⁿᵗ of BSp∞(ℤ), which is not an H-space

   **Location.** `packages/ArithmeticKTheoryPartII/README.md:994`: "prove that
   KSp_i(ℤ)⊗ℤ_p→Qᶦⁿᵗ_i(BSp∞(ℤ)) is an isomorphism".

   **Witness.** §8.1 defines Qᶦⁿᵗ for a connected H-space. π₁(BSp∞(ℤ))=Sp∞(ℤ) is not abelian
   ([[1,1],[0,1]] and [[1,0],[1,1]] do not commute), and an H-space has abelian π₁.

   **Repair.** Write the target as "KSp_i(ℤ)⊗ℤ_p→Qᶦⁿᵗ_i(BSp∞(ℤ)⁺)", and add: "The plus map is a
   homology isomorphism, and under it the Pontryagin product of the H-space BSp∞(ℤ)⁺ is the product
   induced by block sum Sp_(2a)(ℤ)×Sp_(2b)(ℤ)→Sp_(2a+2b)(ℤ) on H_*(Sp∞(ℤ);−)." Make the same change in
   the Suggested.lean docstring only if it comes to name the space (it does not now).

Five findings: three P2 (R01–R03) and two P3 (R04–R05). No statement of the roadmap was found
false, and both Lean theorems are true as typed. The blocking findings are a supplier gap that asks
for something the pinned Tau Ceti already has (together with the README and docstring sentences that
say the library lacks it), a theorem of ArithmeticKTheory planned a second time, and two gap
contracts whose `needs` sentence is written in terms of this roadmap's own objects.

## Verified sound

**Counts.** Declarations read: 4 of 4 (`Suggested.lean`, all 112 lines). README read in full (1054
lines, 42 numbered subsections, 45 targets counting the three of §8.4 and the three of §2.4).
Locators verified against the text: 56 FGV line locators and 3 borel1974 lines, all exact (list
below). Checks: all 153 Check bullets read; those with a computable value were recomputed, as
recorded in the table of computed values below (33 rows); none is false. Supplier citations: the
cited section identifiers of all 24 supplier roadmaps were located at main or the open head, and 14
sections were read for content. Pinned declarations opened: 23. Gaps compared
with `design/plan.json`: 14 of 14, same slug, supplier and sentence (by script).

**Dependency check.** Output: `depcheck: 237 roadmaps, 2255 edges, 0 problem(s)`. No UPWARD or CYCLE
line. Suppliers not in the merge order (ClassFieldTheory, GeneralizedCohomology, BordismFormalGroups,
SymplecticGeometry, TopologicalKTheory, AlgebraicTopology, and Chebotarev under `Completed/`) are on
main.

**Package.** The pull request changes only `packages/ArithmeticKTheoryPartII/` (README, Suggested.lean,
`design/plan.json`, four repair reports). No pull-request number, process narrative, `lemma`,
`set_option`, `#eval`, or import other than `import Mathlib` in the README or the Lean file.

**Elaborated signatures.** No Lean was run (this pass is read-only). The worker's elaborated types of
the four declarations were compared with the README: no binder lost; `conjugateFractionalIdeal` and
`IsSkewCMLine` keep `[Field K] [NumberField K] [IsCMField K]`; both theorems carry `hp`, `hodd`, `hn`
and the cyclotomic and CM instances. Nothing changed.

### Suggested.lean table

| Declaration | Context | Instances and values | Result |
| --- | --- | --- | --- |
| `exists_split_prime_with_signs` (§2.3) | explicit p, n, `hp`, `hodd`, `hn`; K with `IsCyclotomicExtension {p^n} ℚ K`, `IsCMField K`; ε on real embeddings of K⁺ | q=3: K⁺=ℚ, t=±7, 7=(3+ζ₃)(3+ζ̄₃)=9−3+1, P≠P̄, 3∉(7); ε=−1 uses t=−7. t=2 fails (inert), t=3 fails (ramified, and excluded by `p ∉ span{t}`). General: narrow Hilbert field of K⁺ is unramified at finite places, K/K⁺ ramified at p, so linearly disjoint; Chebotarev gives the prime; a unit adjusts signs within the narrow class. | true; matches FGV Lemma 4.8 (FGV line 1263) with the two extra conjuncts implied by splitting |
| `conjugateFractionalIdeal` | def, real body | ℚ(i): (2+i)↦(2−i), product (5) not (2+i)²=(3+4i); (1/2)↦(1/2); 0↦0 | determines its object; the identity is excluded by the (2+i) Check |
| `IsSkewCMLine` | def, real body | ℚ(i), B=ℤ[i]: δ=i/2 gives (i/2)=𝔡⁻¹, Im=+1/2, true; δ=i gives ℤ[i]≠𝔡⁻¹ (index 4), false; δ=0 false; δ=−i/2 true with the other type; (2B, i/8) true. h(x,x)=2·Im τ(δ)·|τx|²>0 on Φ. | wrong models (zero form, inclusion only, opposite sign) excluded |
| `exists_cm_lines_with_ideal_product` (§2.4) | as the first theorem, plus Φ with `hΦ`, L≠0 | Different (ζ_p−1)⁻¹q has valuation p^(n−1)(n(p−1)−1), odd, so a purely imaginary generator δ₀ exists. B₁=x⁻¹, δ₁=δ₀t; B₂=L·L̄⁻¹·x, δ₂=δ₀/t: (δᵢ)BᵢB̄ᵢ=𝔡⁻¹, signs of t and 1/t equal, B₁B₂=L·L̄⁻¹, so a=1 works. Without `hΦ` (Φ=∅) the conclusion is false, since {τ : Im τδ>0} is always a CM type: `hΦ` is needed. | true; matches FGV Proposition 4.7 (FGV line 1232) |

One-tactic probe, by reading: neither theorem follows from a library lemma (no Chebotarev or narrow
class field at the Mathlib pin; `library-matches.md` has no same-name hit); the two definitions are
needed to state the second theorem. No padding. Headlines named as not statable in the docstring
were checked against the pins for their missing carriers (higher K-groups, spectra, KSp, ppav
moduli, relative group homology): none exists at the pins. The docstring's reason for the
indecomposable-quotient headlines is corrected by R01; those headlines remain not statable.

### README targets: computed record

| Statement | Instances tried and values | Result |
| --- | --- | --- |
| Conventions, Frobenius | ζ₅↦ζ₅², third twist 2³=8≡3; geometric 2⁻³=3³=27≡2 | agrees |
| Conventions, (1/2)H | c_BH(1)=2; q=5: 3·2=6≡1 | agrees |
| Conventions and §2.2, Gaussian line | b=(i/2)xȳ: −Tr b(1,i)=−Tr(1/2)=−1; h=xȳ, h(1,1)=1, h(1,i)=−i, Im=−1=ω(1,i); ω(v,iv)=−h(v,v); compatible J=−i | agrees with `exists_compatible` (ω(v,Jv)>0) |
| §0.1 Bott class | π₂ˢ(Bℤ/q₊;ℤ/q): π₂ˢ⊗ℤ/q=0 (ℤ/2 and 0), π₁ˢ[q]=ℤ/q, so ℤ/q; q>4 for the ring statement, q=3 maps only (FGV line 353) | agrees |
| §0.2 Picard | field: π₀=1, π₁=F×; ℤ: 2ℤ→3ℤ by 3/2 | agrees |
| §0.3 Picard–Bott | Br(O′_q)=0 (one prime over p, no real place); signs: H²(2k) has (−1)^(2k)=+1, H⁰(2k−1) has −1; ordinary K_(4k−2)(O_q)=K_(4k−2)(O′_q) since K_j(𝔽_p;ℤ/q)=0; k=1 uses β¹ | agrees with FGV line 615 and ArithmeticKTheory §6.15 table |
| §0.4 transfer descent | q=9, k=2: twist 4=i+1, i=3, χ³ of order 2 on (ℤ/9)×, field K₃ of degree 2 versus 6 | Check correct; full-cover gap needed |
| §0.5 Artin–Bott | c acts by (−1)^(2k−1)=−1 on M_q, so H_*(⟨c⟩;M_q)=0 and H₁(G_q)≅H₁(G_q,⟨c⟩) | agrees with FGV line 734 |
| §1.1 | odd alternating determinant 0; [[0,2],[−2,0]] det 4 excluded; components g↦2g, r↦r; diag(2,1/2) determinant 1 along the path | agrees |
| §1.2 | q=5: m=8; q=25: 2·5·4=40; χ^(m/2) trivial since φ(q) divides m/2 | agrees |
| §2.1 | Aut={±1,±i} for ℤ[i]; μ_(2q)⊂ norm-one units; (O,−1) reverses type | agrees |
| §3.2 | q=5: {1,2}→3, {4,2}→6≡1, i=2: 5≡0 and 20≡0; −3≡2 | agrees |
| §3.3 | Σ_a a^(2k−1)=0 by a↔−a | agrees |
| §3.4 | i=0: ℤ/q by 2; i=1: 0=0; p-adic table: ψ⁻¹=(−1)^j on K_(2j−1), +1 on K_(4k−2), −1 on K_(4k); K₃(ℤ)⊗ℤ₃=ℤ/48⊗ℤ₃=ℤ/3 | agrees with FGV line 882 |
| §3.5 | Minkowski (4/π)²·(24/256)·√125=1.699<2; K₂(ℤ;ℤ/5)=0; q=691, k=6: K₂₂(ℤ)=ℤ/691, K₂₁ torsion-free at 691, 346·2=692≡1; four-class Betti value 2·tr | agrees |
| §3.6 | i=−2: ψ⁻¹=−1 on π₋₂KU; i=−4: +1 | agrees |
| §4.4 | H₁(SL₂(ℤ);𝔽₃)=ℤ/12⊗𝔽₃≠0, zero for p>3; Sp₄(ℤ)^ab=ℤ/2 | agrees |
| §4.5 | g≥φ(q) as FGV line 1535; q=5: CM genus 2, g=4 | agrees |
| §5.1 | a of order 3 in the minus part: a·c·a⁻¹=a²c≠c | Check correct |
| §5.2 | α(gg′,m)=α(g,g′m)+α(g′,m) using trivial action on ker π; H=G: M initial and terminal | agrees |
| §5.3 | d₁=gm−m; d₁d₂=0; n=3 signs +,−,+,−; native `d` at the pin (first face ρ(g₀)⁻¹, signs (−1)^(j+1)); T_n matches term by term; C₃ on 𝔽₇: FGV 2−1=1, native 4−1=3; S₃: 1=1+0 and 0=−1+1; C₂ sign ℤ/5: H₁(G,1;M)≅M | agrees |
| §5.4 | C₂, H=1, ℤ/5: c²(m,t)=(m,t+m−m); section (m,2m): 2m+m=3m≡−2m; Λ=ℤ/9, M=ℤ/3: c−1=−2 invertible | agrees |
| §6.3 | c_H∘H=0 on K^(+) (target is the minus part); q=5: c_B(3H(x))=6x=x | agrees |
| §7.1 | Γ=C₂, sign ℤ_p: H₁(C₂;M)=ker(1+c)/im(c−1)=ℤ_p/2ℤ_p=0, H₀=0, relative H₁=ℤ_p; Γ=ℤ_p trivial: ℤ_p | agrees |
| §7.3 | |℘(q)| odd; D_q≅Gal(K_q/ℚ) abelian with central c; q=3: both relative groups 0 | agrees with FGV lines 2029, 2077 |
| §7.5 | q=5: −1≡3 mod 4; degrees −2 and 6 differ by 8 | agrees |
| §7.6 | p=3, ℓ=2: 2 has order 6 mod 9, ℤ₃/(3)=ℤ/3=K₃(𝔽₂)₍₃₎; p=5, ℓ=2: order 20 mod 25, 3 a unit; ℓ=19: 360 has 3-valuation 2, 19≡1 mod 9; exponent is 2k | agrees; corrects the source (see Source issues) |
| §7.7 | fixed points of c on an odd abelian p-group A are A⁺; minus ℤ/3: one fixed; plus ℤ/3: three | agrees; corrects the source |
| §8.1 | RP∞, p=2: I²=0 (odd+odd lands in zero groups); β₁ onto; mod-2 decomposables in degrees not a power of 2 | agrees with FGV line 2294 |
| §8.2 | K(ℤ/p²,1)×K(ℤ/p,1): Tor₁(ℤ/p²,ℤ/p)=ℤ/p, d=1, β₁(x)=pu | agrees |
| §8.3 | E=ΣH(ℤ/p): odd degrees 2j−1≤2p−3 killed by β(yʲ/j!), j≤p−1; fails at 2p−1 (γ_p indecomposable); E=Σ²Hℤ: γ_j decomposable for j≤p−1, fails at 2p; E with P¹ k-invariant from degree 1 to 2p−2 shows why 2p−2 is left out | true in the stated range |
| §8.4 | g>2i+5 is FGV's i<(g−5)/2 (FGV line 2236); i=0: g≥6; i=2: g≥10; odd m<p gives 2m≤2p−4 | agrees |
| §8.5 | borel1974 line 1249: Sp, real places, polynomial on degrees 4i−2; χ=2: 1/2, 1/4 | agrees |
| §8.6 | ch₃=c₁³/6 at p=3; d=0: 1 and 2 points; n_i odd <p gives n_i+1≤p−1, and for n_i+1=p−1 von Staudt makes the antecedent false; K_(2n_i) corresponds to H²(ℤ_p(n_i+1)) | true as stated (strict inequality) |
| Gap `bernoulli-weight-nonvanishing` | j=m+1 even ≤p−1: order of H² is the p-part of w_j·ζ(1−j); for j<p−1, p∤j so it is the p-part of the numerator of B_j; j=p−1: zero on both sides | precise and true |

**Supplier citations read for content** (each says what the README consumes): ArithmeticKTheory
§§6.11 (`cyclotomicH2Descent`, E=F(μ_m^(⊗i)) at twist i+1), 6.15 (table, signs), 6.16 (ranges i≥0;
i=0 and i≥2), 3.4, 3.5; StableHomotopyKTheory §4.18; HermitianKTheoryOfPoincareCategories §§0.5,
8.1, 8.3; GeneralAlgebraicKTheoryPartII §§4.1–4.3, 4.20; AbelianSchemesAndArithmeticModuli §A5.4(1);
BordismFormalGroups F6.3 (Adams maps of degree 2p−2, equal-power intertwining, p-power Moore
systems, telescopes); EtaleHomotopyTypes §§5.2, 5.3a, 6.6–6.9; ClassFieldTheory Layer 13
(`hilbertClassField`, `narrowHilbertClassField`, `gal_hilbertClassField_equiv_classGroup`). The
remaining cited sections were checked to exist under the cited identifiers at main or the open
head.

**Ownership against open work.** Searched by object (symplectic K-theory, KSp, integral
indecomposables, homological stability, stable cohomology of arithmetic groups, the FGV article) in
the open heads and on main. ArithmeticKTheory cites FGV for its §§6.15–6.16 only (general Bott
descent and comparison), EtaleHomotopyTypes for Appendix A.2 only (generic realizations); neither
states a target of Layers 0–8 here. GeneralizedCohomology's "KSp" is quaternionic topological
K-theory Σ⁴KO, a different object from KSp(ℤ). No `Suggested.lean` at an open head or on main
declares any of the four fully qualified names. The one duplication found is R02.

**Locators verified.** FGV lines 32, 43, 80, 271, 321, 350, 443, 615, 667, 705, 734, 806, 871, 882,
891, 911, 964, 989, 1078, 1082, 1127, 1173, 1232, 1245, 1263, 1294, 1331, 1378, 1428, 1447, 1533,
1624, 1668, 1695, 1735, 1747, 1805, 1874, 1968, 2009, 2022, 2036, 2044, 2067, 2133, 2154, 2190–2194,
2217, 2236–2255, 2272, 2295, 2318, 2729, 2773, 2786, 2811; borel1974 lines 1154, 1194, 1246.

**Copyright, wording and arrangement.** Sixteen passages were set beside the source at their
locators: §§0.1, 0.3, 0.5, 2.3, 2.4 (statement and proof plan), 3.4, 4.5, 5.1, 5.2, 6.3, 7.3, 7.6,
7.7, 8.1, 8.3, 8.6 against FGV, and §8.5 against borel1974. No sentence shares more than a formula
or a standard name with the source; the longest shared run is the displayed exact sequence of
§6.3. No table, figure or example list is taken over (FGV's examples after Theorem 8.1 are not
reused). Arrangement against FGV's contents (FGV lines 13–21), by number: Layer 0 ↔ §2 (only
§§2.1.1, 2.4, 2.7–2.8; the rest of §2 is ArithmeticKTheory's), Layer 1 ↔ §§3.1–3.2, 3.6, Layer 2 ↔
§§4.2–4.3 and Proposition 4.7, Layer 3 ↔ §5 with Theorem 3.5 and Corollary 3.10 of §3, Layer 4 ↔
§§4.1, 6.1–6.2 and Appendix A, Layer 5 ↔ §6.3 and §7.1, Layer 6 ↔ §§7.2–7.3, Layer 7 ↔ §§7.4–7.7,
Layer 8 ↔ §8. The order is forced by the *Needs* lines (§2.1 needs §0.2; §3.1 needs §§0.1, 1.1, 2.1;
§4.5 needs §3.5; §5.1 needs §4.4; §6.1 needs §§4.5, 5.1; §7.2 needs §6.3; §8.6 needs §7.4), and no
layer has the scope of one FGV section: the splitting theorem is moved from §3 to Layer 3, the
appendix is merged into Layer 4, §6 is divided between Layers 4 and 5, and §7 among Layers 5, 6
and 7. No finding.

Source independence: 17 passages compared with 2 sources, none shared; largest share FGV, 93 of 96
locators; contents compared with FGV: independent (order forced by the dependency lines, layer
scopes differ from the source's sections as listed above).

## Not verifiable

- charney1987, Corollary 4.5: paywalled and settled as uncertified. The range g>2i+5 was checked only
  against FGV's report of it (FGV lines 32 and 2236).
- The content of supplier sections beyond the 14 read (for example PELModuli §§M2.3–M6.9,
  ArithmeticGaloisDuality R02.1–R02.2, IntegralIwasawaTheory §§3.1, 7.4, 12.3): their headings exist
  under the cited identifiers; their hypotheses were not compared line by line in this pass.
- The elaboration of `Suggested.lean`: taken from the worker's elaborated signatures; no Lean was
  run here.
- §5.1's lift condition w_(cτ)=c∘w_τ is weaker than the source's (FGV line 1617 also asks each lift
  to commute with a fixed conjugation of H). The README's choice is the safe one; whether the
  source's stronger condition can always be met was not settled.

## Source issues

- **Gap** in FGV at Theorem 8.4 and its proof, printed p. 50 (FGV lines 2295–2317): the source says the Hurewicz map to integral indecomposables is bijective through degree 2p−2 because the truncation there splits as a loop space; it should be claimed through degree 2p−3, since a P¹ k-invariant of the delooping can join degrees 1 and 2p−2; affects a stated result.
- **Error** in FGV at Theorem 8.1 and the first step of its proof, printed p. 48 (FGV lines 2217–2224): the source says p at least the largest part makes each Chern character p-integral; it should be p strictly larger than every part, the factorial of a part equal to p being divisible by p; affects a stated result.
- **Misprint** in FGV at Remark 7.9, printed p. 44 (FGV lines 2036–2037): the source says Vandiver's conjecture is equivalent to the set of primes above p being one element; it should be the subset fixed by complex conjugation, as its own argument shows; affects a stated result.
- **Misprint** in FGV at footnote 13, printed p. 47 (FGV line 2193): the source says the invariants are taken for the action through the (2k−1)-st power of the cyclotomic character; it should be the 2k-th power, the twist of the coefficients; affects nothing.
- **Misprint** in FGV at Definition 7.3, printed p. 37 (FGV lines 1698–1699): the source says the splitting followed by the projection, written in the order section-then-projection as a composite on V, is the identity of M; it should be the projection composed after the section; affects nothing.
- **Misprint** in FGV at Lemma 4.8, printed p. 28 (FGV line 1264): the source says the set S consists of the real embeddings of the full cyclotomic ring; it should be those of the ring of integers of the real subfield; affects nothing.

## For the human reviewers

- **Licence.** FGV was read from the 64-page author copy on a Berkeley author page (`sources.toml`, id `FGV`, `licence_class = "author-page"`); every locator uses that copy's numbering, not the pagination of Inventiones 230.
- **Licence.** charney1987 is paywalled and recorded as uncertified; §8.4's stability range rests on its locator and on FGV's report of it (FGV lines 32, 2236).
- **Scope.** 93 of the README's 96 source locators are to one article (FGV, Inventiones 2022); two README statements (§8.3 range, §8.6 strict inequality) are deliberately narrower than that article's Theorems 8.4 and 8.1, for the reasons under Source issues.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "68c3405f34521971d7cee5defc0724e26d581c72", "job": "RT-ArithmeticKTheoryPartII~1a", "model": "fable", "worker": "chris-x91"} -->
