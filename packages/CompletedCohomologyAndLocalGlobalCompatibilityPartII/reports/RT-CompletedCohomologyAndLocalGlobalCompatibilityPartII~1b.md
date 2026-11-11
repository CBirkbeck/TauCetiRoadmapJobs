<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13017#issuecomment-6792830845 -->
Red team round 1 pass b (claude) of ea91ee6

Verdict: needs_changes

1. **F01** (P1) Reduced O-flat faithful quotients for the smooth-family tests on H have no owner

   **Location.** `packages/CompletedCohomologyAndLocalGlobalCompatibilityPartII/README.md:423` (§5.3): "Use EP Theorem 5.3 and its principal-series proof, with the type recognition of gap:principal-series-types and parent local–global compatibility: the faithful test quotients are reduced O-flat"; the same step at lines 437 (§5.4) and 540 (§6.5: "Parent §5.2 and the EP Theorem 5.3 argument identify reduced O-flat faithful quotients"), and line 265 (§3.2: "Use the imported parent theorem … for algebraic and type-specialised tests").

   **Claim.** For the tests πalg(k)⊗Vχ on the small Iwahori subgroup and πalg(k)⊗V(α,θ) on U^{m+1}(𝔄), the quotient R∞/Ann N_i is reduced and O-flat and all its characteristic-zero points have weight k and the stated smooth type. §5.1 needs exactly this as a hypothesis.

   **Witness.** Parent §5.2, first paragraph and item (1), states reducedness only for lattices in the K-type `σ^{(cr)}(h, τ)`. Vχ and V(α,θ) live on a proper open subgroup H; EP lines 1206–1209 only refer to CEGGPS Lemma 4.17(1).

   **Detail.** The parent's §5.2 at its head states reducedness and O-torsion-freeness only for a K-stable lattice in `σ = σ^{(cr)}(h, τ)`, the K-type of an inertial type (parent README §5.2, first paragraph and item (1)). Vχ and V(α,θ) are representations of a proper open subgroup H, and their inductions to K are not of the form σ(τ). EP proves the needed statement only by reference ("in the same way as part 1 of" CEGGPS Lemma 4.17, EP lines 1206–1209); CEGGPS's proof of reducedness uses regularity of the potentially crystalline ring of the single type σ (CEGGPS lines 2608–2613). No section of the parent, no other named supplier and no declared gap states it. This is a step taken from inside a source's proof at a generality the supplier does not state.

   **Repair.** Declare a supplier gap and use it in the three `*Needs:*` lines.

   1. Under `### From TauCetiRoadmap.CompletedCohomologyAndLocalGlobalCompatibility` add:
      "What CompletedCohomologyAndLocalGlobalCompatibility must provide (gap:smooth-test-quotients): For p∤2d, every compact open H⊆K, every irreducible algebraic ξ of `(Res_{F/ℚ_p}GL_d)_L` and every finite-dimensional smooth L-representation V of H with H-stable lattice Θ, the ring R∞/Ann_R∞ M∞,H(ξ°⊗Θ) is reduced and O-torsion free, and for every closed point y of its generic fibre, with image x in Spec R□_ρ̄[1/p], ρ_x is potentially semistable with the labelled Hodge–Tate weights attached to ξ in §1.1 and V occurs in the restriction to H of an irreducible smooth π with r_p(π) having the inertial type and monodromy of WD(ρ_x). Supplier section: §5.2. EP proof of Theorem 5.3, p. 365 (EP lines 1204–1209); CEGGPS Lemma 4.17(1) and proof, pp. 62–64 (CEGGPS lines 2596–2615)."
   2. Add `gap:smooth-test-quotients` (supplier `CompletedCohomologyAndLocalGlobalCompatibility`, section `§5.2`, the same `needs`) to the `gaps` list of `design/plan.json`.
   3. In §§5.3, 5.4, 6.5 replace "parent local–global compatibility: the faithful test quotients are reduced O-flat" (and the two parallel sentences) by "gap:smooth-test-quotients gives reduced O-flat faithful test quotients whose characteristic-zero points have weight k and contain the tested type", and append `gap:smooth-test-quotients` to the `*Needs:*` lines of §§5.3, 5.4, 6.5 and to the Layer 5 and Layer 6 Dependencies.

   An alternative with the same effect: extend gap:principal-series-types and gap:minimal-stratum-types to say that `Ind_H^K` of each family member is a direct sum of K-types σ(τ) of CEGGPS Theorem 3.7, and reduce to parent §5.2(1) through the induction comparison of §3.2; as written neither gap says this.

   Tested on the refuting instance: with H the Iwahori subgroup I_n0 and V=Vχ, the new contract supplies the hypothesis "each B_i is reduced and O-flat" of §5.1, which parent §5.2(1) (K-types σ(τ) only) does not.

