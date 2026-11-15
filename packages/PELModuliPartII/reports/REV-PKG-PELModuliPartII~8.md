<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13097#issuecomment-6902094337 -->
Review (claude) of 0130b8e

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) relative O-Witt vectors and K-isocrystals are owned by VectorBundlesAndIsocrystals

   **Location.** `packages/PELModuliPartII/README.md:180–181` (From Mathlib): "The relative O-Witt
   vectors of §0.1 and the relative isocrystals of §§1.5 and 5.4 are new."; line 338 (§0.1, Route):
   "Define relative O-Witt vectors with respect to π, the Witt O-frame and its windows".

   **Claim.** No roadmap on main or at an open head constructs the ring `W_O(R)` of an O-algebra R with
   respect to π, or isocrystals over K̆ with coefficient field K; this roadmap is their owner.

   **Witness.** `TauCetiRoadmap/VectorBundlesAndIsocrystals/README.md:95` at its open head (merge-order
   position 124; this roadmap 188) constructs `W_𝒪_E(A)` for any `𝒪_E`-algebra A; line 216 defines
   E-isocrystals over Ĕ. This README never names that roadmap.

   The supplier's ghost polynomials are `w_n = Σ π^i x_i^(q^(n−i))`, and it cites the text that Mih19
   Definition 11.7 refers to for the ring (Mih19 line 1918, reference [5] at line 2250), so the two
   rings are the same object, not two conventions.

   **Repair.**

   1. Lines 180–181, replace the sentence by: "The ring `W_O(R)` of relative O-Witt vectors of an
      O-algebra R with respect to π, with its ghost map and its functoriality in R, is
      VectorBundlesAndIsocrystals Layer 0, “Ramified coefficient rings and coefficient changes”; the
      isocrystals over K̆ with coefficient field K (finite-dimensional K̆-vector spaces with a bijective
      Frobenius-semilinear operator, for the lift of the q-power Frobenius fixing K), their morphisms
      and their slope classification are its Layer 1, “Finite isocrystals over the completed maximal
      unramified coefficient field”. §0.1 adds what that layer states on perfect algebras only: the
      Frobenius F, the Verschiebung V with respect to π and the augmentation ideal `I_O(R)` over an
      arbitrary O-algebra R."
   2. Under `## Exact supplier contracts` add `### From TauCetiRoadmap.VectorBundlesAndIsocrystals`:
      "Layer 0, “Ramified coefficient rings and coefficient changes” (the ring `W_O(R)` of an
      arbitrary O-algebra, ghost components `w_n(x)=Σ_{i≤n} π^i x_i^(q^(n−i))`, functoriality, the
      strict lift over a perfect algebra); Layer 1, “Finite isocrystals over the completed maximal
      unramified coefficient field” (isocrystals with coefficient field K over K̆ and their
      classification). Assumed as stated there; F, V and `I_O(R)` over a non-perfect R are §0.1."
   3. `## Scope and ownership`, list "It leaves to other roadmaps": add the bullet "Relative
      (ramified) Witt vectors of an arbitrary O-algebra and isocrystals with a ramified coefficient
      field are VectorBundlesAndIsocrystals Layer 0, “Ramified coefficient rings and coefficient
      changes”, and Layer 1, “Finite isocrystals over the completed maximal unramified coefficient
      field”; §0.1 adds the Witt O-frame (F, V, `I_O(R)`) over an arbitrary O-algebra, its windows and
      their duality."
   4. §0.1 Route, first sentence: "Take the ring `W_O(R)` from VectorBundlesAndIsocrystals Layer 0.
      Define on it, for every O-algebra R, the Frobenius and the Verschiebung by the ghost identities
      `w_n(Fx)=w_{n+1}(x)` and `w_n(Vx)=π·w_{n−1}(x)`, `w_0(Vx)=0`, and `I_O(R)=V W_O(R)=ker w_0`; this
      is the Witt O-frame, whose windows are the O-displays (Mih19 Definition 11.7)."
   5. §0.1 Checks, add: "The first two ghost components are x₀ and `x₀^q+π·x₁`; for O=ℤ_p, π=p they
      are those of Mathlib's `WittVector`, and for K=ℚ_p(√p), π=√p the second is `x₀^p+√p·x₁`.
      Replacing π by −√p changes V (through `w_1(Vx)=π·x₀`), which is why the dual display depends on
      the uniformizer; a definition of V with p in place of π gives a different frame when O is
      ramified."
   6. `*Needs:*` lines: §0.1 add "VectorBundlesAndIsocrystals Layer 0, “Ramified coefficient rings and
      coefficient changes”"; §1.5 and §5.4 add "VectorBundlesAndIsocrystals Layer 1, “Finite isocrystals
      over the completed maximal unramified coefficient field”". Add the same items to the Suppliers
      lines of the Dependencies of Layers 0, 1 and 5.

   Tested on the witness: for O=ℤ_p, π=p, q=p the supplier's `w_1=x₀^p+p·x₁` is Mathlib's ghost
   component, and the frame of step 4 is Zink's, so the existing Check "for O=ℤ_p an O-display is a
   display" still holds; for O ramified the supplier's ring is built from π and q, as Mih19 Remark
   11.11 (line 1945) requires. The supplier states Frobenius and Verschiebung "on perfect
   `𝔽_q`-algebras" (its line 95), so step 4 is not a restatement. VectorBundlesAndIsocrystals nowhere
   cites this roadmap (`roadmaps grep PELModuliPartII`: no match), so the new edge 188 → 124 is
   downward and creates no cycle; it is a pull request that adds a new roadmap folder, so it may be a
   supplier.

