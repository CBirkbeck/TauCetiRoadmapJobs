# GATE-GaloisSectionsPadicPeriodMaps~1: answers to the human review of `8a6331b`

One review (kim-em, 2026-11-19T00:54:25Z), numbered H01–H11 in order: requests 1–7 (request 2 makes two points), then the three smaller points. Repairs are in commit `5fdc42d1` on the pull-request branch (not pushed). Only `TauCetiRoadmap/GaloisSectionsPadicPeriodMaps/README.md` changed; `Suggested.lean` is unchanged.

## H01 (kim-em) — applied

§0.1 (README line 37) now reads "… so the fundamental exact sequences over K and over K_u are exact (EtaleCohomologyFoundations §F.0.A2)" instead of "(IG.1)". It also says why F.0.A2 applies: X is separated of finite type, so it is quasi-compact and quasi-separated, which is the hypothesis of `arithmeticExactSequence`. On main, IG.1 imports the sequence from EtaleCohomologyFoundations §§F.0.A1–F.0.A2 (InverseGaloisAndArithmeticFundamentalGroups README, opening of Layer IG.1), and AnabelianGeometryAndNonabelianChabauty §7.1 imports it from §F.0.A2. "TauCetiRoadmap.EtaleCohomologyFoundations §F.0.A2, the arithmetic exact sequence" is now in the Needs line of §0.1 (line 59) and in the Layer 0 Dependencies. The "From EtaleCohomologyFoundations" contract (line 1420) has a new sentence on F.0.A2 and its use in §0.1 and §1.4. The same miscitation appeared in §1.4 (line 262), which gave AnabelianGeometryAndNonabelianChabauty §7.1 as the source of exactness; it now cites §F.0.A2 for exactness and §7.1 for sections, and F.0.A2 is in §1.4's Needs and in the Layer 1 Dependencies. In the §0.1 API (line 47), "the IG.1 isomorphism" is now "the IG.1.3 isomorphism", the subsection that actually states base-change invariance.

## H02 (kim-em) — applied

ArithmeticGaloisRepresentations §§1.3 and 1.12 (induction, Mackey) are dropped from §0.1's Needs (line 59) and from the Layer 0 Dependencies, because no part of Layer 0 induces representations. The same stock phrase "§§1.3, 1.12, 2.1, induction, Mackey and local restriction" also stood in §1.5 (Needs) and §1.7 (Needs), which only restrict to decomposition groups. In both it is now "§2.1, decomposition groups at finite places, and §4.1, complex conjugation at real places". §1.1 does use induction: its API has `V ≅ Ind_{G_{ψ₀}}^{G} V_{ψ₀}`, and the stabiliser G_ψ₀ is open. So §1.1's Needs (line 203) now lists "ArithmeticGaloisRepresentations §1.3, induction from open subgroups", and the Layer 1 Dependencies (line 368) say "§1.3, induction from open subgroups, and §§2.1, 4.1, restriction to decomposition groups at finite and real places". §3.4 and §6.4 keep §§1.3, 1.12. §3.4 induces to G_K and applies Mackey. §6.4 checks unramifiedness and purity of fibre representations, which are induced when the finite base is not split.

## H03 (kim-em) — applied

The decomposition-group citation at line 35 now reads "(ArithmeticGaloisRepresentations §2.1 at a finite place; at a real place D_u = {1, c_ι} for the complex conjugation c_ι of ArithmeticGaloisRepresentations §4.1)". This matches main: §2.1's local-embedding paragraph covers K = F_v, and its local-restriction paragraph ends "At a real place the local group is {1, c_ι} (§4.1)". §4.1 defines c with ι∘c = conj∘ι, of order 2, one conjugacy class. Check for K = ℚ and ι: ℚ̄ ⊂ ℂ: ι^*(conj) = conj restricted to ℚ̄, which sends i to −i, so it is the element of order 2. §1.7 (line 322) now cites "§2.1, and §4.1 at real places" because that section uses every place. The AGR contract (line 1424) has a sentence on §4.1, and the scope (line 1390) assigns complex conjugations to §4.1.

## H04 (kim-em) — applied

New §0.3 API bullet (line 93): "Sec^Sel(X/K) and each loc_u do not depend on the embeddings ι_u: for two embeddings at u the two maps res_u agree after the base-point bijection of AnabelianGeometryAndNonabelianChabauty §7.1 (§0.1), and the local section map `κ_{X_{K_u}}` does not involve ι_u." Checked on X = G_m. For ι' = ι∘σ, the two restrictions of a cocycle c differ by σc(σ⁻¹gσ) = c(g) + (g−1)c(σ), a coboundary. Hence the classes in H¹(K_u, Ẑ(1)) agree.

