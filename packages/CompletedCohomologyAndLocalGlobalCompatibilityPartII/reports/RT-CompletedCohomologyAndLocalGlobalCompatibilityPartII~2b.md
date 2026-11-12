<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13017#issuecomment-6795531360 -->
Red team round 2 pass b (claude) of b17c42c

Verdict: needs_changes

1. **F01** (P2) §2.2 attributes to the parent §5.1 a central-character sign the parent states the other way

   **Location.** `packages/CompletedCohomologyAndLocalGlobalCompatibilityPartII/README.md:216`: "The parent's character `ξ=x_Z` of §5.1 is the character by which Λ_Z acts; as a group character on the compact module it is ξ⁻¹". Also line 218: "Use parent central projectivity through the dictionary above".

   **Claim.** The parent §5.1 supplies: Z acts on `M∞⊗̂_{Λ_Z,x_Z}O` by `x_Z⁻¹`, and this module is projective among compact modules with that character.

   **Witness.** CompletedCohomologyAndLocalGlobalCompatibility §5.1 at its open head: "`C_ξ(O)`, the category of profinite augmented ZK-representations with compact central character `ξ(c)=x_Z(c)`" and "smooth-dual character `ξ⁻¹`". At d=1, F=ℚ_5, x_Z(5)=[2] the parent gives [2]; this README's own Check gives [3].

   The README's sign is the correct one (CEGGPS lines 2759–2765, BIP lines 2409–2410). But the supplier as written makes the opposite statement, and with the parent's literal category `Mψ` is not an object unless `x_Z²=1`. So §§2.2, 3.5 and 4.1 consume a statement the cited section does not make.

   **Repair.**

   1. Replace the quoted sentence of line 216 by: "The parent §5.1 labels this specialisation as having compact central character `ξ(c)=x_Z(c)` and smooth-dual character ξ⁻¹, the labels printed in CEGGPS lines 2867–2875. By the transposition above the group acts on the compact module by `x_Z⁻¹` and on its dual by `x_Z`. The statement consumed here is gap:fixed-centre-specialisation."
   2. Add under "From TauCetiRoadmap.CompletedCohomologyAndLocalGlobalCompatibility", and with the same `needs` to the top-level `gaps` of `design/plan.json` (supplier CompletedCohomologyAndLocalGlobalCompatibility, section §5.1): "What CompletedCohomologyAndLocalGlobalCompatibility must provide (gap:fixed-centre-specialisation): For every continuous O-algebra map `x_Z:Λ_Z→O`, the group Z acts on `M∞⊗̂_{Λ_Z,x_Z}O` by `c↦x_Z(c)⁻¹` and on its Pontryagin dual by `c↦x_Z(c)`, and `M∞⊗̂_{Λ_Z,x_Z}O` is a nonzero projective object of the category of compact O[[K]]-modules on which Z∩K acts by `c↦x_Z(c)⁻¹`. Supplier section: §5.1. CEGGPS §4.22, p. 67 (CEGGPS lines 2759–2765), and Corollary 4.26, p. 70; BIP Lemma 6.6, p. 48 (BIP lines 2396–2412)."
   3. Add gap:fixed-centre-specialisation to the *Needs:* of §2.2 and to the Layer 2 Dependencies, and name it in the first paragraph of the parent's supplier subsection.

   Test on the witness: x_Z(5)=[2] gives group action [2]⁻¹=[3] on the compact module and [2] on the dual, which is the Check of §2.2.

2. **F02** (P3) gap:capture-formalism is stated for a wider class of groups than the gap it rests on

   **Location.** README.md:52: "For a compact group H with an open pro-p subgroup … capture of O[[H]] is equivalent to capture of every projective". README.md:50: "The passage from O[[H]] to every projective uses gap:projective-products." README.md:120: "For compact p-adic analytic H, every projective pseudo-compact O[[H]]-module is a product …".

   **Claim.** The equivalence clause, at the generality of gap:capture-formalism, follows from gap:projective-products.

   **Witness.** H=∏_ℕ ℤ_p is compact pro-p and not p-adic analytic. The clause of gap:capture-formalism quantifies over it; gap:projective-products says nothing about it. EP Lemma 2.8 (EP lines 325–332) uses the decomposition for every profinite K.

   **Repair.** In README.md:120 and in the `needs` of gap:projective-products in `design/plan.json`, replace "For compact p-adic analytic H" by "For a profinite group H with an open pro-p subgroup". The rest of the sentence is unchanged. At H=∏_ℕ ℤ_p the ring O[[H]] is local and every projective is a product of copies of it, so the widened statement holds on the witness, and both gaps now have the generality of EP §2.1.