2. **F02** (P2) The central character of Mψ is the inverse of the one the parent states

   **Location.** `packages/CompletedCohomologyAndLocalGlobalCompatibilityPartII/README.md:220` (§2.3): "On `Mψ=M∞⊗̂_{R_{detρ̄},xψ}O`, the centre acts by `δ^{-1}` … The parent supplies that Mψ is nonzero projective in the compact fixed-central-character category."

   **Claim.** The parent's §5.1 supplies Mψ with compact central character δ⁻¹, δ=(ε^{d(d−1)/2}ψ)∘Art_F.

   **Witness.** d=1, F=ℚ_5, ψ(Art 5)≡2: parent §5.1 ("compact character ξ", `ξ(c)=x_Z(c)`, Λ_Z centred at ζ̄) gives ≡2 at 5; the README's δ⁻¹ gives ≡3. CEGGPS lines 2762–2765 (transposition) decide for 3.

   **Detail.** Parent §5.1 specialises along `x_Z: Λ_Z → O`, where Λ_Z is completed at `c − [ζ̄(c)]`, ζ̄=δ̄, and says the result has "compact character ξ" with `ξ(c)=x_Z(c)` and smooth dual ξ⁻¹. So the parent's compact character is ≡δ̄ mod ϖ, the README's is ≡δ̄⁻¹. Instance: d=1, F=ℚ_5, ψ unramified with ψ(Art 5)≡2: parent compact value at 5 is ≡2, README's is ≡3. The README (and BIP Lemma 6.6, BIP lines 2396–2404) is the correct one: the Λ_Z-structure on M∞ is the transpose of that on M∞^∨ (CEGGPS lines 2762–2765), so the element c of Λ_Z acts on M∞ as the group element c⁻¹. Neither the transposition nor the identification of Λ_Z with the deformation ring of `ε^{d(d−1)/2}detρ̄` (rather than R_detρ̄) is stated, so the import as written contradicts the supplier's text.

   **Repair.** In §2.3 replace "The parent supplies that Mψ is nonzero projective in the compact fixed-central-character category." by: "Let x_Z: Λ_Z→O be the point of the parent's central algebra (§5.1) with x_Z(c)=δ(c) for c∈Z; twisting by `ε^{d(d−1)/2}` identifies Λ_Z with R_detρ̄ and x_Z with xψ, so `Mψ=M∞⊗̂_{Λ_Z,x_Z}O`. The Λ_Z-module structure on M∞ is transposed from M∞^∨ (CEGGPS §4.22, p. 67): the element c of Λ_Z acts on M∞ as the group element c⁻¹. Hence the group Z acts on Mψ by δ⁻¹ and on its Pontryagin dual by δ; the parent's 'compact character ξ=x_Z' is the Λ_Z-module character, not the group character. With this dictionary the parent's Corollary 4.26 statement gives that Mψ is nonzero and projective among compact O[[K]]-modules on which Z∩K acts by δ⁻¹." Add the Check: "For d=1, F=ℚ_5 and ψ unramified with ψ(Art_F 5)=[2], x_Z(5)=[2] while the group element 5 acts on Mψ by [2]⁻¹=[3]; reading x_Z as the group character would give [2]." Tested on the instance above: 3 on both sides.

