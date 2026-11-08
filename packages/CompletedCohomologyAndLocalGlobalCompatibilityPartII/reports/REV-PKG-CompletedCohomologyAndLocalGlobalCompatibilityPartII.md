<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/2451#issuecomment-6673296835 -->
Review (claude) of 4dd03d2

Verdict: needs_changes

1. **F01** (P3) README states the previous pins, not the manifest's

   Location: `packages/CompletedCohomologyAndLocalGlobalCompatibilityPartII/README.md`, "From Mathlib" ("The pin is `6b7abb3c7686292736be2955bd3eb9ebf63b456a`") and "From Tau Ceti" ("The pin is `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`").

   Claim: these are the pinned Mathlib and Tau Ceti revisions.

   Witness: the content checkout's `lake-manifest.json` records `mathlib` at `f6090c7095e1e56b3464c1daba5f24631f1290d2` and `TauCeti` at `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`; the two hashes in the README were the pins between the manifest commits of 2026-10-06 and 2026-10-08 and were replaced on 2026-10-08. No roadmap on main writes "The pin is".

   Repair: replace the two hashes by `f6090c7095e1e56b3464c1daba5f24631f1290d2` (Mathlib) and `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a` (Tau Ceti), or drop the two "The pin is …" sentences. Nothing else changes: every cited line number was re-opened at the manifest's pins and is correct there (`Mathlib/RingTheory/Ideal/Maps.lean` 868, 870, 894, 900; `Mathlib/Algebra/Module/Submodule/Ker.lean` 59–64; `Mathlib/Algebra/Group/Action/Faithful.lean` 47; `Mathlib/RingTheory/Spectrum/Prime/Basic.lean` 137, 157, 302; `Mathlib/RingTheory/Spectrum/Prime/Topology.lean` 159; `Mathlib/Algebra/Module/Submodule/Lattice.lean` 238; `TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean` 145; `…/CompletedGroupAlgebra/Module.lean` 344).

2. **F02** (P3) a backticked Mathlib name carries a trailing period

   Location: `packages/CompletedCohomologyAndLocalGlobalCompatibilityPartII/README.md`, §4.2 `*Needs:*` line ("Mathlib `Module.annihilator_eq_bot.`") and the Layer 4 "Dependencies" list ("Mathlib `Module.annihilator_eq_bot.`.").

   Claim: the cited declaration is `Module.annihilator_eq_bot`.

   Witness: `Mathlib/RingTheory/Ideal/Maps.lean` line 900 declares `Module.annihilator_eq_bot`; no declaration `Module.annihilator_eq_bot.` exists, and the gate checks backticked names literally.

   Repair: move the period outside the backticks in both places: "Mathlib `Module.annihilator_eq_bot`." (The §3.1 and Layer 3 citations of the same name are already correct.)

3. **F03** (P3) "flat over R□_ρ̄" in §2.1 has no supplier statement

   Location: `packages/CompletedCohomologyAndLocalGlobalCompatibilityPartII/README.md`, §2.1, "Hence R∞ is reduced, O-flat and flat over R□_ρ̄" and "Apply LocalGaloisDeformationRings §F.0.1 and DeformationAndDerivedPatchingAlgebra §4.6 for flatness, dimension and component pairs".

   Claim: the two cited sections supply flatness of `R□_ρ̄ ⊗̂_O A` over `R□_ρ̄`.

   Witness: LocalGaloisDeformationRings §F.0.1 (open head) proves "T is flat" over `𝒪` and flatness of the finite coefficient extension `B ⊗̂_𝒪 𝒪′` over `B` only; DeformationAndDerivedPatchingAlgebra §4.6 (open head) states the dimension `dim A+dim B−1` and the component pairs and says nothing about flatness over a factor. BIP line 2353 asserts the clause without proof. No later target uses it: §4.1 and §4.2 use only the component description `𝔮 ∩ R = 𝔭_χ`, and §5.1 uses only the reduced O-flat test quotients.

   Repair: delete "and flat over R□_ρ̄" from the §2.1 statement and "flatness," from the route sentence (keep "reduced, O-flat"), so that every clause of §2.1 has an owner. Tested on the instance that exposed it: with the clause removed, §2.1 still states the component bijection, §4.1's contraction argument and §4.2's faithfulness go through unchanged, since neither cites flatness over `R□_ρ̄`. If the author prefers to keep the clause, it needs its own route (O-flatness of the completed product from §F.0.1 together with flatness of the special fibre `(R□/ϖ) ⊗̂_k (A/ϖ)` over `R□/ϖ`), stated as part of the §2.1 target rather than attributed to the two sections.

