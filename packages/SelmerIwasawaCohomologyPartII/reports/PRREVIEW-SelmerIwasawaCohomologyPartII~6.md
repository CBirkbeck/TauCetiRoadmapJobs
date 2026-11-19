# Review of SelmerIwasawaCohomologyPartII (pull request #1403 at 211b108)

**Verdict:** accepted

**Summary.** Accepted: this was an incremental re-review of the 88 lines changed since 365ec42, and both findings of the previous review are repaired without a new defect. The balloon, ground and link strata are now stated in §2.3 as ltxzz Definition 5.2.3 and Theorem 5.2.5 give them, on the models of PELModuliPartII §§8.1–8.5 and 8.7, and the rigid R=T theorem and eventual rigidity are cited from PotentialAutomorphyInfrastructurePartII §§10.2–10.3 with the hypotheses that section states. There are two small corrections and no format note, none blocking; three facts are left for the human reviewers.

## C01 — The description says the suppliers that must merge first are listed below it, but the two new suppliers are in neither list

The description's first bullet says of PELModuliPartII and PotentialAutomorphyInfrastructurePartII that "Both roadmaps precede this one in the merge order", and its prose ends "The open pull requests that must merge first are in the merge order below". The generated `depends-on` block lists IgusaVarietiesAndTorsionConcentration and its Part II as the only open suppliers, and the generated `merge-order` block ends "#2439 (IgusaVarietiesAndTorsionConcentrationPartII) → **this pull request**"; neither names #2453 (PELModuliPartII) or #2135 (PotentialAutomorphyInfrastructurePartII), which §§2.1–2.3, 2.6, 3.3, 3.6, 5.1 and 7.4 now cite by section. A reader who follows the two blocks would merge this roadmap before the roadmaps that own its integral models and its R=T theorem. Regenerating the two blocks at this head, so that both pull requests appear, makes the description true.

## C02 — The one-sentence contract for gap native-shimura omits the product model that §2.6 takes from it

§2.6 (line 242) applies the gap to its three-branch resolution ("The specialization isomorphisms of gap native-shimura include the nonproper case"), and the paragraph of the ShimuraVarieties contract (line 910) cites "for the product, Lemma 5.11.2, line 4725". The sentence that states the gap (line 912) asks for the isomorphisms only "for the models of PELModuliPartII §§8.1–8.4"; the resolution Q of ltxzz Lemma 5.11.2 is a blowup of a product of two of those models and is not one of them. Since that sentence is what the supplier is asked for, adding "and for the blowup of the product of two almost self-dual models of §2.6 (ltxzz Lemma 5.11.2)" after "Lemmas 4.2.4 and 5.2.7 on the nonproper domain" would make it cover what §2.6 uses.

## Previous findings