3. **F03** (P3) the two notions of Zariski density agree only on a reduced space, and IYE Definition 5.8 does not state the equivalence

   **Location.** README.md:17: "for these quasi-Stein spaces this is equivalent to the vanishing of every global rigid function that is zero on the subset (BIPD p. 1, BIPD lines 31–32; IYE Definition 5.8, IYE lines 1012–1016)".

   **Claim.** Quasi-Steinness alone gives the equivalence, and the two locators support it.

   **Witness.** A=O[[x]]/(x²): (Spf A)^rig is one point S, dense for closed subsets, yet x vanishes on S and x≠0. BIPD lines 31–32 define density by functions; IYE lines 1012–1016 only define a Zariski closure. Neither states the equivalence.

   **Repair.** Replace the clause by: "for a reduced quasi-Stein space, such as (Spf R□_ρ̄)^rig (R□_ρ̄ is reduced by gap:framed-ring-components), this is equivalent to the vanishing of every global rigid function that is zero on the subset, since a Zariski-closed analytic subset is the zero locus of global functions and a function vanishing at every point of a reduced space is zero. BIPD uses the second form (BIPD p. 1, BIPD lines 31–32), IYE the first (IYE Definition 5.8, IYE lines 1012–1016). For A=O[[x]]/(x²) the single point of (Spf A)^rig is dense in the first sense, while x vanishes on it and is not zero." On the witness the repaired sentence excludes A (not reduced) and records it as the negative control.

4. **F04** (P3) the PGL₂(ℤ₂) Check of §3.4 does not test the theorem

   **Location.** README.md:314: "The six indicators of H→PGL₂(𝔽₂)≅S₃ span a six-dimensional analytic subspace; indicators on finer open cosets approximate every continuous function uniformly."

   **Claim.** This is a Check of fixed-centre algebraic density.

   **Witness.** The same sentence holds for every profinite group, reductive or not. Indicators of proper open subsets are not algebraic matrix coefficients, so nothing about the span of `Hom_H(T⊗ξ′,Π^la)⊗(T⊗ξ′)` is computed. No Check of §3.4 tests the direct-summand hypothesis.

   **Repair.** Replace that Check by: "For 𝐆=𝔾_m over ℚ_5, H=Z_H=ℤ_5^×, δ(z)=z and T=δ, the quotient 𝐆/Z is trivial, so ξ′ is the trivial representation only. For Π=Cδ(H,L), the line of h↦h⁻¹, `Hom_H(T,Π)⊗T→Π` is an isomorphism of lines. For the trivial representation Π=L, which is admissible and unitary but is not a summand of any `Cδ(H,L)^m` (2 acts on it by 1, not by δ(2)=2), `Hom_H(T,Π)=0` and the image is 0, not dense: the direct-summand hypothesis cannot be dropped." Both halves agree with DPS Corollary 7.8 (DPS lines 1985–1997).

One P2 (S01) and three P3 (S02–S04). All nine round-1 findings are repaired at this head and no repair introduced an error. `Suggested.lean` declares nothing, correctly: no headline is statable at the pins.

## Round-1 findings at this head