2. **F02** (P3) §2.5 states the generic image of π₂ less precisely than its source

   **Location.** `packages/PELModuliPartII/README.md:711` (§2.5): "π_1:Ñ_n→N_n^1 is finite étale of
   degree q+1 and π_2 is an isomorphism onto its image."; line 625 (Layer 2 introduction): "the second
   generically an isomorphism onto its image".

   **Claim.** The image of π₂ on generic fibres is left unnamed.

   **Witness.** LZ22 line 2883 (Remark 10.2.1, p. 65): the generic fibre of π₂, as a map to Z(x₀), is
   an isomorphism. Since the round-8 repair, §2.4 (line 687) defines Z(x₀) and states that π₂ factors
   through it; §2.5 and the Layer 2 introduction were not updated.

   **Repair.** Line 711: "…and π_2, as a map to the special divisor Z(x₀) of §2.4, is an isomorphism
   on generic fibres, so its image in the generic fibre of `N_{n+1}` is the generic fibre of Z(x₀)."
   Line 625: "the second generically an isomorphism onto the special divisor Z(x₀) of §2.4". The
   sentence that follows in §2.5 ("These generic assertions do not supply an integral isomorphism…")
   stays. Tested on the witness: at n=2, q=3 the repaired statement is consistent with the Checks of
   §2.5 and §9.10 (π₁ of generic degree q+1=4; integrally π₂ has exceptional fibres over a
   zero-dimensional centre, LRZ26 Theorem 14.6.2, so only the generic statement is made).

Two findings: one P2 (an object with two owners) and one P3. Both findings of round 7 are repaired.
The 15 sampled targets, the passages the round-8 repair changed, every supplier heading, the
dependency direction and the Lean file pass. What remains is that the ring of relative O-Witt vectors
and the isocrystals with a ramified coefficient field, which the README calls new, are constructed by
VectorBundlesAndIsocrystals, an open roadmap earlier in the merge order that this README never cites;
and that §2.5 still states the generic image of π₂ less precisely than its source, now that §2.4
defines the object that image is.

## Verified sound

### Round-7 findings