3. **F03** (P1) The numerical capture criterion of §3.3 rests on Iwasawa-algebra dimension theory that no `*Needs:*` entry supplies

   **Location.** `packages/CompletedCohomologyAndLocalGlobalCompatibilityPartII/README.md:294` (§3.3): "For pairwise nonisomorphic smooth absolutely irreducible V_i, the growth `Σ_i(dim V_i^{H_n})²∼[H:H_n]` implies capture"; `*Needs:*` at line 303.

   **Claim.** The criterion (EP Proposition 2.23) follows from the listed needs: §3.1, three SmoothRepresentationsOfLocalGroups sections, PadicMeasuresIwasawaAlgebras Layer 1 and the two type gaps.

   **Witness.** EP lines 463–519, 532–577: the proof uses Proposition 2.18 (coinvariant growth), Lemma 2.21 (k[[H]] a domain, cyclic full-dimension modules free), Lemma 2.22. Owner not cited: NoncommutativeAndEquivariantIwasawa §§0.2, 0.5, 0.9, 0.11.

   **Detail.** EP's proof uses (EP lines 532–577) that k[[H]] is a domain for torsion-free compact p-adic analytic H, that a cyclic k[[H]]-module of full canonical dimension is free (Lemma 2.21), the growth of coinvariants `dim_k M_{H_n}∼[H:H_n]^{dim M/dim H}` along the power-compatible filtration (Proposition 2.18, EP lines 463–519) and the closed-subspace criterion (Lemma 2.22). None is a target here, and PadicMeasuresIwasawaAlgebras Layer 1/§1.7 (measures and the comparison with the completed group algebra) states none of them. An owner exists and is earlier in the merge order: NoncommutativeAndEquivariantIwasawa Layer 0 (§0.2 open uniform subgroups, §0.5 filtered rings with domain graded ring, §0.9 `gr Ω(U)` polynomial for uniform U, §0.11 global and canonical dimension without p-torsion). The README's own Check (line 301, anisotropic filtration of ℤ_p²: 2n against 3n/2) shows the coinvariant-growth statement is a real theorem with a real hypothesis, yet it is not stated.

   **Repair.** In §3.3, after the sentence introducing (H_n), state the two inputs as part of the target: "(a) Coinvariant growth: for a finitely generated k[[H]]-module M, `dim_k M_{H_n}` is bounded above and below by positive multiples of `[H:H_n]^{dim M/dim H}` along this filtration (EP Proposition 2.18, pp. 347–348, EP lines 463–519). (b) For torsion-free H, k[[H]] is a domain and a cyclic k[[H]]-module of canonical dimension dim H is free (EP Lemma 2.21, p. 349); hence a closed H-stable Π⊆C(H,L) with `dim Π^{H_n}∼[H:H_n]` is all of C(H,L) (EP Lemma 2.22, pp. 349–350)." Add to the `*Needs:*` line of §3.3 and to the Layer 3 Dependencies: "NoncommutativeAndEquivariantIwasawa §§0.2, 0.5, 0.9, 0.11", and add a supplier subsection "### From TauCetiRoadmap.NoncommutativeAndEquivariantIwasawa — §§0.2, 0.5, 0.9, 0.11. Open uniform subgroups of compact p-adic analytic groups, the polynomial graded ring of k[[U]] for uniform U and the resulting domain property, and canonical dimension without p-torsion." Where §§0.5 and 0.9 give the domain property only for uniform U, state the torsion-free non-uniform case in (b) as this roadmap's target. Tested on the refuting instance: for H=ℤ_p² and M=k[[ℤ_p]], (a) with the filtration p^nℤ_p⊕p^nℤ_p gives p^n=(p^{2n})^{1/2}; the anisotropic filtration is excluded by the power-compatibility hypothesis, as the Check requires.