| Id | Status | Repaired passage (`packages/CompletedCohomologyAndLocalGlobalCompatibilityPartII/README.md`) | Witness re-run |
| --- | --- | --- | --- |
| 1a/F01 (P2) normalization images | repaired | line 138: "the irreducible components of (Spf A)^rig, with their reduced structures, are the images under the normalization map of the rigid generic fibres of the connected components of the normalization" | CON line 1059–1061 says images. Cusp `ℤ_5[[x,y]]/(y²−x³)`: disc → cusp bijective, tangent dimensions 1 against 2 (Check, line 419). For `R□` the pieces `Spf R□,χ` are closed, so images = fibres (line 412). |
| 1a/F02 (P2) `Cδ` undefined | repaired | line 307: "`Cδ(H,L)={f∈C(H,L) : f(zh)=δ(z)^{-1}f(h) …}` … left translation `(g·f)(h)=f(g^{-1}h)`; thus z∈Z_H acts on it by δ(z)" | `(z·f)(h)=f(z⁻¹h)=δ(z)f(h)`. H=ℤ_5^×, δ(z)=z: line of `h↦h⁻¹`, 2 acts by 2. Agrees with DPS lines 1981–1984 and BIP lines 2436–2439. |
| 1a/F03 (P2) depths without minimal elements | repaired | line 291: "Classes exist only at admissible depths, those n′ for which E contains a minimal element of valuation −n′ … Admissible depths have bounded gaps" | `α₀^j`, j≡1 mod e(q_E−1): valuation −jn₀, gcd(e,jn₀)=1, residue `u^j=u`. Gap e(q_E−1)n₀. ℚ_5(√5): even depths empty, odd depths admissible. EP Lemma 3.16 (line 774) covers it. |
| 1b/F01 (P1) smooth tests on open H unowned | repaired | line 56: "What CompletedCohomologyAndLocalGlobalCompatibility must provide (gap:smooth-test-quotients): For every compact open subgroup H of K …" | Slug in `design/plan.json` with supplier parent §5.2. Used in §§3.2, 5.3, 5.4, 6.5. Steinberg K-type: `π^{K(1)}=1⊕St` for unramified principal series, so the N=0 clause is off there, on for Vχ. |
| 1b/F02 (P2) central-character dictionary | repaired, but see S01 | line 216: "the element c of Λ_Z acts on M∞ as the group element c⁻¹. Hence the group Z acts on Mψ by δ⁻¹ and on its Pontryagin dual and on Π(Mψ) by δ" | CEGGPS lines 2759–2765 (transpose); BIP lines 2409–2410. d=1, ℚ_5, x_Z(5)=[2]: group acts by [3], [2][3]=[6]=[1]. The dictionary is right; its attribution to the parent is S01. |
| 1b/F03 (P1) growth criterion inputs unowned | repaired | line 291: "(a) Coinvariant growth … CompletedCohomologyPartII §5.8 … (b) … k[[H]] is a domain (gap:torsion-free-iwasawa-domain) … (c) For the closed-subspace criterion …" | CompletedCohomologyPartII §5.8 at its head states the bound for uniform U, power filtration. NoncommutativeAndEquivariantIwasawa §F.1 has `iwasawa_dimension_finiteIndex`; §0.11 defines canonical dimension. AB lines 382–390 give the domain theorem. EP lines 542–607 match (a)–(c). |
| 1b/F04 (P2) coefficient extension of M∞ | repaired | line 356: "`dim R∞/𝔮=dim R+dim A−1` for the minimal prime 𝔮, while `dim (R/𝔭)⊗̂_O A=dim R/𝔭+dim A−1`; hence dim R/𝔭=dim R and 𝔭 is a minimal prime of R" | R=O[[u]], A=O[[x]]/(x(x−ϖ)): minimal primes (x),(x−ϖ) give 2=2+1−1 and contract to 0; (x,u) gives 1 and (u). LocalGaloisDeformationRings §F.0.1 states both dimension formulas. |
| 1b/F05 (P2) compound gaps | repaired | lines 52, 54, 108, 110: gap:capture-formalism and gap:algebraic-capture separate; the two type gaps state objects, dimensions, invariants, counts and occurrence | Each clause matched to EP: Lemmas 2.2–2.5, 2.7–2.9 (lines 273–345), 2.14–2.17 (404–442), Prop. 3.1 (616), §3.3 (657–746), §3.4 (783–916). Residual generality mismatch: S02. |
| 1b/F06 (P3) unused old §2.2 | repaired | Layer 2 has only §2.1 and §2.2 (central character); no "character-root" mention remains | `grep` finds no citation of the deleted target; BIP lines 2447–2483 do not use Lemma 6.4. |

## Record of the pass