| Finding | Repaired passage | Evidence | Status |
| --- | --- | --- | --- |
| F01, Tau Ceti Grassmannian not cited | From Tau Ceti: "`Module.Grassmannian.scheme` and `Module.Grassmannian.toSpec` … it is separated over Spec R, and proper when M is finite"; §0.6: "represented over Spec O_L̆ by Tau Ceti's `Module.Grassmannian.scheme` of the free O_L̆-module of rank n with k=r" | Tau Ceti pin `2fd255d9`: `scheme` `TauCeti/AlgebraicGeometry/Grassmannian/Basic.lean:161`, `toSpec` :166, `schemeHomEquiv` `…/Points.lean:405`, `isSeparated_toSpec` `…/Proper.lean:137`, `isProper_toSpec` :230 (with `[Module.Finite R M]`); no "smooth" or "tangent" in the folder | repaired |
| F02, undefined Ñ¹_n, Z(x₀), N_Φ, V_Φ | §2.4: "Write Z(x₀) for the special divisor on `N_{n+1}` of the vector x₀ of §2.3: the closed formal subscheme over which … lifts to a homomorphism"; §4.6: "Define N_Φ as the functor of pairs (X,ρ) … Put `V_Φ=Hom^0_{O_L}(X₀,Φ,𝕏_Φ)`"; §9.10: "the mixed local framed space Ñ_n of §2.4" | LZ22 lines 427–433 (§2.3, p. 11), 2854–2868 (p. 65); LL22 lines 2169–2175 (Definition 2.64, p. 43), 2180–2195; RZ96 lines 1961–1976 (Proposition 2.9, Lemma 2.10, printed p. 52) | repaired |

Nothing was marked not actionable; nothing is re-raised. The repair diff changes 16 README lines
and 4 manifest lines; each was read against the lines above. Pattern search for the repaired
patterns: a pinned carrier the README does not cite (both pins searched for p-divisible groups,
abelian schemes over a base, a category of formal schemes: none; the `Spf` folder has four files,
all on the affine carrier), and an undefined symbol (none found); the search by object over the open
roadmaps gave R01, and the new definition of Z(x₀) gave R02.

### Sampled source locators (15 targets, all read this round)

| Target | Locator, lines opened | Result |
| --- | --- | --- |
| 0.1 | Mih19 Part III §10 line 1812 (p. 40); Lemma 11.2 line 1860 (p. 41); Definition 11.6 line 1912 (p. 42); Definitions 11.7–11.9 lines 1920–1941, Remark 11.11 line 1945, crystal paragraph 1948–1958 (p. 43); Proposition 12.11 line 2114 (pp. 47–48) | supported |
| 0.4 | Mih19 Definition 2.2 lines 270–280 with footnote 3 (p. 7); Definitions 2.7–2.8 lines 344–368 (pp. 8–9); Definition 3.2 line 527, Theorem 3.3 line 532 (p. 12); Proposition 3.4 line 539, 3.6 line 637, Lemma 3.9 line 775, Corollary 3.10 line 781 (pp. 12–18) | supported: rank n means height 2nd, dimension nd; clause (ii) at line 366 |
| 0.7 | Zhang21 lines 659–696 ((3.1)–(3.6)); LZ22 lines 392–399 (§2.1, p. 10) | supported: (n−1,1) against (1,n−1) |
| 1.3 | LZ22 lines 411–418 (§2.2, p. 11) | supported: N₁≅Spf O_F̆, unique lift, conjugate object |
| 1.6 | Zhang21 lines 679–718 | supported: graph of δ, half the formal dimension 2(n−1), unit vector u₀ of norm 1 |
| 3.2 | LL22 lines 424–430 (Remark 2.2, p. 10) | supported: unique σ with λ=σ∘ι(u), σ^∨=σ |
| 3.3 | LL22 lines 431–443 (Definition 2.3, Lemma 2.4, p. 10) | supported |
| 4.1 | LL22 lines 1929–1945 (Definition 2.59, p. 38) | supported: dimension nf, height 2nf, banal condition |
| 4.4 | LL22 Proposition 2.62 line 2045 (p. 40), Lemma 2.63 line 2134 (p. 42), Remark 2.68 line 2214 (p. 44) | supported |
| 5.1 | HLSY23 lines 437–447 (Definition 2.2, p. 10) | supported: rank n−1, conjugate action on F, structural on the quotient |
| 5.5 | HLSY23 lines 468–474 (p. 11); RSZ21 lines 1745–1753 (Remark 6.9, p. 33) | supported |
| 5.7 | HLSY23 lines 448–449 (p. 10); Howard19 lines 245–255 (Proposition 2.2, pp. 6–7); RSZ21 lines 1716–1744 (pp. 32–33) | supported; Howard19 is over ℚ_p, and the general K rests on the README's own §5.6, as its Route says |
| 6.1 | Zhang21 lines 1524–1584 ((6.1)–(6.6)); LZ22 line 3191 (§11.1, p. 73) | supported |
| 6.7 | RSZ21 lines 784–800 (p. 14), 962–1009 (§4.1, pp. 17–18, footnote 7), 1620–1640 (Remark 6.5, pp. 30–31); LZ22 line 3231 (§11.2, p. 74) | supported |
| 9.9 | HLSY23 lines 4050, 4109 (§10.2, (H4), pp. 77–78); RSZ21 lines 1755–1757, 1807 (pp. 33–34); RZ96 line 8965 (Theorem 6.30, printed p. 293) | supported as cited; the README says itself that no text states the transport of the filtration |