4. **F04** (P2) Faithfulness is "descended" along a coefficient extension, which needs base change of M∞ that no supplier states

   **Location.** `packages/CompletedCohomologyAndLocalGlobalCompatibilityPartII/README.md:167` (§1.2): "Finite coefficient extensions are faithfully flat, so a zero local annihilator and the resulting density descend to O"; line 367 (§4.2): "Descend from any coefficient enlargement by faithful flatness"; line 191 (§2.1): "After finite coefficient enlargement making each A/𝔭 geometrically integral".

   **Claim.** `Ann_{R□}M∞=0` for the module built over O follows from the same statement after a finite extension O′/O.

   **Witness.** Parent §5.1: "`M_∞` depends on the global choices"; it states no isomorphism `M∞,O′≅M∞,O⊗_O O′`. Faithful flatness of R□_O→R□_O′ moves vanishing ideals of point sets, not the annihilator of another module.

   **Detail.** After enlarging L the parent's §5.1 builds a new patched module over O′ ("`M_∞` depends on the global choices", parent §5.1); it states no isomorphism `M∞,O′≅M∞,O⊗_O O′`. Faithful flatness of R□_O→R□_O′ transfers vanishing ideals of point sets (the densities), not the annihilator of a different module. The enlargement in §2.1 is chosen after A, hence after the patching data. The same step is silent in BIP (Lemma 6.3 enlarges L after M∞ is fixed, BIP lines 2343, 2354).

   **Repair.** No enlargement is needed for §§4.1–4.2. (i) In §4.1 replace "The component bijection of Layer 2 forces 𝔮∩R=𝔭χ" by: "R∞ is flat over R (§2.1), so by going-down 𝔮∩R is a minimal prime of R; it lies under the image x of y, and x lies on exactly one component of R, the χ-component, because `R[1/p]=∏_χ R□,χ[1/p]`; hence 𝔮∩R=𝔭χ. Geometric integrality of the A/𝔭 is not used." (ii) In §4.2 replace "Descend from any coefficient enlargement by faithful flatness." by: "The statement is for the module M∞ built over the coefficient ring O of the Conventions, with L containing the values of every character of μ_p∞(F) and of the torsion of F^×; no coefficient change of M∞ is used." (iii) In §1.2 replace "so a zero local annihilator and the resulting density descend to O" by "so the vanishing ideals of the arithmetic point sets, hence the densities, descend to O; faithfulness (§4.2) is stated for the module built over the coefficient ring in use." (iv) Add to the Conventions' enlargement sentence: "and to contain the values of all characters of the torsion subgroup of F^×". Tested: F=ℚ_p(ζ_p), d=1: R=O[μ_p][[X_1,…]] has p minimal primes over O∋ζ_p, each met by going-down from a component through a point with determinant χ; nothing about A enters.