- R01 — repaired: §2.3 defines M°, M•, M† by the kernel lines of the polarization pairing, proves the union, smoothness and tangent sheaves, and takes the model from "PELModuliPartII §§8.2–8.4"; the gap keeps only the specialization isomorphisms.
- R02 — repaired: §§3.3, 3.6 and 7.4 cite "PotentialAutomorphyInfrastructurePartII §10.2" and "§10.3"; gaps rigid-r-equals-t and eventual-rigidity are gone; §3.3 keeps "the congruence quotient Runr⊗Rmix Rram".
- C01 (previous) — repaired: all eight places read "IgusaVarietiesAndTorsionConcentration §7.2".
- C02 (previous) — repaired: "Under the same three hypotheses, if, at suitable levels, its Abel–Jacobi class AJλ(Δ) is nonzero".
- C03 (previous) — repaired: PeriodsAndSpecialValues "states the Rankin–Selberg Beilinson–Bloch–Kato prediction"; "It supplies no premise to this roadmap"; this agrees with its PS.6.6–PS.6.7.
- C04 (previous) — repaired: the two pins read `1b1ccf4b…` (Mathlib) and `2fd255d9…` (Tau Ceti), as in the manifest.
- N01 (previous) — repaired: "proves the rank-zero and rank-one theorems of Liu–Tian–Xiao–Zhang–Zhu for this Selmer group".
- N02 (previous) — repaired: Layer 1 opens by saying the coefficient algebra is imported and "the layer's own targets are §§1.5–1.6".

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §2.3 strata (new text) | ltxzz Definition 5.2.3, lines 2636–2647; N=1, 2, 3 | pairing diag(0,1,…,1): one kernel line per factor; N=1: rank ω_τ∞c = 0, so M•=M†=∅ as Remark 5.2.4 | agrees | none |
| §2.3 union and smoothness | proof cases (i)–(iii), lines 2700–2714 | (i) x₁x_N=p in both strata; (ii) only M°; (iii) only M•; (iv) impossible | agrees | none |
| §2.3 tangent sheaves | N=3; N=2 | ranks ω_τ∞=1, ω_τ∞c=2, Lie_τ∞c=1: T(M°)=2; T(M•)=1+1=2=N−1; quotient term 1=dim M†. N=2: quotient 0, M† of dimension 0 | agrees with Theorem 5.2.5(3)–(5) | none |
| Conventions, generic-fibre passage | equations (4.2), (5.2); Lemmas 4.2.4, 5.2.7 | found at lines 1739, 2739; 1744–1749, 2744–2749 | locators right | none |
| §3.3 route (new text) | ltxzz lines 5660–5701; ltxzz-deformation Definition 3.5.1 | D^unr: x₀=0, D^ram: x₁=0 in O[[x₀,x₁]]/(x₀x₁); Runr=Rmix/(x), Rram=Rmix/(s−p^(−2r)); R=T applied to Sh(V°) and, by Lemma 5.2.7, with Σ⁺lr∪{p} | agrees | none |
| §3.3 hypotheses against supplier §10.2 | trivial weight; ℓ prime | (D0): ℓ>(N−1)+2, implied by ℓ≥2(N+1); (D1) ℓ>2(N+1) ⇔ ℓ≥2(N+1) since 2(N+1) is even and ≥4; (D2), (D3) in §3.3; (D4) from genericity | supplier's domain covered | none |
| Rigidity at Σ⁺lr∪{p} | LocalGaloisDeformationRings §2.20 | API: adding an inert level-raising place with the Frobenius pair once and ℓ∤q²−1 preserves rigidity; its Check names this use | agrees | none |
| Contract for §10.2 | ltxzz-deformation Theorem 3.6.3, line 1444 | Σ⁺lr=∅ for odd N; (D0)–(D4); conclusions R^univ≅T_m lci, freeness; arbitrary signature (p_τ,q_τ) | agrees | none |
| §7.4 and contract for §10.3 | ltxzz lines 6410, 6427, 6429; deformation lines 1761, 1789, 1880 | family A L6 by Corollary 4.1.2; family B L4 by Proposition 4.2.3(1), L6 by Theorem 4.2.6 | agrees | none |
| Contract for PELModuliPartII | its §§8.1–8.5, 8.7 at the open head | smooth, dimension N−1, tangent Hom(ω,H₁/ω); generic fibres Sh(V,K)×T_η, Sh(V′,jK^pK′_p)×T_η; rings W[[t]] or W[[x]]/(x₁x_N−p); Hecke with CM torus | agrees | none |
| Gap native-shimura (narrowed) | PELModuliPartII searched for specialization, nearby cycles, Lemmas 4.2.4, 5.2.7, Remark 5.2.8 | none stated there; "Used by" list equals the nine *Needs:* lines citing the gap | minimal; product case missing from the sentence | C02 |
| Downstream consumers sentence | PeriodsAndSpecialValues PS.6.6–PS.6.7 | PS.6.7 keeps the quantifier over all coefficient places and root number −1; level-raising constructions "not inputs" | agrees | none |

The rows for the untouched statements stand as in the previous review, of `365ec42`.