Also opened: RZ96 Definition 6.9 line 8517 (printed p. 279), Proposition 2.37 line 2409 (printed
p. 66), Lemma 6.28 line 8931 and Corollary 6.29 line 8959 (printed pp. 292–293); LL22 lines 405–423
(Definition 2.1), 1909–1922 ((2.20)), 1971–1975 (Lemma 2.60), 2176–2202 (Corollaries 2.65–2.66);
LZ22 lines 2849–2884 (§10.2, Remark 10.2.1).

### Adversarial table (sampled targets, headlines, changed passages, findings)

Rows of earlier rounds that carry computed values were relied on for text no repair touched and
outside the sample; the rows below were computed this round.

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| 0.1 strict modules, duals | O=ℤ_p, μ_{p^∞}; K=ℚ_p(√p); height 1 and 2, dimension 1 | P rank 1, P/Q rank 1; √p−(−√p)=2√p of p-valuation 1/2<1, nonzero mod p for odd p; dual dimension 1−1=0 (étale), 2−1=1 (biformal) | pass |
| 0.4 comparison C | K₀=K; K₀=ℚ_p, K/ℚ_p ramified of degree 2, n=1; signature (1,1) and (1,0) over ℚ_{p²} | identity; height 2n[K:K₀]=4, dimension 2 against relative height 2, dimension 1, underlying height 4, dimension 1; slopes 0,0,1,1 (dimension 2=n, not supersingular) and 1/2,1/2 (supersingular) | pass |
| 0.7 conjugation | n=1; (r,s)=(1,2) | (1,0)↔(0,1); `(T−a)(T−ā)²` ↦ `(T−ā)(T−a)²`, i.e. (2,1); applied twice (1,2) | pass |
| 1.3 rank-one source | n=1 | relative dimension n−1=0, relative height 2, dimension 1; Lie character a on ℰ, ā on ℰ̄ | pass |
| 1.6 diagonal graph | n=2,3,4 | relative (n−2, 2n−3) = (0,1), (1,3), (2,5); arithmetic (n−1, 2n−2) = (1,2), (2,4), (3,6): half only in the second count | pass |
| 3.2 symmetric factor | ū=−u against ū=u; n=2 | σ^∨ = −ι(u⁻¹)^∨λ = −λι(ū⁻¹) = λι(u⁻¹) = σ; with ū=u the same computation gives −σ; #X[ι(u)]=q^n=q², #X[ϖ]=q^{2n}=q⁴ | pass |
| 3.3 exotic framed space | multiplier c=1, c≠1; height 0, 1 | exact pullback required (LL22 line 421), c≠1 and height 1 rejected | pass |
| 4.1 absolute exotic category | f=1; f=2, n=2 | (height, dimension) = (2n, n), the relative values; (8, 4), one banal component | pass |
| 4.4 display equivalence | f=1, f=2 | no component contracted, μ=1; absolute height 4n to relative 2n | pass |
| 5.1 Krämer filtration | n=2, 3; generic and special fibre | ranks (1,1), (2,1); eigenvalues u≠−u when u is invertible, eigenspaces of dimension 1 and n−1, so F is unique; at u=0 the characters coincide and F is extra data | pass |
| 5.5 framing parity | unit c not a norm; n=2, 3 | det ↦ cⁿ·det, χ(cⁿ)=(−1)ⁿ: sign flips for n=3, fixed for n=2 | pass |
| 5.7 Krämer regularity | n=2 chart yz=u; u=t² | maximal ideal (y,z) in dimension 2: regular; yz=t² needs (y,z,t) in dimension 2: not regular | pass |
| 6.1 RSZ group | (z,g) with c(g)=Nm z | c(z⁻¹g)=Nm(z)⁻¹c(g)=1; inverse (z,u)↦(z,zu) has c(zu)=Nm z; (z,u)↦(z,u) fails unless Nm z=1 | pass |
| 6.7 level data | inert place, Λ^♯/Λ of length one; nonsplit space | order #k_{F_v}=q_v²; odd determinant valuation, so no self-dual lattice | pass |
| 9.9 Krämer completion | n=2, 3 | rank of the completed subbundle n−1 = 1, 2; chart yz=u on both sides for every n≥2 | pass |
| §2.4 Z(x₀) and π₂ (changed) | β=α restricted to ℰ̄; x₀=0 | ρ_X∘β=x₀∘ρ_ℰ̄ from the framing compatibility; norm of β is ϖ=h(x₀,x₀) (LZ22 line 2856), a unit vector has valuation 0; Z(0) would be all of `N_{n+1}`, excluded since h(x₀,x₀)=ϖ≠0 | pass |
| §4.6 N_Φ, V_Φ (changed) | f=1; f=2, n=2 | N_Φ=N^exo, V_Φ=V^exo; heights 8 and 4, V_Φ of L-dimension 2 and ℚ_p-dimension 2·[L:ℚ_p]=8 | pass |
| Tau Ceti Grassmannian bullet (changed) | (k,m)=(0,3), (3,3), (1,3), (4,3) | point, point, the projective plane of relative dimension 1·2=2=rs at (1,2), empty over a nonzero ring | pass |
| 9.2 Check (unchanged, recomputed) | Gram rows (0,1,0),(1,0,0),(0,0,3); g=diag(3,1/3,1) | duals of lengths 3, 3, 1; gΛ₋=Λ₊; gΣ=⟨3e,f/3,a⟩≠Σ | pass |
| R01 | `W_O(R)` and K-isocrystals | README: "are new"; open head of VectorBundlesAndIsocrystals: 2 targets constructing them; citations of that roadmap here: 0 | finding |
| R02 | generic π₂ | README: "onto its image"; LZ22 line 2883: onto the generic fibre of Z(x₀) | finding |