`Suggested.lean` declarations: none (module docstring and an empty namespace). The table is of the README's bold targets.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: weights, πalg | d=2, k=(2,0); k=(1,0) | a=(1,0), dual weight (0,−1); a=(0,0) | agrees with CEGGPS lines 527–532 (`ξ_{κ,i}=−a_{κ,n+1−i}`) | none |
| Conventions: δ and Artin | d=2, ℚ_5, ψ=1, u=2 | ε∘Art_geom(u)=u·\|u\|=2; arithmetic 1/2 | consistent with CEGGPS lines 533–535 | none |
| Conventions: r_p twist | d=1; d=2 at diag(ϖ,1) | exponent 0; `\|ϖ\|^{−1/2}=q^{1/2}` | CEGGPS line 497 | none |
| Conventions: Zariski density | A=O[[x]]/(x²) | closed-set dense, x≠0 vanishes | equivalence needs reducedness | S03 |
| §1.1 point sets | d=1; Steinberg, d=2; crystabelline x | Σspcd=Σprnc=Σ_k; N≠0 excluded; W_F/I_{F′} abelian for abelian F′/F, so WD^{F-ss} is a sum of characters | agrees with BIP lines 2294–2309 | none |
| §1.2 lift input | d=1; p=d=3 | one summand; 3 divides 6, so only §5.2 and §6.1 apply | EG lines 193–196, 6961–6965; parent §5.1 hypothesis is exactly this lift | none |
| §2.1 components | A=O[[x]]/(x²−ϖ); A=O[[u,v]]/(uv); μ trivial | 1 then 2 primes after adjoining √ϖ; 2 primes stable; one χ | BIP lines 2339–2345 | none |
| §2.2 central character | d=1, ψ=1; d=1, ℚ_5, x_Z(5)=[2] | δ=1; compact action [3], dual [2] | correct against CEGGPS 2759–2765; parent labels the opposite | S01 |
| §3.1 capture | H=1, M=O; empty family; M=O/ϖ; W=0 | kernel 0; kernel M; kernel M; kernel O | EP Lemmas 2.2, 2.4; EP Lemma 2.6 fails at W=0 | none (source issue) |
| §3.2 testing modules | M=O[[K]], [K:H]=n, dim V=r; M=O/ϖ; H=1, M=B/(x²) | nr on both sides; test 0; Ann=(x²), x≠0 | Frobenius map `f(x)=φ(xm)`: `f(hx)=hφ(xm)`, `(g·f)=f_{gm}` | none |
| §3.3 criterion (a)–(c) | H=ℤ_p, Π level p^j; H=ℤ_p×ℤ/p; ℤ_p² anisotropic; dim H=0 | p^j against p^n; `s·s^{p−1}=0`, cyclic rank 1; p^{2n} against p^{3n/2}; H trivial gives Π=L | EP lines 542–607 | none |
| §3.3 counts | principal series; ℚ_5(√5) | `q^{nd(d−1)}·q^{nd}=q^{nd²}`; even depths empty, d(n)≥ depth n−1 term | EP (15), (18), (19); Lemma 3.21 × count gives the index | none |
| §3.4 fixed-centre density | 𝐆=1; Z_H=1; ℤ_5^×, δ(z)=z; Π=L trivial with 𝔾_m | image L; Cδ=C; line of h↦h⁻¹; `Hom_H(δ,1)=0` | DPS lines 1981–1997; PGL₂ Check tests nothing | S04 |
| §3.5 algebraic detection | d=1; d=2 exponent ±1 | θ; (1,0) and (0,−1), weight sums ±1 | BIP lines 2432–2446 | none |
| §4.1 component detection | L[x,y]/(xy); R=O[[u]], A=O[[x]]/(x(x−ϖ)) | (1,0) on one axis only; dimensions 2, 2, 1 | dimension count valid; EP Theorem 6.12 through parent §5.3(1) | none |
| §4.2 faithfulness | B=O[[x]]/(x²) | nilradical (x)≠0 | reducedness from gap:framed-ring-components | none |
| §5.1 density criterion | B=O[[x]]/(x²); B=O[[x]]/(ϖx); N_i=0; empty family | x≠0 vanishes; x dies in B[1/p]; B_i=0; M∞=0 forces R=0 | EP lines 320–382; both directions of the closure statement hold | none |
| §5.2 crystalline density | p=2, d=1, ℚ_2; components disjoint; cusp | (−1)^n at −1 meets both; a union of components meeting each of pairwise disjoint components is everything | BIPD lines 281–319, 329–354, 454–465 | none |
| §5.3 principal series | Steinberg K-type; Vχ | N=0 clause off; on | EP lines 698–710, 1202–1209 | none |
| §5.4 supercuspidal | r with `r\|I≅φ\|I`, φ irreducible; `ψ=χ∘N` | `φ\|I` multiplicity free and Frobenius-transitive, so r irreducible and N=0; χ⊕χη reducible | EP lines 824–843 | none |
| §6.1 benign density | d=1; eigenvalues 1,p | conditions vacuous; ratio p excluded | closed set missing x has admissible open complement | none |
| §§6.2–6.3 inertial types | W=0; d=1, μ of order p^a | J=R, C=∅; `σ(z)^n` gives all p^a characters | CEGGPS lines 1651–1663 | none |
| §6.4 minimal strata | uniformizer; unramified ξ; e=6, f=2 over ℚ_5; ℚ_3(ζ_3) shallow point | gcd=1; residue ξ̄; sixth powers of 𝔽₂₅^× are 𝔽₅^×; ζ_3∈U¹∖U², least m=1, n≥3 | EP lines 753–803, 1185–1190 | none |
| §6.5 minimal-stratum density | p=5, d=2, ℚ_5(√5); θ against θ⁻¹ | tame; `θ⁻¹∈C(m,−α)` with −α minimal, so the set does not depend on the Artin convention | EP lines 824–831 | none |
| gap:capture-formalism | H=∏_ℕ ℤ_p | within its scope, outside gap:projective-products | generality mismatch | S02 |
| gap:crystalline-lift-prescribed-determinant | any crystalline ψ, any p, d | BIPD Proposition 2.7 as stated | precise | none |
| gap:completed-tensor-reduced-equidimensional | generic fibre over L | reduced = geometrically reduced in characteristic 0 | "geometrically reduced" is redundant, harmless (P3 note, not a finding) | none |