- Source locators read against the text for the changed passages: 12 in ltxzz, 5 in ltxzz-deformation; all found at the lines given. No locator is flagged unverified in the README. Of the seeded sample, only §§2.3 and 2.6 fall in changed text; their changed parts were read as above, and the other thirteen targets are unchanged since the previous review.
- Cross-roadmap citations resolved for the changed passages: PELModuliPartII §§8.1–8.5, 8.7 and PotentialAutomorphyInfrastructurePartII §§10.2–10.3 at their open heads; LocalGaloisDeformationRings §§2.12, 2.20, GlobalGaloisDeformations §§3.4–3.5 and PELModuli §M2.12 on main; PeriodsAndSpecialValues PS.6.6–PS.6.7 at its open head. All present with the content cited.
- Library pins: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5` in the manifest, equal to the two hashes now in the supplier contracts. No library declaration is named by the changed text.
- Dependency check: `depcheck: 199 roadmaps, 2188 edges, 0 problem(s)`; no UPWARD or CYCLE line. PELModuliPartII and PotentialAutomorphyInfrastructurePartII both precede this roadmap in the merge order.
- Automatic checks: all pass on this head; no change outside the folder.
- Elaboration of `Suggested.lean` at the pins: exit 0, no output. The file is unchanged and has no declaration, so there is nothing for the `#check` comparison or the one-tactic probe; each headline is named in the docstring with the carrier it lacks.
- Pull request text against the head: title and prose agree with the folder (a new roadmap, three files, no declaration; the new suppliers and the narrowed gaps are stated), apart from C01.
- Declared gaps at this head: nineteen, each with a named supplier; the two that the previous review found already owned are no longer declared.

Overlap check: read PELModuliPartII, PotentialAutomorphyInfrastructurePartII, IgusaVarietiesAndTorsionConcentrationPartII, IgusaVarietiesAndTorsionConcentration, ModularityAndLanglandsExtensionsPartII (open), AutomorphicGaloisRepresentationsPartII, EndoscopicTransferAndUnitaryTraceComparison, HilbertModularVarietiesAndShimuraCurves (main); the third list is empty. Shared: the smooth and almost self-dual unitary models, owner PELModuliPartII §§8.1–8.5, 8.7, cited; their balloon, ground and link strata, owner this roadmap §2.3, as PELModuliPartII §8.4 says; the rigid R=T theorem and eventual rigidity, owner PotentialAutomorphyInfrastructurePartII §§10.2–10.3, cited; cohomological genericity, owners IgusaVarietiesAndTorsionConcentration §7.2 and its Part II §11.9, cited. Nothing shared with the others.

Source independence: changed passages only; 6 passages compared with 2 sources (ltxzz, ltxzz-deformation), none shared beyond formulas and lists of hypotheses; largest share ltxzz, as in the previous review (156 of 188 line locators at 365ec42); the diff adds, removes and reorders no layer, so the contents were not compared again: independent, as found there.

Research link: Layers 5–8 are the two explicit reciprocity laws and the rank-zero and rank-one theorems of Liu–Tian–Xiao–Zhang–Zhu (2022), Theorems 7.2.8, 7.3.4, 8.2.2 and 8.3.2, cases of the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives, with Liu–Tian (2017) as precursor; this rests on the README's references and the two texts read.

## Not verifiable

- Fulfilment of the declared gaps is a contract on the suppliers and is not certified here.
- The supplier's account that the published Lemma 2.6.4 fails when [F:F⁺]=2 (EulerSystemsAndKolyvaginSystems §1.15), on which the span premise of §§7.2, 8.1 and 8.2 rests, was read in the supplier and not re-derived from the source.
- The "AI assistance" sentence of the description describes the process, not the folder.

## Source issues

- **Error** in ltxzz at Lemma 5.11.3(2), printed p. 98: the source says the exceptional stratum over the double link is a trivial ℙ¹-bundle; it should be the projectivization of the sum of the two link normal lines, nontrivial in general (rank (2,3), p=3: a section of self-intersection −16); affects a stated result.
- **Error** in ltxzz at Notation 5.11.1(4), printed p. 97: the source defines every component of the blowup as a strict transform; it should be the closure of the preimage away from the double link, since the strict transform of the centre itself is empty; affects nothing.

## For the human reviewers

- The rank theorems of §§8.1–8.2 carry a uniform realised Frobenius span premise that the published Theorems 8.2.2 and 8.3.2 (ltxzz line 6568, 6773) do not; it comes from EulerSystemsAndKolyvaginSystems §1.15, which holds the published Lemma 2.6.4 to be incorrect for CM extensions.
- H(N) for N>3 and F⁺≠ℚ is cited in the source to a work announced as forthcoming (ltxzz Proposition 3.2.11, line 1273–1277); the roadmap keeps it as a supplier gap on AutomorphicGaloisRepresentationsPartII.
- The README at this head no longer declares gaps rigid-r-equals-t and eventual-rigidity on GlobalGaloisDeformations and has narrowed gap native-shimura on ShimuraVarieties; any announcement of the earlier forms to those suppliers is now out of date.