Context and generality: `Suggested.lean` has no declaration, so no `variable` block can drop a
hypothesis.

### Library at the pins

Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9` (read from the manifest of the content checkout). Opened
this round: the five Grassmannian declarations above; `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95`
(`AbelianVariety`, over a field); `TauCeti/AlgebraicGeometry/FormalScheme/Spf/Carrier.lean:73`
(`carrier`) and `…/Spf/StructureSheaf.lean` (`structureSheaf`); the other two files of that folder
(`CompletedNeighbourhood.lean`, `IdealIndependence.lean`) are statements on the same affine carrier,
so "the only formal-scheme carrier at the pin" holds. All 21 backticked identifiers of the README
are library names (Mathlib or Tau Ceti); none is presented as this roadmap's own. Mathlib names
reopened: `LinearMap.charpoly` (`Mathlib/LinearAlgebra/Charpoly/Basic.lean:44`, `charpoly_monic`
:72, `charpoly_natDegree` :76), `Matrix.charpoly` (`Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean:140`),
`Module.Grassmannian` (`Mathlib/RingTheory/Grassmannian.lean:66`), `WittVector`
(`Mathlib/RingTheory/WittVector/Defs.lean:52`), `WittVector.Isocrystal`
(`Mathlib/RingTheory/WittVector/Isocrystal.lean:112`), `IsRegularLocalRing`
(`Mathlib/RingTheory/RegularLocalRing/Defs.lean:52`), `AlgebraicGeometry.Scheme`
(`Mathlib/AlgebraicGeometry/Scheme.lean:40`), `Flat` (`Morphisms/Flat.lean:42`), `Smooth` and
`SmoothOfRelativeDimension` (`Morphisms/Smooth.lean:59`, :127).

### Suggested.lean

`lake env lean` on `packages/PELModuliPartII/Suggested.lean`, run from the content checkout: exit 0,
no output. One `import Mathlib`, one module docstring, one empty namespace, no `set_option`, no
declaration. Headlines of the Summary: §§1.2, 2.2, 3.4, 3.7, 5.7; §6.6; §§7.6, 7.7, 7.8, 7.9, 8.4,
8.7; §§9.5–9.10 (18), each named in the docstring with the carrier it lacks, plus §9.1. None is
statable at the pins (each needs formal schemes with formal smoothness, strict modules or
p-divisible groups over a base, abelian schemes with PEL structure, or Dieudonné modules of abelian
varieties). One-tactic probe: 0 of 0 sorried theorems. `#check @name` audit: 0 of 0 declarations,
nothing changed. Neither finding makes a headline statable.