## H05 (kim-em) — applied

This takes the second option the review offered. §0.3 (line 82) used to say "no real-point localisation is defined here". It now says that neither a localisation at a real place into π₀(X(K_u)), nor, for a smooth projective curve Y of genus ≥ 1, the total localisation Sec^Sel(Y/K) → Y(A_K)_• of bs, §1, p. 2 is a target. The reason given is that §0.5 compares Selmer sections with the finite descent locus one finite place at a time, which is all §9.5 uses. Targeting the curve case instead would add a real-section theorem (injectivity on π₀(Y(ℝ))) outside the headline's needs. No roadmap on main or in the open pull requests owns it (searched for real section maps, π₀ of real points and Selmer sections). The review's suggested source, Stix's LNM 2054, cannot be read legally (H08), so its locator could not be checked.

## H06 (kim-em) — applied

All 12 occurrences of "§7.1 (NC.6)" are now "§7.1": in the Needs lines, the Dependencies, the scope and the "From AnabelianGeometryAndNonabelianChabauty" contract. That contract already names §7.1's own headings ("Conjugacy classes of Galois sections", "The section map of rational points", "Sections of an abelian variety and the Kummer map", "Injectivity of the section map"). All four exist on main at AnabelianGeometryAndNonabelianChabauty §7.1, and the README of that roadmap has no "NC.6" label.

## H07 (kim-em) — applied

All 108 line-number locators of the form "; bs line N", "; hs lines N and M", "; stoll lines …" and "; stix08 lines 1109–1122" are removed. The theorem, section and page locators were already beside every one of them; the References entry says they refer to arXiv:2204.13674v1. Two line locators inside a sentence were converted to pages, since they carried information:
- §2.4: "bs lines 603–615" → "p. 12".
- §6.8: "bs lines 277 and 2364" → "pp. 6 and 46".

The pages come from the page markers of the extraction: bs line 576 starts p. 12, line 271 starts p. 6 and line 2337 starts p. 46.

## H08 (kim-em) — answered

No citation was added. LNM 2054 cannot be read from a legal source here: the DOI 10.1007/978-3-642-30674-7 resolves only to Springer's paywall, and a title search found no author or institutional copy. Without the text, any chapter or theorem locator would be a guess, and so would the claim that it proves §§0.1 and 0.3 at this generality. The statements of §§0.1–0.3 already carry legal locators: bs Definition 1.1 (p. 1) and §1 (p. 1), hs Introduction (p. 2), and stix08 Appendix B, Theorem 45 and Remark 46 (pp. 22–23) for §0.2. AnabelianGeometryAndNonabelianChabauty §7.1 already cites LNM 2054 (Introduction, Conjecture 2, p. xiv) for the section conjecture. If an operator names a copy they hold, the citation can be added with checked locators.

## H09 (kim-em) — answered

`Suggested.lean` is written against the pinned Tau Ceti, `2fd255d` of the content repository's `lake-manifest.json`, and at that pin its docstring is accurate. At the pin, `TauCeti/AlgebraicGeometry/FiniteEtale/Galois/FundamentalGroup.lean` has `galContinuousMulEquivAutFiber` (line 219). No `mapAutFiber`, `mapAutFiber_conjAut` or other homomorphism of `Aut (fiber x)` induced by a morphism exists anywhere under `TauCeti/` (grep). So "the pins lack the homomorphism of fundamental groups induced by a morphism" is true of the pin. Stating `res_u` and `Sec^Sel` with `sorry` needs both that functoriality and the arithmetic exact sequence, so it waits for a later pin.

## H10 (kim-em) — applied

README line 1: "# Roadmap: galois sections and p-adic period mappings" → "# Roadmap: Galois sections and p-adic period mappings". Titles on main capitalise proper names, as in "# Roadmap: arithmetic Galois representations and conductors". The `Suggested.lean` docstring title was already capitalised.

## H11 (kim-em) — applied

The §0.3 Check "For an elliptic curve E/Q with full rational 2-torsion and any prime p, the four global 2-torsion points define Selmer classes whose localisations in E(ℚₚ) are pairwise distinct, by local injectivity" is deleted. Since loc_p∘κ is the inclusion E(ℚ) → E(ℚₚ), the conclusion follows from distinctness of the points alone. What it does say is already the Check "loc_u(κ_Y(y)) is the image of y". Local injectivity is tested by the §0.2 Check over ℚₚ, which is kept.