## Dependency check

```text
depcheck: 230 roadmaps, 2074 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

## Verified sound

- **Read in full.** README.md (593 lines), Suggested.lean (45 lines). Declarations in Suggested.lean: 0. Bold targets read: 20 (§§1.1–1.2, 2.1–2.2, 3.1–3.5, 4.1–4.2, 5.1–5.4, 6.1–6.5), plus the Conventions and 16 gap contracts.
- **Suggested.lean.** Single `import Mathlib`, no `set_option`, no declaration, one module docstring of the required form. The seven headlines (§§4.2, 5.2, 5.3, 5.4, 6.1, 6.3, 6.5) are all named with the carrier each lacks. Pinned Mathlib and Tau Ceti have no framed Galois deformation ring, crystalline predicate or patched module (grep at the pins), so none is statable and nothing is padding. The `#check @name` comparison has no declaration to run on; I ran no Lean.
- **Pinned declarations (13).** `Module.annihilator`, `Module.mem_annihilator`, `Module.comap_annihilator`, `Module.annihilator_eq_bot` at `Mathlib/RingTheory/Ideal/Maps.lean` lines 869, 871, 895, 901; `LinearMap.ker` at `Ker.lean` 59; `FaithfulSMul` at `Faithful.lean` 47; `PrimeSpectrum.zeroLocus`, `vanishingIdeal`, `zeroLocus_eq_univ_iff` at `Basic.lean` 137, 157, 302; `zeroLocus_vanishingIdeal_eq_closure` at `Topology.lean` 159; `Submodule.mem_iInf`; `TauCeti.completedGroupAlgebra` at `Basic.lean` 145; `TauCeti.IsCompactModule.completedGroupAlgebraModule` at `Module.lean` 322. All present with the stated hypotheses.
- **Sibling citations (15 roadmaps, 38 section ids), each opened at main or at its open head.** All exist. Content checked against use for: parent §§5.1, 5.2, 5.2a, 5.3; PadicHodgeTheory §3.6 (crystalline lift with residual character and torsion values); LocalGaloisDeformationRings §§F.0.1, 1.1, 1.19; DeformationAndDerivedPatchingAlgebra §§1.12, 4.4, 4.6, 4.7; CompletedCohomologyPartII §§F.1, F.4, 5.8; NoncommutativeAndEquivariantIwasawa §§F.1, 0.11; PadicLocalLanglandsForGL2Qp §§0.1, 3.6a; ArithmeticGaloisRepresentations §1.3; SmoothRepresentationsOfLocalGroups §SR.5.2; AdicSpacesPartIII §R2.9; PadicMeasuresIwasawaAlgebras §1.7. ClassFieldTheory §2.6 resolves through that roadmap's former-numbering table. Only the parent §5.1 sign differs from its use (S01).
- **Gaps.** 16 slugs in the README equal the 16 in `design/plan.json`, same supplier and section; `needs` identical except braces in one subscript of gap:crystalline-closure-components. No supplier is `none`.
- **Locators checked against the cached texts: 75** (statement read at the cited lines, except BIP Corollaries 3.38, 4.19, 4.21 and IYE Proposition 5.10, where only the heading and page were checked). BIP (Theorem 6.1, Remark 6.2, Lemmas 6.3–6.7, Theorem 6.8, Remarks 6.9–6.10, Corollaries 3.38, 4.19, 4.21, 4.22), BIPD (Theorem 1.1, Propositions 2.6–2.7, Corollary 2.8, Theorem 3.3, proof of 4.2, Lemma 5.1, Corollary 5.2), EP (Definition 2.1 to Lemma 2.9, Proposition 2.11, Lemmas 2.14–2.17, 2.21–2.22, Proposition 2.23, Proposition 3.1, Corollary 3.2, §§3.3–3.4 in full, Theorems 5.1, 5.3, Propositions 6.9, Theorem 6.12), CEGGPS (§1.8, Lemma 2.2, Theorem 3.7, §3.13, Lemmas 4.17–4.18, §4.22, Corollary 4.26, Corollary A.2), DPS (Theorem 7.4, Corollaries 7.5–7.8), CON 2.3.1, DEJ 7.1.9, NAK Lemma 4.2, AB §§4.2–4.3, HP A.1 and A.3, EG 1.2.2, 6.3.2, 6.4.4, IYE line 224, Definition 5.8, Propositions 5.9–5.10.
- **Checks: 92 read, none false.** Those with a computable value were recomputed (the values are in the table above); one does not test its theorem (S04). Every definition has at least three.
- **Ownership.** `roadmaps grep` for benign points, crystalline density, faithfulness on `M∞` and BIP Theorem 6.8 over main and the open heads: only the parent (§§5.2a, 5.3) and PadicLocalLanglandsForGL2Qp §3.6a (rank two over ℚ_p), both cited. This roadmap is the owner of the seven headlines.
- **Policy.** The pull request changes only the package folder. No pull-request number, process word or machine path in README.md or Suggested.lean; no `lemma`; every target has a locator.