Three findings, all P3; nothing blocking. The mathematics, the sampled locators, the supplier citations and the elaboration are sound. The repairs are a stale pair of pin hashes, a stray period inside a backticked Mathlib name, and one clause of §2.1 attributed to supplier sections that do not state it.

## Verified sound

**Principles.** No route-specific shortcut: crystalline and benign density (§§5.2, 6.1) are stated at every prime through the local route, and the `p ∤ 2d` restriction is carried exactly where the patched module is used (§§4.2, 5.3, 5.4, 6.3, 6.5). No re-planned roadmap: the parent's `M∞`, type-specialised modules, benign loci and support theorem are imported from CompletedCohomologyAndLocalGlobalCompatibility §§5.1–5.3 at its open head (`#1270`), and the PadicLocalLanglandsForGL2Qp §3.6a case is cited, not restated. No copied passages (sampled text compared against BIP, EP, CEGGPS, DPS, BIPD at the lines below). No algorithm. `Suggested.lean` has no `sorry`'d data, no `set_option`, no declaration.

**Sources, seeded sample (15 targets) plus the gap locators.** Every locator was opened at its line in the cache:

- §1.2: EG Theorem 1.2.2 (EG line 193, printed p. 3), Definition 6.4.2 and Theorem 6.4.4(1) (EG lines 6946, 6961–6965, printed pp. 168–169); BIP paragraph before Lemma 6.3 (BIP lines 2329–2335). Statement matches: crystalline regular potentially diagonalizable lift of every ρ̄, `p ∤ 2d` only for the patching input.
- §2.1: BIP Lemma 6.3 and proof (BIP lines 2339–2360, p. 47): `R∞ ≅ R□ ⊗̂ A`, A reduced O-torsion-free equidimensional, components `(χ, 𝔭)` after a finite extension, distinct pairs distinct. HP Lemmas A.1–A.5 (HP lines 2684–2752, pp. 48–50) and CEGGPS Corollary A.2 (CEGGPS lines 3322–3324, p. 83) support the two declared gaps as stated.
- §2.2: BIP Lemma 6.4 (BIP lines 2364–2378, p. 47): torsion-trivial ψ has a d-th root after a finite extension; BIP lines 2361–2363 confirm no `p ∤ 2d`.
- §2.3: BIP Lemma 6.6 (BIP lines 2396–2412, p. 48): centre acts by `δ⁻¹`, `δ = (ε^{d(d−1)/2}ψ)∘Art_F`, fixed-centre projectivity from CEGGPS Corollary 4.26 (CEGGPS lines 2876–2884, p. 70), algebraic θ for crystalline ψ.
- §3.1: EP Definition 2.1 and Lemmas 2.2–2.10 (EP lines 266–354, pp. 342–344); the scalar consequence is Lemma 2.7 (EP lines 320–324).
- §3.2: BIP lines 2413–2418 (p. 48) define `M∞(Θ)` and `M∞(V)`; EP Proposition 2.11 proof (EP lines 369–377, p. 345); CEGGPS Lemma 4.18 (CEGGPS line 2650, p. 65).
- §3.4: DPS Theorem 7.4 (DPS line 1912, p. 41), Corollaries 7.5–7.8 (DPS lines 1931–1997, pp. 42–43); Corollary 7.8 is stated for a connected reductive `𝐆/ℚ_p` split over L, K compact open, Π a summand of `C_ψ(K,L)^m`, exactly as §3.4 restates it with the added `T ≠ 0`.
- §3.5: BIP Lemma 6.7 and proof (BIP lines 2432–2446, p. 49).
- §4.2: BIP Theorem 6.8 and proof (BIP lines 2447–2461, p. 49), Remark 6.9 (lines 2484–2494, p. 50).
- §5.1: EP Lemmas 2.7, 2.10, Proposition 2.11, Remarks 2.12–2.13 (EP lines 320–399, pp. 344–346); BIP proof of Theorem 6.1 (BIP lines 2462–2476).
- §5.2: BIPD Theorem 3.3 (BIPD lines 349–354, p. 8), Lemma 5.1 and Corollary 5.2 (BIPD lines 454–465, p. 11), the component description via Conrad (BIPD lines 329–339); BIP Remark 6.10 (BIP lines 2495–2502, p. 50) for the rigid statement and the fixed-weight exclusion; BIP Theorem 6.1 (BIP lines 2311–2312, p. 46).
- §5.3, §5.4: BIP Theorem 6.1 and the definitions of `Σ_k`, `Σ^prnc_k`, `Σ^spcd_k` (BIP lines 2294–2312, p. 46); EP Theorems 5.1 and 5.3 (EP lines 1126–1164, 1202–1209, pp. 363–365); EP Proposition 3.19 (EP lines 824–843, p. 356).
- §6.2: CEGGPS Theorem 3.7 (CEGGPS lines 1651–1663, p. 41) and §3.13 (lines 1950–1952); EP Corollary 3.2 (EP lines 618–621, p. 351).
- §6.5: EP §3.4 (EP lines 750–928, pp. 354–358), Lemma 3.16 (line 774), Proposition 3.26 (line 919); EP line 1117 states the extension to every E generated by a minimal element, which is the generality §6.5 uses.
- Gap locators: BIP Corollaries 3.38, 4.19, 4.21, 4.22 (BIP lines 1290, 1996, 2011, 2020, pp. 25, 39–40); BIPD Propositions 2.6–2.7 and Corollary 2.8 (BIPD lines 243–315, pp. 6–7); EG Theorem 6.3.2 (EG line 6816, printed p. 165); NAK Lemma 4.2 (NAK lines 1356–1418, pp. 120–122; its proof uses only the framed crystalline ring, though NAK's standing assumption line 48 is `End(V) = F`); IYE Definition 5.8 and Propositions 5.9–5.10 (IYE lines 1012–1087, pp. 26–27; trivial ρ̄ at line 224); DEJ Lemma 7.1.9 (DEJ line 2553, printed p. 78); CON Theorem 2.3.1 (CON lines 1059–1061, pp. 500–501, R-flatness hypothesis at line 1054); ST Lemma 2.1, Corollary 2.2, Theorem 2.3 (ST lines 349, 378, 443, pp. 10–12).

No locator the author flagged as unverified exists; `sources check sources.toml` reports 0 problems; all twelve cited works are in the manifest, each with one key.

**Adversarial table** (sampled targets, headline theorems, conventions and every target a finding touches).

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: HT(ε) = −1, weight dictionary | d=2, k=(2,0); k=(1,0) | CEGGPS line 460: HT_κ(ε)={−1}; a=(k₁−1,k₂)=(1,0), highest weight (−a₂,−a₁)=(0,−1); k=(1,0) gives (0,0) | Checks agree with CEGGPS line 532 | none |
| Conventions: r_p twist | d=1; d=2 on diag(ϖ,1) | exponent (1−d)/2 = 0, −1/2; \|det\|^{−1/2}=(q^{−1})^{−1/2}=q^{1/2}; +1/2 gives q^{−1/2} | Check correct | none |
| Conventions / §2.3: geometric Artin sign | d=2, F=ℚ_5, ψ=1, u=2 | d(d−1)/2=1 so δ=ε∘Art; ε(Art_arith(u))=u^{−1} so geometric gives δ(2)=2, arithmetic 1/2; (2·f)(m)=f(2^{−1}·m)=f(δ(2)m)=2f(m) | Both Checks correct, contragredient sign pinned | none |
| §1.1 point sets | d=1; rank-2 Steinberg (N≠0); two coefficient embeddings | d=1: regularity vacuous, E=F, abelian so pst=pcris=pcrab, Σspcd=Σprnc=Σ_k; N≠0 excludes both subsets; embeddings fix the prime | Checks correct | none |
| §1.2 lift input | d=1; p=d=3 | rank one: one summand; 2d=6, 3∣6 so §§4.2, 5.3–5.4 silent, §5.2 local route applies | Checks correct | none |
| §2.1 components | A=O[[x]]/(x²−ϖ); A=O[[u,v]]/(uv); A geometrically integral | first is a DVR, one prime; over O[a], a²=ϖ, (x−a)(x+a)=0 with x−a≠x+a since 2a≠0: two; uv: two integral quotients O[[u]], O[[v]]; integral A: one component per χ | Checks correct; the flatness-over-R□ clause has no owner | R03 |
| §2.2 roots | d=1; ψ(γ)=1+p with d=p; F=ℚ_3, d=2, ψ(−1)=−1 | η=ψ; b^p=1+p, b≡1 mod the maximal ideal so b^x converges on ℤ_p; torsion of ℚ_3^× is {±1} and η(−1)²=1≠−1 | Torsion hypothesis necessary; no p∤2d used | none |
| §2.3 central character | d=1, ψ=1 | exponent 0, δ=1 | correct | none |
| §3.1 capture | H=1, M=O, V=L; empty family; M=O/ϖ; cyclic H prime to p with χ≠1; R=ℤ/4 on ℤ/2; W=0 | kernel of O→L is 0; empty family kernel M; all maps O/ϖ→V* vanish; Hom_H(O(χ),L)=0 for trivial test; 2·(ℤ/2)=0 with 2≠0; tensor family with W=0 has kernel O | Six Checks correct; W≠0 needed in EP Lemma 2.9 | none |
| §3.2 testing modules | M=O[[K]], [K:H]=n, dim V=r; K=ℤ_5^×, H=1+5ℤ_5, χ(u)=u; M=O[[x]]/(x²) over H=1 | O[[K]] free of rank n over O[[H]]: both Homs have dimension nr (n=2,r=1 gives 2); index 4, χ nonsmooth, both sides 4; M≅O², Ann=(x²), x≠0 in B/(x²) | Induction comparison and non-reducedness Checks correct; the K-map m↦(x↦φ(xm)) is H- and K-equivariant for AGR's f(hx)=σ(h)f(x), (g·f)(x)=f(xg) | none |
| §3.3 growth | principal family; d=1; ℤ_p² with p^nℤ_p⊕p^{2n}ℤ_p | dim V_χ∼q^{nd(d−1)/2}, \|X(n)\|∼q^{nd}, sum ∼q^{nd²}=[I_{n₀}:K_{n+1}] (EP (15),(18),(19)); d=1 gives q^n; coinvariants p^{2n} vs index p^{3n}, prediction p^{3n/2} | Checks correct; EP Prop 3.25's exact-depth count is empty at n with gcd(e,n)≠1, but §3.3 states the cumulative sum Σ_i(dim V_i^{H_n})², which is what EP Prop 2.23 needs (see Source issues) | none |
| §3.4 fixed-centre density | 𝐆=H={1}, Π=L, T=L^r; H=PGL₂(ℤ₂); Π=0 | e₁*⊗e₁↦1 so image L for r>0, 0 for r=0; PGL₂(𝔽₂)≅S₃ of order 6, six coset indicators span a 6-dimensional analytic subspace; Π=0 gives 0 | Checks correct; DPS Cor 7.8 hypotheses (split over L, summand of C_ψ(K,L)^m) carried | none |
| §3.5 central weights | d=1; d=2 exponents ±1; det^m | θ itself; (1,0) has sum 1, (0,−1) has sum −1 and is dominant, (−1,0) is not; det^m has exponent 2m | Checks correct | none |
| §4.1 component through a point | Spec L[x,y]/(xy); χ≠χ′ on μ_p(F); two auxiliary components | (1,0) lies only on (y), (0,0) on both; χ(ζ)≠χ′(ζ) in L′ but ≡ mod ϖ; (χ,𝔭₁) for all χ meets every local component, not every patched one | Checks correct; BIP's "Supp M∞(ξ) ⊂ V(𝔮)" is repaired by choosing the component through y | none |
| §4.2 faithfulness | B=O[[x]]/(x²); one vs two auxiliary components | ⋂ minimal primes=(x)≠0; one factor: pairs are the χ; two factors: half the pairs | Checks correct; reducedness from gap:framed-ring-components is what closes the argument | none |
| §5.1 testing density | O[[x]]/(x²); O[[x]]/(ϖx); N_i=0; R=M=O | x nilpotent nonzero; (ϖx)=(ϖ)∩(x) radical so reduced, x↦0 in B[1/p]; B_i=0 has empty spectrum and unit vanishing ideal; generic point of Spec O has kernel 0, closure all of Spec O | Reducedness and O-flatness each necessary; zero ring allowed | none |
| §5.2 crystalline density | p=2, d=1, F=ℚ_2, ρ̄ trivial; d=2 same; HT sign | μ_{2^∞}(ℚ_2)={±1}: two components (BIP Cor 4.21); x↦x^n on ℤ_2^×=1+2ℤ_2 reduces to 1, takes (−1)^n at −1; diag(χ₁,χ₀) and diag(χ₂,χ₀) have det(−1)=−1,+1 and regular weights; (2,0)↦(0,−2) keeps strictness, (1,1) stays non-regular | Checks correct at a prime dividing 2d; local route independent of p | none |
| §5.3 principal-series density | d=1 over ℤ_p; fixed τ and weight | p^n characters of order dividing p^n; fixed (τ,k) cuts a proper quotient; rigid density excluded by BIP Remark 6.10 | Checks correct; conductor conditions in X(n) force irreducible full principal series | none |
| §5.4 supercuspidal density | d=1; unramified E; ψ=χ∘N_{E/F} vs ψ∘c≠ψ | E=F, one-dimensional induction; e=1 tame; Ind(χ∘N)=χ⊕χη reducible, Mackey gives End=L when ψ∘c≠ψ | Irreducibility clause of Σspcd not automatic | none |
| §6.1 benign density | rank 1; rank 2, f=1, eigenvalues 1,p; zero test; p=2, d=1 | conditions vacuous; ratio p=p^f excluded; empty support; same two components met as in §5.2 | Checks correct; the closed-complement argument (Z Zariski closed, U its admissible open complement meeting the crystalline locus near x) is valid | none |
| §6.2 / §6.3 typed tests | W=0; trivial τ; d=1 weight 0; μ_{p^∞}(F) of order p^a | Ann(0)=R, V(R)=∅; trivial τ gives all crystalline tests; weight zero forces unramified, weights varying gives X□; ζ↦σ(ζ)^n for n mod p^a gives all p^a characters | Checks correct; σ(τ)≠0 by CEGGPS Thm 3.7 excludes the degenerate case | none |
| §6.4 minimal strata | totally ramified; unramified; F=ℚ_5, f=2, e=6; p=3, d=3, ℚ_3(3^{1/3}); p=3, d=1, F=ℚ_3(ζ₃) | gcd(e,1)=1, k_E=k_F; α=ϖ^{−n}ξ with ξ̄ generating; sixth powers in 𝔽₂₅^× form the subgroup of order 24/6=4=𝔽₅^×, so never generate (EP Example 3.15 with e=p^{f/2}+1=6); e=3 uniformizer minimal, 3∣6 so §6.5 silent; v(ζ₃−1)=1 so ζ₃∈U¹∖U², U² torsion free, m≥1, n≥3, ψ_α nontrivial on U^n⊂U² where the character is trivial | Checks correct; Σsc_{k,E,m}⊊Σsc_{k,E} witnessed | none |
| §6.5 minimal-stratum density | p=5, d=2, ℚ_5(√5); unramified E; degree-12 E over ℚ_5; shallow rank-one point | e=2,f=1, 5∤4, v(√5)=1, residue of 5^{−1}(√5)²=1, tame; e=1 places Σsc_{k,E,m} inside Σspcd_k, while an unramified character of d=1 lies in Σ_k and contains no stratum with n>0; 5∤24 but no minimal element; the shallow point is in Σsc_{k,E} and no Σsc_{k,E,m} | Checks correct; density of Σsc_{k,E} is by inclusion, as stated | none |
| Headlines in Lean | none statable | pinned Mathlib and Tau Ceti have no framed deformation ring, crystalline predicate, patched module or Berthelot generic fibre (grep of both trees: the only hits are complex Hodge theory and divided powers) | Docstring correct; no stand-in | none |

**Context.** `Suggested.lean` declares nothing, so there is no `variable` block to lose a binder from; the `#check` comparison is empty. Elaboration: `lake env lean <Suggested.lean>` from the content checkout exited 0 in 10 s with no output at all (no `sorry` warning, since there is no declaration). The one-tactic probe has nothing to probe. No padding; no headline statable at the pins is absent.

**Supplier-order audit.** Dependency check output:

```text
depcheck: 241 roadmaps, 2433 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line; the roadmap is at merge-order line 270, directly after ModularityAndLanglandsExtensions (line 269). `roadmaps resolve` on the README: cross-roadmap citations found nowhere: none; Lean names found nowhere: none. Every cited section was opened at the supplier's current head or on main: CompletedCohomologyAndLocalGlobalCompatibility §§5.1, 5.2, 5.2a, 5.3 (head `#1270`; §5.1 supplies the nonzero projective fixed-centre specialization over `Λ_Z`, §5.2 the typed modules with reduced O-flat faithful quotients and support on components, §5.2a benign loci and tangent spanning, §5.3 the `R∞`-support as a union of components); LocalGaloisDeformationRings §§F.0.1, 1.1, 1.19, 3.1, 3.4, 3.9 (`#923`); DeformationAndDerivedPatchingAlgebra §§1.12, 4.4, 4.6, 4.7 (`#1034`); CompletedCohomologyPartII §§F.1, F.2, F.4, 3.2 (`#1035`); PadicLocalLanglandsForGL2Qp §§0.1 (density of locally analytic vectors in admissible Banach representations of any p-adic Lie group) and 3.6a (`#1312`); SmoothRepresentationsOfLocalGroups §§SR.2.1, SR.3.1, SR.3.2, SR.5.2 (`#1688`; SR.5.2 owns simple strata, simple characters and maximal distinguished cuspidal types, not the three EP families, so the three gaps are precise); EndoscopicTransferAndUnitaryTraceComparison §§10.21, 10.26, 10.30 (`#999`); ModularityAndLanglandsExtensions §2.1 (`#1180`; potential diagonalizability only, no Emerton–Gee lift, so both gaps stand); ArithmeticGaloisRepresentations §1.3 (`#856`; continuous induction with both reciprocities and the transversal isomorphism); PadicHodgeTheory §§3.3–3.6 (`#1062`; §3.6 supplies the crystalline character matching the residual character and the torsion values, with the unramified factor); AdicSpacesPartIII §R2.9, ClassFieldTheory §2.6 and Layers 7, 9, ReductiveGroups Layer 6 and §10B, PadicMeasuresIwasawaAlgebras Layer 1 and §1.7 (main). No supplier drift, no upward citation, no cycle.

**Declared gaps.** All thirteen have a named supplier, the same slug in `design/plan.json` and in the README (the `needs` sentences agree verbatim, up to the brace notation `R□_{ρ̄}` in the plan), and none asks for what a supplier already states: the package narrowed gap:completed-tensor-reduced-equidimensional to reducedness after LocalGaloisDeformationRings §F.0.1 and DeformationAndDerivedPatchingAlgebra §4.6 were found to state the rest, and I confirmed that neither section states reducedness. The "geometrically reduced generic fibres" hypothesis of that gap is automatic in characteristic zero and harmless.

**Duplication by object.** `roadmaps grep` over main and all open heads for faithfulness of the local ring on `M∞`, the sets Σcris/Σprnc/Σspcd and their densities, capture, and d-th roots of torsion-trivial characters: the only owners found are the parent §§5.2–5.3 (cited) and GL2ModularityLifting §6.13 (dyadic `GL₂` faithfulness, a different object). The board index lists AnalyticNumberTheory, LawrenceVenkateshMethod and LogicAndDefinabilityInNumberTheory only. Ownership against open pull requests was checked through the roadmap index tool for every roadmap the brief names; no other open pull request builds these objects.

**Shape.** Summary, scope, conventions, supplier contracts, how-to-read, six layers each ending in Examples and Dependencies, downstream consumers, worked examples, references. Six definitions (§§1.1, 2.1, 3.1, 3.2, 6.2, 6.4) each carry an API list and 4–8 Checks; fifteen theorems each carry hypotheses, a locator and 3–4 Checks; no process words, pull-request numbers, LaTeX delimiters or machine paths (grepped). The README's only backticked identifiers are Mathlib and Tau Ceti declarations and the two pin hashes; it attributes no Lean name to itself. The import header is the single line `import Mathlib`.

**Source issues previously registered and re-read.** The BIP Lemma 6.5 slip (value 1 at the uniformizer, BIP line 2391) and the BIP Theorem 6.8 support-in-one-component gap (BIP lines 2457–2458) are both repaired in the README (Worked examples, §4.1); the EP and DPS degenerate-factor errors are excluded by the README's `W ≠ 0` and `T ≠ 0` hypotheses.

## Not verifiable

- none. Every cited text is in the cache and was read at the cited lines.

## Source issues

- **Error** in BIP at Lemma 6.5 proof, printed pp. 47–48: the source says the unit-algebraic character built from the torsion generator is congruent to the given character modulo ϖ; it takes the value 1 at the uniformizer, so an unramified Teichmüller factor must be added to match the residual character there; affects the proof.
- **Gap** in BIP at Theorem 6.8 proof, printed p. 49: the source says the support of one algebraic test module lies inside a single irreducible component of the patched ring; the closure of the union of supports being a union of components gives only a component through a chosen point; affects the proof.
- **Misprint** in BIP at Theorem 6.8 proof, printed p. 49: the source cites EP Theorem 6.12 for the scheme-theoretic support statement; that statement is EP Theorem 6.3, while 6.12 is its rigid form; affects nothing.
- **Error** in EP at Lemmas 2.6 and 2.9 and Corollary 3.2, printed pp. 343–344, 351: the source says tensor capture holds for every finite-dimensional factor; the zero factor gives the zero family, which captures only the zero module; it should require a nonzero factor; affects a stated result.
- **Error** in EP at equation (21), printed p. 355: the source says the squared dimension of the Heisenberg representation equals the index of the two hereditary-order unit groups; it equals the index of the two groups J and H, which retains the `U_E` factor and is 1 in rank one for even depth; affects a stated result.
- **Error** in EP at Proposition 3.25, printed p. 358: the source says the number of classes at exact depth n grows like `q_E^n` for every n; it is zero when gcd(e,n) ≠ 1, so the growth holds only along admissible depths, which have bounded gaps and suffice for the cumulative count of Proposition 2.23; affects a stated result.
- **Error** in DPS at Corollary 7.7, printed p. 42: the source says the evaluation map is injective for every finite-dimensional tensor factor; for the trivial group, Π = L and τ = L² the source has dimension 4 and the target 1; only the density clause holds, and it needs a nonzero factor; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "4dd03d24d764b4b45b26686d1b732d21f90ab99d", "job": "REV-PKG-CompletedCohomologyAndLocalGlobalCompatibilityPartII", "model": "fable", "worker": "chris-x19"} -->