## Build and gate

- `lake build TauCetiRoadmap.GaloisSectionsPadicPeriodMaps.Suggested`: `Build completed successfully (18239 jobs).` `Suggested.lean` was not changed, and it still declares nothing. The `#check @name` comparison has nothing to compare: there are no declarations, and no binders were lost.
- Gate at `5fdc42d1`: `gate GaloisSectionsPadicPeriodMaps: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Dependency direction (`gate --depcheck … --movable --pr 1739`): `depcheck: 199 roadmaps, 2188 edges, 0 problem(s)`. There is no UPWARD or CYCLE line. Every supplier this round adds (EtaleCohomologyFoundations §F.0.A2, ArithmeticGaloisRepresentations §§1.3, 4.1) is on main.
- `roadmaps resolve` on the edited README: no cross-roadmap citation and no Lean name found nowhere.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §0.1: at a real place D_u = {1, c_ι} (AGR §4.1) | K = ℚ, u = ∞, ι: ℚ̄ ⊂ ℂ; K = ℚ(i), u complex | ι^*(conj) = conj restricted to ℚ̄: i ↦ −i, order 2, so the image is {1, c_ι}; at the complex place G_u = 1 and D_u = 1 (already stated on line 37) | holds | citation added |
| §0.1: sequences over K and K_u exact by F.0.A2 | X = Spec K; X = G_m; X = ∅ | Spec K: 1 → 1 → G_K → G_K → 1. G_m: kernel Ẑ(1). ∅ is not connected, so it is excluded by geometric connectedness. X_{K_u} is geometrically connected by IG.1.3 and qcqs because it is separated of finite type | holds | citation replaced |
| §1.4: exactness by F.0.A2 | Y smooth projective geometrically connected | projective implies qcqs, which is F.0.A2's hypothesis | holds | citation added |
| §0.3 API: Sec^Sel and loc_u independent of ι_u | X = Spec K; X = G_m over ℚ with ι' = ι∘σ, class of −1 at u = ∞ | Spec K: one point either way. G_m: σc(σ⁻¹gσ) − c(g) = (g−1)c(σ), a coboundary. The class of −1 in ℝ^×/ℝ^{×2} is the nontrivial class for both embeddings | holds | bullet added |
| §0.3: real localisation and total localisation are not targets | §9.5 proof route; §0.5(b) | §9.5 uses only §0.5(b), the projection to one finite place; bs p. 2 defines loc into Y(A_K)_• for curves, and §0.4 defines Y(A_K)_• for proper T, so the sentence restricts to curves | consistent | sentence replaces "no real-point localisation is defined here" |
| §1.1 needs AGR §1.3 | G profinite acting continuously on finite Σ_A | the stabiliser G_ψ is open, so AGR §1.3 ("H open in Γ", Γ compact) applies; for A = ℚₚ×ℚₚ with swap, Ind from index 2 has dimension 2·dim W | holds | Needs item added |
| §§1.5, 1.7 need AGR §§2.1, 4.1, not §§1.3, 1.12 | u archimedean allowed in §1.5; all places in §1.7 | only restriction along ι^* is used; at real u the group is {1, c_ι} | holds | Needs repaired |
| AGR contract: §4.1 complex conjugation, one conjugacy class | c_{ι∘σ} = σ⁻¹c_ισ (AGR §4.1) | two embeddings give conjugate involutions | holds | sentence added |
| Deleted §0.3 Check (2-torsion of E/ℚ) | E: y² = x³ − x, p = 2, 3 | loc_p(κ(P)) = P in E(ℚₚ), and the four points are distinct in E(ℚₚ) because E(ℚ) → E(ℚₚ) is injective; κ_{E_{ℚₚ}} injectivity is not used | the Check tests nothing beyond the kept Check "loc_u(κ_Y(y)) = y" | deleted |

## Ownership and sources

- Ownership: no new construction was added. The only scope statement added is H05's exclusion. A search of main and the open heads (`roadmaps grep` for real section maps, π₀ of real points and Selmer sections) found no other roadmap owning real-place localisation, so the exclusion leaves no object without an owner.
- Sources: one new text was tried, Stix's LNM 2054 (H08). The DOI fetch failed with "DOI prefix 10.1007 belongs to a paywalled publisher", and the title fetch with "no legal source found". No `needs-references.toml` entry was written, because no statement of the roadmap depends on that text.