5. **F05** (P2) Three gap contracts are compound and defined only by source numbering, one of them importing a false lemma

   **Location.** `packages/CompletedCohomologyAndLocalGlobalCompatibilityPartII/README.md:52` (gap:algebraic-capture): "Provide capture in the compact continuous category (EP Definition 2.1 and Lemmas 2.2–2.10), algebraic capture … (Proposition 3.1), and tensor stability … (Lemma 2.9)"; lines 98 and 100 (gap:principal-series-types, gap:minimal-stratum-types).

   **Claim.** Each `needs` sentence says exactly what is missing, with hypotheses.

   **Witness.** H={1}, M=O, W=0: "the family captures M⊗0=0" holds, "the zero family captures O" fails, so EP Lemma 2.6 (inside "Lemmas 2.2–2.10") is false as printed; README line 569 says so.

   **Detail.** gap:algebraic-capture asks for three results in one sentence and for "Lemmas 2.2–2.10" by number; Lemma 2.6 as printed fails for Θ=0 (H={1}, M=O, W=0: the hypothesis "captures M⊗0=0" holds, the conclusion "the zero family captures O" fails; the README's own worked example, line 569). gap:principal-series-types asks for "conductor conditions, coefficient descent, distinct-isomorphism indexing" without stating any of them. The same sentences are in `design/plan.json`.

   **Repair.** Split and state. Replace gap:algebraic-capture by two gaps at parent §5.3, in the README and in the `gaps` list of `design/plan.json`:
   - "gap:capture-formalism: For a profinite group H with an open pro-p subgroup and a family (V_i) of finite-dimensional continuous L-representations: capture of a compact O[[H]]-module M is equivalent to zero common kernel of all continuous H-maps M→V_i*; captured modules are O-torsion free; for O-torsion-free M capture is equivalent to density of the evaluation map into Π(M); a product is captured exactly when every factor is; an endomorphism killing every Hom(M,V_i*) of a captured M is zero; and if (V_i) captures every projective and W≠0 is finite-dimensional continuous, then (V_i⊗W) captures every projective."
   - "gap:algebraic-capture: For an affine finite-type group scheme 𝐆 over ℤ_p whose generic fibre over L is split connected reductive, the irreducible rational representations of 𝐆_L capture every projective compact O[[𝐆(ℤ_p)]]-module."
   Rewrite gap:principal-series-types as: "For n_0 with I_{n_0} torsion free and every n>n_0, and every tuple χ=(χ_1,…,χ_d) of smooth characters of U_F^{n_0} with χ_i of conductor n−i+1, provide the irreducible representation Vχ of I_{n_0} induced from T^{n_0}J_{n+1}, defined over a finite extension of L, with Vχ≇Vχ′ for χ≠χ′, dim Vχ=[I_{n_0}:T^{n_0}J_{n+1}], and Hom_{I_{n_0}}(Vχ,π)≠0 for irreducible smooth π exactly when π is an irreducible principal series induced from a character restricting to χ on T^{n_0}." Rewrite gap:minimal-stratum-types in the same form (objects: η(θ), V(α,θ); statements: irreducibility, EP Lemmas 3.20–3.21 invariants and dimension, pairwise non-isomorphism count of Proposition 3.25, occurrence equivalence of Proposition 3.19 and its tame induced-character form). Tested on the refuting instance: the new capture-formalism sentence carries W≠0, so H={1}, M=O, W=0 is outside it.

6. **F06** (P3) §2.2 has no consumer

   **Location.** `packages/CompletedCohomologyAndLocalGlobalCompatibilityPartII/README.md:204–216` (§2.2 "Roots of torsion-free characters").

   **Claim.** Every target is what a final target needs.

   **Witness.** README search for "2.2": this section appears only as its heading (line 204). BIP lines 2447–2483 (proofs of Theorems 6.8 and 6.1) do not use Lemma 6.4.

   **Detail.** No `*Needs:*` line, proof plan or the "Downstream consumers" section cites §2.2 (searched the README for "2.2": the only hit that is this section is its own heading at line 204). BIP uses Lemma 6.4 nowhere in the proofs of Theorems 6.1 and 6.8 (BIP lines 2447–2483); the one place a d-th root of a character is taken on this route is inside the proof of BIPD Proposition 2.7 (BIPD lines 311–312, an unramified character), which this roadmap delegates to gap:crystalline-lift-prescribed-determinant.

   **Repair.** Delete §2.2, its three Checks, and the entries "ClassFieldTheory Layer 7; LocalGaloisDeformationRings §1.19" that it alone contributes to the Layer 2 Dependencies; move "LocalGaloisDeformationRings §1.19" (the ring R_detρ̄) to the `*Needs:*` line of §2.3, which uses R_detρ̄ without citing its owner. In "How to read the build" nothing changes. If the supplier of gap:crystalline-lift-prescribed-determinant is to consume the statement, that supplier states it.

## Dependency check

Output of the `gate --depcheck` command of the brief on `packages/CompletedCohomologyAndLocalGlobalCompatibilityPartII/README.md`:

```
depcheck: 237 roadmaps, 2150 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The supplier R03 adds, NoncommutativeAndEquivariantIwasawa, is earlier in the merge order; R01 and R05 add gaps on the parent, already a supplier.

## Record of the pass

`Suggested.lean` declares nothing (one `import Mathlib`, the module docstring, an empty namespace), so the declaration table is empty and there is no `#check` comparison to make. Targets:

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| Conventions: weights | d=2, k=(2,0); k=(1,0) | a=(1,0), highest weight (−a_2,−a_1)=(0,−1); a=(0,0) | agrees with CEGGPS ξ_i=−a_{n+1−i} |
| Conventions: Artin sign | F=ℚ_5, u=2 | arithmetic Art(u) acts on p-power roots by u⁻¹, so ε∘Art_geom(2)=2, arithmetic 1/2 | sound |
| Conventions: twist | d=1; d=2 on diag(ϖ,1) | exponent 0; `|ϖ|^{−1/2}=q^{1/2}` | sound |
| §1.1 point sets | d=1; d=2 Steinberg; ψ=χ∘N | Σspcd=Σprnc=Σ_k; N≠0 in neither; Ind=χ⊕χη reducible | sound |
| §1.2 lift input | p=d=3 | 3 divides 6: patched statements excluded, §5.2 not | sound |
| §2.1 components | A=O[[x]]/(x²−ϖ); O[[u,v]]/(uv) | 1 then 2 minimal primes after adjoining √ϖ; 2 and 2 | sound; enlargement order: R04 |
| §2.2 roots | d=1; d=p, ψ(γ)=1+p; F=ℚ_3, d=2, ψ(t)=−1 | η=ψ; b≡1 since b^p≡1; η(t)²=1≠−1 | sound; no consumer: R06 |
| §2.3 centre | d=1, ψ=1; d=2, F=ℚ_5, u=2; d=1, ψ(Art 5)≡2 | δ=1; δ(2)=2, compact 1/2; parent's x_Z(5)≡2 against group action ≡3 | R02 |
| §3.1 capture | H=1, M=O; empty family; M=O/ϖ; W=0 | kernel 0; kernel M; all maps 0; kernel O | sound |
| §3.2 tests | M=O[[K]], n=2, r=1; d=1, F=ℚ_5, index 4; B/(x²) | 2=2; 4=4; Ann=(x²), x≠0 | sound; reducedness input: R01 |
| §3.3 smooth capture | d=1; general d; ℤ_p² anisotropic | q^n; q^{nd(d−1)}·q^{nd}=q^{nd²}; p^{2n} against p^{3n/2} | counts sound; inputs unowned: R03 |
| §3.4 density | 𝐆=1, T=L^r, T=0; Π=0 | image L, image 0; 0 | sound (T≠0 needed) |
| §3.5 detection | d=1; d=2, exponent 1, −1 | θ; (1,0); (0,−1), weight sums 1, −1 | sound |
| §4.1 detection | L[x,y]/(xy), points (1,0), (0,0); two A-components | one component, two components; half the pairs met | sound; simpler route in R04 |
| §4.2 faithfulness | B=O[[x]]/(x²); F=ℚ_p(ζ_p), d=1 | ⋂ minimal primes=(x)≠0; p components each met | sound over the standing L; descent: R04 |
| §5.1 criterion | O[[x]]/(x²); O[[x]]/(ϖx); N=0; R=M=O | x≠0 vanishes at all points; x=0 in B[1/p]; B=0; closure Spec O | sound |
| §5.2 crystalline | p=2, d=1, F=ℚ_2; d=2 trivial ρ̄ | (−1)^n hits ±1; two disjoint components each with a point | sound given the gaps |
| §5.3 principal series | d=1, ℤ_p | p^n characters of order dividing p^n | sound given R01 |
| §5.4 supercuspidal | d=1; d=2 ψ=ψ∘c | E=F; reducible, in Σprnc not Σspcd | sound given R01 |
| §6.1 benign | d=1; d=2 eigenvalues 1,p | all crystalline points benign; ratio p=p^f excluded | sound given the gaps |
| §6.2–6.3 types | W=0; d=1 trivial τ; μ of order p^a | J=R, C=∅; weight 0 proper locus; n mod p^a gives p^a characters | sound |
| §6.4 strata | totally ramified; unramified; ℚ_5, e=6, f=2; ℚ_3(ζ_3), d=1 | gcd(e,1)=1; residue ξ̄; sixth powers of 𝔽_25^× have order 4=#𝔽_5^×; ζ_3∈U^1∖U^2, least m=1, n≥3 | sound |
| §6.5 minimal stratum | p=5, d=2, ℚ_5(√5); p=3, d=3 | e=2, 5∤4, tame; 3 divides 6, excluded | sound given R01 |

## Verified sound

- Declarations read: 0 (the file declares none). The seven headline theorems (§§4.2, 5.2, 5.3, 5.4, 6.1, 6.3, 6.5) are each named in the module docstring with the missing carrier; searched the pinned Mathlib and Tau Ceti for deformation rings, crystalline and Weil–Deligne predicates and a patched module: none. No headline is statable at the pins; nothing is padding. No `set_option`, no `lemma`, one `import Mathlib`.
- Targets read: 21 subsections in six layers, the Conventions, all supplier contracts, worked examples and references (every line).
- Pinned declarations: 11 Mathlib names at the cited files and lines (`Module.annihilator` 869, `Module.mem_annihilator` 871, `Module.comap_annihilator` 895, `Module.annihilator_eq_bot` 901, `LinearMap.ker`/`mem_ker` 59–64, `FaithfulSMul` 47, `PrimeSpectrum.zeroLocus` 137, `vanishingIdeal` 157, `zeroLocus_eq_univ_iff` 302, `zeroLocus_vanishingIdeal_eq_closure` 159, `Submodule.mem_iInf`) and 2 Tau Ceti names (`TauCeti.completedGroupAlgebra` line 145, `TauCeti.IsCompactModule.completedGroupAlgebraModule` line 322): all present as cited.
- Locators verified against the cached texts: 74 statements in 12 sources. ST Lemma 2.1, Corollary 2.2, Theorem 2.3 (pp. 10–12); EP Proposition 2.18, Lemmas 2.21–2.22, Definition 6.8, Proposition 6.9 (p. 368), Theorem 6.12 (p. 369); BIP §6 pp. 46–50 and Corollaries 3.38, 4.19, 4.21, 4.22; EP Definition 2.1 to Proposition 2.11, Remarks 2.13 and 2.19, Proposition 2.23, Proposition 3.1, Corollary 3.2, §§3.3–3.4 (3.6–3.26), Theorems 5.1 and 5.3; CEGGPS Theorem 3.7, §3.13, Lemmas 4.17–4.18, §4.22, Proposition 4.23, Corollary 4.26, Corollary A.2; DPS Example 5.13, Remark 5.14, Theorem 7.4 to Corollary 7.8; EG Theorems 1.2.2, 6.3.2, 6.4.4; NAK Lemma 4.2 (pp. 120–122); HP Lemmas A.1, A.3, A.5; BIPD Propositions 2.6–2.7, Corollary 2.8, Theorem 3.3, proof of Theorem 4.2, Lemma 5.1, Corollary 5.2; IYE line 224, Definition 5.8, Propositions 5.9–5.10; DEJ Lemma 7.1.9 (p. 78); CON Theorem 2.3.1 (pp. 500–501). All pages and line ranges agree.
- Checks tested: all 85 Check bullets read; every one with a computable value recomputed (values in the table above); none false.
- Sibling citations checked at the current heads or on main: 38 section citations in 14 roadmaps, all present with the content cited: parent §§5.1, 5.2, 5.2a, 5.3; PadicHodgeTheory §§3.3–3.6 (the torsion-matching crystalline character is in §3.6); LocalGaloisDeformationRings §§F.0.1, 1.1, 1.19, 3.1, 3.4, 3.9; DeformationAndDerivedPatchingAlgebra §§1.12, 4.4, 4.6, 4.7; CompletedCohomologyPartII §§F.1, F.2, F.4, 3.2; PadicLocalLanglandsForGL2Qp §§0.1, 3.6a; ClassFieldTheory §2.6 (mapped to Conventions C.6 by that roadmap's correspondence table), Layers 7, 9; ReductiveGroups Layer 6, §10B; SmoothRepresentationsOfLocalGroups §§SR.2.1, SR.3.1, SR.3.2, SR.5.2; EndoscopicTransferAndUnitaryTraceComparison §§10.21, 10.26, 10.30; PadicMeasuresIwasawaAlgebras Layer 1, §1.7; ModularityAndLanglandsExtensions §2.1; ArithmeticGaloisRepresentations §1.3; AdicSpacesPartIII §R2.9. The content mismatches found are R01 (parent §5.2) and R02 (parent §5.1).
- Gaps: the 13 slugs of `design/plan.json` equal the 13 README contracts, each with a named supplier and section; precision defects are R05; missing gaps are R01.
- Ownership: searched the open heads and main for the capture formalism, EP Theorem 5.3, CEGGPS Lemma 4.17, analytic-vector density, uniform pro-p Iwasawa algebras and the trianguline/benign geometry. Owners found: the parent (patching, benign loci), PadicLocalLanglandsForGL2Qp §3.6a (rank two over ℚ_p, cited), NoncommutativeAndEquivariantIwasawa Layer 0 (R03). No second owner of this roadmap's targets; `Suggested.lean` declares no name, so there is no name clash.
- Policy: the pull request changes only the package folder (README, `design/plan.json`, two reports); no pull-request numbers or process narrative in the README or the Lean docstring; every target has a locator.
- Settled findings: no earlier repair report marks a finding "not actionable in this package"; nothing is re-raised.

## Not verifiable

- EG printed page numbers (pp. 3, 165, 168–169): the cached author copy carries PDF pages 13, 175, 178; the constant offset 10 is consistent, the printed pagination was not seen.
- That the proof of IYE Proposition 5.10 applies to every ρ̄ and that NAK Lemma 4.2 imposes no condition on p (gap:crystalline-closure-components, gap:local-benign-crystalline-points): declared gaps; the proofs were not re-derived.
- The equality of the K-types `Ind_H^K Vχ` and `Ind_H^K V(α,θ)` summands with CEGGPS's σ(τ) (the alternative repair of R01): not in any cached source.
- Whether NoncommutativeAndEquivariantIwasawa Layer 0 states the domain property of k[[H]] for torsion-free non-uniform H: not found by search; R03's repair covers both cases.

## Source issues

- **Error** in BIP at Lemma 6.5, proof, printed pp. 47–48: the source says its character, algebraic on units and trivial on the uniformizer, agrees with the given one modulo the uniformizer of O; it should be multiplied by the unramified character matching the residual value at the uniformizer of F; affects the proof.
- **Gap** in BIP at Theorem 6.8, proof, printed p. 49: the source says the whole support of the algebraic test module lies in one irreducible component inside the support of the patched module; it should choose a component through one characteristic-zero point of the fixed-determinant fibre; affects the proof.
- **Gap** in BIP at Lemma 6.3 and Theorem 6.8, printed pp. 47, 49: the source enlarges the coefficient field after the patched module is fixed without relating the two patched modules; it should fix the field first or use flatness and going-down for the contraction of minimal primes; affects the proof.
- **Error** in EP at Lemma 2.6 and Lemma 2.9, printed pp. 343–344: the source says tensoring a capturing family with any finite-dimensional W preserves capture; it should require W nonzero, since the zero lattice is free and gives no information; affects a stated result.
- **Misprint** in CEGGPS at §4.22, paragraph before Corollary 4.26, printed p. 70: the source says the centre acts by the inverse character on the smooth side and by the character on the compact side; it should be the reverse, given that the central algebra acts on the patched module by transposition; affects nothing.
- **Gap** in DPS at Corollaries 7.7–7.8, printed pp. 42–43: the source says the twisted evaluation map has dense image for every finite-dimensional continuous representation; it should assume that representation nonzero, as the last step cancels it; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "ea91ee646399cb37185dcdc8e9cadbc0f61e2d48", "job": "RT-CompletedCohomologyAndLocalGlobalCompatibilityPartII~1b", "model": "fable", "worker": "chris-x8"} -->