## Not verifiable

- EG page numbers (pp. 3, 165, 168–169): the cached author copy is paginated with a constant offset of 10 from the cited pages; theorem numbers and lines agree.
- The second half of EP Proposition 3.19 (tame parameters) rests on Bushnell–Henniart, not in the cache; taken as EP states it.
- IYE Proposition 5.10 for non-trivial ρ̄: the source proves it for trivial ρ̄ only; the README says so and declares it as gap:crystalline-closure-components.
- Truth of the declared gaps at their suppliers, by the brief.

## Source issues

- **Error** in BIP at Lemma 6.5, proof, pp. 47–48: the source says its unit-algebraic character, equal to 1 on the uniformizer, agrees with the given character modulo ϖ; it should be multiplied by an unramified character matching the residual value at the uniformizer; affects the proof.
- **Gap** in BIP at Theorem 6.8, proof, p. 49: the source says one minimal prime contains the whole support of the algebraic test module; it should choose a component through one point of the nonzero fixed-determinant fibre; affects the proof.
- **Error** in EP at Proposition 3.25, p. 358: the source says the number of classes at every depth n grows like q_E^n; it should say so only at depths where a minimal element of that valuation exists, zero elsewhere; affects a stated result.
- **Gap** in EP at Lemmas 2.6 and 2.9, pp. 343–344: the source says tensoring a capturing family with any finite-dimensional W preserves capture; it should require W nonzero, since the lattice must have positive rank; affects a stated result.
- **Misprint** in CEGGPS at the paragraph before Corollary 4.26, p. 70: the source says Z acts by ξ on the compact category and ξ⁻¹ on the smooth one; it should be ξ⁻¹ on compact modules and ξ on their duals, by the transposition of §4.22; affects a stated result.
- **Misprint** in EP at §2.5, p. 349: the source says the domain property is Theorem 4.3 of the Ardakov–Brown survey; it should cite the unnumbered Theorem of §4.3 there; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "b17c42c6c8dde6ab9fda063a43e2f763bfd1d651", "job": "RT-CompletedCohomologyAndLocalGlobalCompatibilityPartII~2b", "model": "fable", "worker": "chris-x8"} -->
