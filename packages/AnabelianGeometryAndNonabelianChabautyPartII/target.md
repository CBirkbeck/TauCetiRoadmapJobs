Verdict: duplicate
Name: GaloisSectionsPadicPeriodMaps
Base: none
Owner: GaloisSectionsPadicPeriodMaps (board package, packages/GaloisSectionsPadicPeriodMaps/README.md on board pull request #1205, head 73538ce), Layer 9 §§9.3–9.5 with §§0.3–0.5, 1.8 and 9.1

## Scope

The filed target is "Anabelian geometry and nonabelian Chabauty, Part II". The text gives a title and nothing else. It was imported from the explorer job DESIGN-AnabelianGeometryAndNonabelianChabautyPartII (explorer issue #3475). That job's brief names exactly one continuation of AnabelianGeometryAndNonabelianChabauty proposed by the paper extractions: "Part II: Galois sections and p-adic period mappings", following Betts and Stix, and designed under the name GaloisSectionsPadicPeriodMaps. Its final theorems are Theorem A, Theorem B and Theorem 6.5 of that paper. The target's mathematical content is therefore the Betts–Stix Part II, and nothing broader.

That Part II is already planned. GaloisSectionsPadicPeriodMaps is a board package titled "Anabelian geometry and nonabelian Chabauty, Part II: Galois sections and p-adic period mappings". It calls itself the Part II of AnabelianGeometryAndNonabelianChabauty and starts where that roadmap's §7.1 stops. Its status:

- The design review and REV-PKG-GaloisSectionsPadicPeriodMaps~3 accepted it, conditional on seven declared supplier gaps.
- Red-team round 1 is in progress on board pull request #1205.
- It sits at line 206 of `merge-order/ORDER.txt`, after its base (line 196).

The "Structure" section of its design file (`packages/GaloisSectionsPadicPeriodMaps/design/README.md`, last section) names this exact job. It records that the explorer job would design the same Part II under another id, and asks for it to be retired. A second design would plan the same theory twice. The verdict is therefore `duplicate`.

GaloisSectionsPadicPeriodMaps owns everything this target would contain:

- restriction of Galois sections to decomposition groups (§0.1);
- the p-adic injectivity of the section map (§0.2);
- Selmer sections and their localisation maps (§0.3);
- the modified adelic points and the finite descent locus (§0.4);
- the Harari–Stix comparison (§0.5);
- symplectic pairs attached to sections, and the interpolation of local points (Layer 1);
- filtered discrete (φ, N, G_v)-modules (Layer 2);
- self-conjugate places (Layer 3);
- model-free period maps controlling D_pst (Layer 4);
- period maps of abelian-by-finite families (Layer 5);
- the Lawrence–Venkatesh locus and the principal trichotomy (Layer 6);
- finiteness for types (a) and (b) (Layer 7);
- Kodaira–Parshin families and type (c) (Layer 8);
- the end theorems (Layer 9).

The boundaries are as follows:

- AnabelianGeometryAndNonabelianChabauty §7.1 (open pull request #1021) owns section classes, the section map, its injectivity criterion, and the section conjecture as a named proposition.
- MordellLawrenceVenkatesh owns abelian-by-finite families, Kodaira–Parshin families, full monodromy and the Mordell theorem (its LV.11).
- The section conjecture is neither assumed nor proved.

The base roadmap could be continued in other directions. Examples are the local theory of unipotent Kummer maps away from p, finiteness of Chabauty–Kim loci for curves with CM Jacobians, Chabauty–Kim over number fields, and birational anabelian geometry (the Neukirch–Uchida and Pop theorems). These are not part of this target. A search of the open roadmap pull requests and main found no owner for them. Each would need its own target, with its own statement and sources. This triage plans none of them.

## Final targets

All of these are owned by GaloisSectionsPadicPeriodMaps at the sections named. Locators are to Betts–Stix arXiv v1 (`betts-stix-2022`).

Notation, in my own words:

- K is a number field and Y/K is a smooth projective geometrically connected curve of genus at least 2.
- Sec(Y/K) is the set of conjugacy classes of sections of the fundamental exact sequence. Conjugation is by the geometric fundamental group.
- A section s is **Selmer** when, for every place u of K, its restriction to the decomposition group G_u is the section of some K_u-point y_u.
- For a finite place u, loc_u sends a Selmer section to that point. The point is unique because the section map is injective over p-adic fields.
- Source: `betts-stix-2022` line 36 (Definition 1.1, p. 1). Owner: §§0.2–0.3.

1. **General form: finiteness at self-conjugate places** (owner §9.3). Let K be any number field and v a finite place of K that is self-conjugate. That means: for every CM subfield E of K, the place of E under v is fixed by the complex conjugation of E (`betts-stix-2022` line 632, Definition 2.17, p. 13). Then loc_v(Sec^Sel(Y/K)) is a finite subset of Y(K_v). There is no condition on ramification, residue characteristic (p = 2 is included) or reduction type at v. Source: `betts-stix-2022` line 111 (§1.1, points (1) and (2), p. 3). This is the generality the source supports, so it is the target.
2. **Theorem A** (owner §9.4). Assume in addition that K has no CM subfield. Then loc_v(Sec^Sel(Y/K)) is finite for every finite place v. This is the special case of target 1 in which every finite place is self-conjugate (`betts-stix-2022` line 637, Remark 2.18(1)). Source: `betts-stix-2022` line 44 (Theorem A, p. 1). **Check:** over ℚ the theorem covers every prime, including 2 and the primes of bad reduction of Y.
3. **Theorem B** (owner §9.5). Same hypotheses as Theorem A.
   - Y(A_K)_• is the set of modified adelic points: the finite adelic points times the connected components at the infinite places (`stoll-2007` line 129, §2, p. 4).
   - Y(A_K)_•^{f-cov} ⊆ Y(A_K)_• is the subset of points that survive every torsor under a finite étale group scheme (`stoll-2007` line 633, Definition 5.4, p. 16).
   - Conclusion: for every finite place v, the projection of Y(A_K)_•^{f-cov} to Y(K_v) is finite.
   - Sources: `betts-stix-2022` line 66 (Theorem B, p. 2). The reduction to Theorem A uses the Harari–Stix equivalence: an adelic family of local points survives all finite descent if and only if its local sections come from one global section (`harari-stix-2010` line 391, Theorem 2.1, p. 11, which Betts–Stix cite as Theorem 11 of the published version at `betts-stix-2022` line 64).
   - Stoll's conjecture that the locus equals Y(K) (`stoll-2007` line 1536, Conjecture 9.1, p. 38) is not assumed.
4. **Finiteness of the Lawrence–Venkatesh locus** (owner §9.1; Theorem 6.5). Let v be a self-conjugate finite place over the prime p. Then there is an abelian-by-finite family X → Y′ → Y (a finite étale cover Y′ → Y and a polarised abelian scheme X → Y′) with the following property. For every finite set S of places containing those over p and ∞ and the places of bad reduction, the Lawrence–Venkatesh locus Y(K_v)^{LV}_{X,S} is finite. The family is a Kodaira–Parshin family with a suitable odd parameter q.
   - The locus is the set of v-adic points y such that H^{≤1} of the geometric fibre at y, as a G_v-symplectic pair, is the restriction of an S-good symplectic pair (A, V) of G_K-representations.
   - S-good means three things: A is unramified outside S; V is unramified, pure and integral of weight 1 outside S; and V is de Rham above p with Hodge–Tate weights in {0, 1}.
   - Sources: `betts-stix-2022` line 2247 (Definition 6.2, pp. 43–44) and line 2279 (Theorem 6.5, p. 44).
   - Its consequence, the Mordell conjecture, is owner §9.2. That gives a second proof of the theorem owned by MordellLawrenceVenkatesh, not a second declaration.
5. **Selmer sections localise into the Lawrence–Venkatesh locus** (owner §1.8; Theorem 7.1). Take any abelian-by-finite family X → Y′ → Y and any p-adic place v. Then loc_v(Sec^Sel(Y/K)) lies in the adelically interpolated locus Y(K_v)^{LV}_X. That locus is contained in Y(K_v)^{LV}_{X,S} for every suitable S (`betts-stix-2022` line 2266, Lemma 6.4). Source: `betts-stix-2022` line 2812 (Theorem 7.1, p. 54).

## Suppliers

The owner's supplier contracts (its README, "Exact supplier contracts") name the following. All are earlier in `merge-order/ORDER.txt` than GaloisSectionsPadicPeriodMaps (line 206), or are on main.

- AnabelianGeometryAndNonabelianChabauty §7.1, the base of the Part II (line 196; pull request #1021): section classes, the section map, the Kummer interpretation and the field-general injectivity criterion.
- MordellLawrenceVenkatesh §§0.4–0.18, 1.4–1.16, 2.1–2.4, LV.8, LV.10 and LV.11 (line 173): abelian-by-finite families, Kodaira–Parshin families, full monodromy and Mordell. The owner declares five model-free extensions as gaps of this supplier.
- PadicHodgeTheory §§3.3–3.5, 5.1, 5.3, 7.2–7.3 and 8.1–8.2 (line 136). Gap `horizontal-pst-specialisation`.
- CohomologyComparisons §§6.4–6.7 (line 204).
- HeightsRationalPointsAndObstructions §§2.3–2.4, 2.11, 2.11a and 3.1–3.5 (line 152).
- InverseGaloisAndArithmeticFundamentalGroups IG.0 and IG.1.3 (line 49).
- ArithmeticGaloisRepresentations §§1.3, 1.12 and 2.1 (line 47).
- AbelianSchemesAndArithmeticModuli §§A3.5, A3.7, A4.3–A4.4 and A6.30–A6.31 (line 46).
- AlgebraicModuliForArithmeticGeometry §1.3 (line 35).
- ComplexComparisonPartII §§C5.2, C6.0 and C6.2 (line 42).
- EtaleDualityAndPerverseSheaves §§0.3 and 0.5 (line 117).
- ArithmeticGaloisDuality §R02.3 (line 48).
- WeightsInEtaleCohomology R34.1–R34.2 (line 159).
- AnalyticNumberTheoryPartI §0.32 (line 95). Gap `linnik-polynomial-least-prime`.
- On main: AdicEtaleGeometry A1.1 and A1.3, AdicSpacesPartII R1, ClassFieldTheory Layers 5, 7 and 11, GlobalNumberFields Layers 2, 7 and 8, LocalFieldsRamification Layers 0, 1, 2 and 4, LocalGaloisGroups Layer 7, ReductiveGroups Layers 0 and 3, and Chebotarev Layers 10 and 13–14.
- Pinned libraries: Mathlib `Field.absoluteGaloisGroup`, `ContinuousMonoidHom`, `ConnectedComponents`, `IsDedekindDomain.HeightOneSpectrum.adicCompletion`, `LinearMap.IsAlt`, `Matrix.symplecticGroup` and `NumberField.IsCMField`; Tau Ceti `TauCeti.Symplectic.groupScheme`.
- The pinned libraries contain no Galois-section, section-conjecture or Chabauty-theorem declarations. Tau Ceti's continuous nonabelian H¹ modules are absent at the pinned Tau Ceti revision.

## Consumers

As recorded in the owner's "Downstream consumers", the following use the owner's results:

- Theorem A and Theorem B constrain Selmer sections and finite descent at every finite place over fields without CM subfields.
- Theorem 7.1, the general local-system restriction theorem, applies to other cohomological obstructions. These include the nonabelian Chabauty constructions of AnabelianGeometryAndNonabelianChabauty Layers 4–5.
- The model-free horizontal-transport results (owner Layer 4) and the self-conjugate weight identities (owner Layer 3) apply to smooth proper families without reduction models, and to induced pure representations.

No roadmap or board package names GaloisSectionsPadicPeriodMaps as a supplier yet; MordellLawrenceVenkateshPartII, for instance, does not cite it. No consumer depends on a separate AnabelianGeometryAndNonabelianChabautyPartII.

## Sources

All three were read through the sources service from arXiv (licence class open-repository, status certified) and are recorded in `packages/AnabelianGeometryAndNonabelianChabautyPartII/sources.toml`.

- `betts-stix-2022`: L. A. Betts and J. Stix, *Galois sections and p-adic period mappings*, arXiv:2204.13674v1; published in Annals of Mathematics 201 (2025), 79–166, DOI 10.4007/annals.2025.201.1.2. Locators: Definition 1.1 and Theorem A (p. 1, lines 36 and 44); Theorem B (p. 2, line 66); Definition 2.17 and Remark 2.18 (p. 13, lines 632 and 637); Definition 6.2, Lemma 6.4 and Theorem 6.5 (pp. 43–44, lines 2247, 2266 and 2279); Theorem 7.1 (p. 54, line 2812). The numbering is that of arXiv v1. The published version was not compared; the owner package records the same choice.
- `harari-stix-2010`: D. Harari and J. Stix, *Descent obstruction and fundamental exact sequence*, arXiv:1005.1302v2; published in The Arithmetic of Fundamental Groups (PIA 2010), Springer 2012, 147–166. Locator: Theorem 2.1 (p. 11, line 391).
- `stoll-2007`: M. Stoll, *Finite descent obstructions and rational points on curves*, arXiv:math/0606465v3; published in Algebra & Number Theory 1 (2007), 349–391. Locators: §2 (p. 4, line 129); Definition 5.4 (p. 16, line 633); Conjecture 9.1 (p. 38, line 1536).

No source is missing, so no reference request is filed.

## Risks

- **The owner is not finished.** GaloisSectionsPadicPeriodMaps is accepted but still in red team. Its round-1 pass b reported one P2 and two P3 findings on supplier attributions, which are fixable: the modified adelic carrier is to be owned in its §0.4 rather than attributed to HeightsRationalPointsAndObstructions §3.17d. If that package were withdrawn rather than repaired, this target would have to be reopened as a design under the Betts–Stix scope above. It should not be treated as a broader Part II.
- **The owner's acceptance is conditional.** It depends on seven declared supplier gaps, in MordellLawrenceVenkatesh, PadicHodgeTheory and AnalyticNumberTheoryPartI. Its design also records rescope proposals towards MordellLawrenceVenkatesh, PadicHodgeTheory (a future PadicHodgeTheoryPartII) and HeightsRationalPointsAndObstructions. These are the owner's risks; a duplicate design here would inherit them unchanged.
- **The base is not merged.** AnabelianGeometryAndNonabelianChabauty is an open roadmap pull request (#1021), not on main. The owner's §7.1 imports depend on it.
- **Published numbering is unchecked.** The Betts–Stix locators use arXiv v1, which can be read legally. The Annals numbering was not compared.
- **The target's wording is generic.** Anyone who wants a continuation of the base other than Betts–Stix (see Scope) must file it as a new target with its own statement. The title alone does not reserve that scope.