### Suppliers, gaps, direction

Every cited section was resolved now by its heading, on main or at the open head: 80 headings of
14 suppliers and one consumer (PELModuli 30, AbelianSchemesAndArithmeticModuli 8,
FiniteFlatGroupsAndIntegralPadicHodgeTheory 5, EndoscopicTransferAndUnitaryTraceComparison 4,
IgusaVarietiesAndTorsionConcentration 2, AdicSpacesPartIII 2, SchemeAndStackFoundations 2,
AlgebraicModuliForArithmeticGeometry 1, GeometryOfNumbersAndQuadraticArithmetic 2, PadicHodgeTheory 4,
ShimuraVarieties 7, AdelicAlgebraicGroups 1, ReductiveGroupsPartII 1, ShimuraCompactifications 3,
SelmerIwasawaCohomologyPartII 8); none is missing. Content read this round for what the README
assumes: IgusaVarietiesAndTorsionConcentration §0.27 (unramified datum and the unstructured functor)
and §0.31 (split place, signature (1,n−1), RSZ matching); AlgebraicModuliForArithmeticGeometry §1.3
(`grassmannSmoothness`, relative dimension d(n−d), tangent Hom); PELModuli §M2.15 (BT an equivalence
over complete local noetherian rings with perfect residue field only, which the gap extends).
Suppliers are at positions 35–187 of the merge order or on main; this roadmap is at 188;
SelmerIwasawaCohomologyPartII (387) appears only as a consumer.

Gaps: the four slugs of `design/plan.json` are in the README supplier subsections with a named
supplier and section and one object each with its hypotheses.

Dependency check, exact output:

```text
depcheck: 240 roadmaps, 2266 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line.

Duplication and ownership, by object (`roadmaps grep` over main and the open heads): strict formal
O-modules and O-displays, Rapoport–Zink spaces, Krämer and almost self-dual models, Kudla–Rapoport
cycles, special divisors, lattice multichains, relative or ramified Witt vectors. Hits other than the
suppliers already cited: reference-list mentions (GeometryOfNumbersAndQuadraticArithmetic,
MetaplecticAutomorphicForms), consumers, HilbertModularVarietiesAndShimuraCurves §§R18.5.4–R18.5.11
(special formal `O_D`-modules and quotients of the Drinfeld formal model by groups acting very freely
on the tree: a different carrier and a different quotient theorem from §§0.1 and 9.2), and
VectorBundlesAndIsocrystals (R01). `roadmaps grep PELModuliPartII`: no roadmap cites this one. The
overlap file lists no other pull request changing this roadmap, no dropped id and no id defined only
by a revision; the board package index lists AnalyticNumberTheory and LawrenceVenkateshMethod,
unrelated.

Overlap check: read IgusaVarietiesAndTorsionConcentration, SelmerIwasawaCohomologyPartII, HilbertModularVarietiesAndShimuraCurves, PELModuli, FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII (the open list by vocabulary; the lists for main and by results are empty); unstructured framed functor and unramified single-lattice PEL space: IgusaVarietiesAndTorsionConcentration §0.27; displays and BT: PELModuli §M2.15; special-fibre strata of the LTXZZ models: SelmerIwasawaCohomologyPartII Layer 2; Drinfeld special formal modules and tree quotients: HilbertModularVarietiesAndShimuraCurves Layer R18.5; nothing owned twice among these five; outside the lists, the relative Witt ring and K-isocrystals: VectorBundlesAndIsocrystals Layers 0 and 1 (R01).

### Shape and policy

75 numbered targets in ten layers, each with exactly one *Needs:* line; every layer ends with
Examples and Dependencies; 0 lines with an odd number of backticks; no LaTeX delimiter, pull-request
number, machine path, HTML anchor or process word (the hits of "lemma" are source lemma numbers).
The 16 sections with two Checks are theorems, not definitions. No algorithm. Layers are named by
their mathematics and ordered by their *Needs:* edges. The 17 works cited are the 17 manifest
entries, all certified.

### Copyright and arrangement

Wording compared at the 15 sampled locators and at six further passages (§2.4 against LZ22 lines
427–433; §4.6 against LL22 lines 2169–2191; §9.2 against RZ96 lines 2406–2411; §0.4 against Mih19
lines 527–536; §3.1 against LL22 lines 405–421; §6.6 against RSZ21 lines 962–968). The longest
shared runs are in definitions that can be written one way only ("A polarization (resp. principal
polarization)", Mih19 line 1940; "closed formal subscheme", LZ22 line 428); nothing is followed
clause by clause, and no table, figure or example list is taken over. Arrangement: LL22 has the
largest share; its contents (§§2.1–2.8 local intersection, §3 theta lifting, §4 inner product
formula; lines 16–39) do not map onto Layers 0–9: Layers 3–4 draw on §§2.1, 2.3 and 2.8 only, and
§§7.3, 7.7 and 9.6 on §4.5.

Source independence: 21 passages compared with 8 sources, none shared; largest share LL22, 40 of 222 locator mentions; contents compared with LL22: independent.

The source issues recorded in earlier rounds (HLSY23 Definition 2.2(2) and §1.2, LZ22 §13.4, RZ96
Corollary 6.29, LL22 §4.5) were not reopened; the README's References notes describe them.

## Not verifiable

- Published page numbers of Zhang21 (Annals, pp. 879–881, 901–909) and of LTXZZ22 (Inventiones):
  the cached texts are the arXiv versions with their own pagination. Sections, equations and
  statements were read; the published pages are not certified. The manifest records the version
  note.
- Ownership against open pull requests rests on the index of 2026-11-15T21:50:23Z.

## Source issues

- none

## For the human reviewers

- **Licence.** RZ96 is read from a scan on an author's institutional page (`packages/PELModuliPartII/sources.toml`, entry RZ96, class author-page); the book is a Princeton University Press title. Whether that copy is authorised is not settled by the manifest.
- **Not tested.** Published pagination of Zhang21 and LTXZZ22 (see Not verifiable): the locators carry published page numbers that were not read in the published versions.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "0130b8e9d0c809c8ed0beaa4cdfabecb6e647287", "job": "REV-PKG-PELModuliPartII~8", "model": "fable", "worker": "chris-x26"} -->
