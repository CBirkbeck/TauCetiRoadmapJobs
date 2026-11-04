# GATE-EllipticLegendreCharacterInterfaces~3: answers to human review

Review: CBirkbeck, 2026-10-25T20:44:33Z, on head 3115183. It repeats one blocking finding, which makes four points, one per neighbouring roadmap (H01–H04). It also makes three further points in its scope notes:

- H05: the universal family stays in ModularCurves.
- H06: the BS20 line numbers are not certified.
- H07: the newer Tau Ceti Legendre normalization does not replace §0.9.

The "Checks found sound" list asks for nothing.

All four neighbours still have the heads the review names: MordellLawrenceVenkatesh 73dc3e8, ComputationalNumberTheory 37b9f6f, ErdosProgressionPowers e007747 and ArithmeticDynamics d7b0a19. All four come later in the merge order (`ORDER.txt`): this roadmap is line 105, against 173, 154, 263 and 268. So the allocation stands: the generic material is supplied here and imported by them. The redirects themselves are edits to those four roadmaps' own folders, which this pull request cannot carry. This round's repair closes the one gap on this side. ErdosProgressionPowers §2.1 restates two facts that this README stated only implicitly: the twist scalar of each root ordering, and the square-scaling change of the scaled model. Both are now explicit targets here, so each consumer edit becomes a deletion plus a citation.

Repairs are in commit 2b50d7a9 ("EllipticLegendreCharacterInterfaces: review repairs (ordering scalars in §0.8, square-scaling change in §0.2 for Erdős re-citation)"). It changes only `TauCetiRoadmap/EllipticLegendreCharacterInterfaces/README.md` (8 insertions, 6 deletions). `Suggested.lean` is unchanged.

## H01 (CBirkbeck) — answered

Confirmed again at MordellLawrenceVenkatesh 73dc3e8, `TauCetiRoadmap/MordellLawrenceVenkatesh/README.md` §6.4:
- line 2086 says the coefficient model "is to be defined" over every commutative ring;
- lines 2094–2096 list the model, Δ and j as its own bullets;
- its *Needs* (line 2104) does not cite this roadmap.

This README already supplies all three over every commutative ring: §0.1 `legendre`, and §0.4 Δ=16λ²(1−λ)², c₄ and j on λ≠0,1. The README is unchanged for this point. The consumer edit is: replace those three bullets with "EllipticLegendreCharacterInterfaces §§0.1, 0.4", add that citation to its *Needs*, and keep the cyclic family, the abelian-by-finite structure and the good-model bullets.

## H02 (CBirkbeck) — answered

Confirmed again at ComputationalNumberTheory 37b9f6f, `TauCetiRoadmap/ComputationalNumberTheory/README.md` §3.17 (lines 1681–1696). It states and proves `pointCount = q + 1 + Σ χ(f(x))` and the trace for every normal form over every odd finite field, singular ones included. Its *Needs* cite only Tau Ceti and Mathlib.

§5.1 here states exactly that identity, with the same hypotheses (odd characteristic, a₁=a₃=0, no ellipticity) and the same 𝔽₂ non-example. So the consumer edit loses nothing: cite "EllipticLegendreCharacterInterfaces §5.1" for the count and trace, and keep only the filtered-enumeration bullet and the computational applications. The README is unchanged for this point.

## H03 (CBirkbeck) — applied differently

Confirmed again at ErdosProgressionPowers e007747:
- scope lines 61–69 and the supplier contract at lines 359–365 still take the ordinary model from MordellLawrenceVenkatesh §6.4;
- the contract (lines 483–500) calls LG.0 rational and LG.3 prime-field with p≡3 mod 4;
- §2.1 undertakes the field extension itself (lines 1056–1063) and the odd-finite-field extension itself (lines 1081–1088).

Two facts in §2.1 had no explicit target here, so deleting them would have lost content:
- the scalar of each root ordering, "D, Dλ, −D, D(λ−1), D(1−λ), −Dλ" (line 1061);
- the change from G_(D,λ) to G_(Du²,λ), given by (x,y)↦(u²x,u³y) (line 1052).

Both are now stated here:
- README line 196 (§0.8): "with the corresponding twist scalar recomputed" → "for the root orders (012),(021),(102),(120),(210),(201) of §0.6 … scalars d′=d, dλ, −d, d(λ−1), d(1−λ), −dλ respectively, each nonzero". There is a matching proof step at line 200 and a computed Check at line 206.
- README line 106 (§0.2) has a new API bullet: the change with scaling u⁻¹ carries L(d,λ) to L(u²d,λ) over every commutative ring, and on points sends (x,y) to (u²x,u³y). Its *Needs* at line 118 now name Mathlib `WeierstrassCurve.VariableChange` and Tau Ceti `WeierstrassCurve.Affine.Point.addEquivVariableChange`.
- Scope (line 13) and Downstream consumers (line 640) now list §0.2 and §0.8 alongside §§0.9 and 3.1.

The ErdosProgressionPowers edit is then purely a re-citation:
- take the ordinary model from §0.1;
- replace the LG.0–LG.5 labels with §§0.1–0.3, 0.8–0.9, 1.2, 1.5, Layer 2, §§3.1, 3.7, 4.1 and Layer 5;
- delete the two §2.1 extension paragraphs and the u²-scaling bullet.

## H04 (CBirkbeck) — answered

Confirmed again at ArithmeticDynamics d7b0a19:
- scope line 13 and the supplier paragraph at lines 172–174 take the model, Δ=16t²(t−1)² and j from MordellLawrenceVenkatesh §6.4;
- §6.35 (line 9096) restates them for its Lattès map.

These are §§0.1 and 0.4 here, with the same hypotheses: j only on char ≠ 2 and t≠0,1. Either form the review proposes is a forward edge, since ArithmeticDynamics (268) comes after this roadmap (105): cite §§0.1, 0.4 directly, or keep MordellLawrenceVenkatesh §6.4 as a forwarding contract once H01's edit is made. The README is unchanged: line 13 already leaves §§6.35, 6.111–6.112 (Lattès maps and torsion images) with ArithmeticDynamics.

## H05 (CBirkbeck) — answered

README line 11 already says so: "ModularCurves §4C owns the universal Legendre curve; §0.1 is its coefficient-level form over every commutative ring. ModularCurves §9E owns the Legendre line, its S₃ action and invariant-ring description." On main, `TauCetiRoadmap/ModularCurves/README.md` §4C item 1 (line 1104) constructs the Legendre problem over ℤ[1/2], and §9E (line 2030) the Legendre line Λ with its S₃ action. No target here constructs a moduli family.

## H06 (CBirkbeck) — answered

The line numbers are read from the line-numbered extraction of the publisher PDF named in References, and they agree with the page and lemma locators the review checked. Extraction pages 13, 14, 16 and 17 are journal pp.367, 368, 370 and 371. Rechecked lines:
- 513: equation (17), p.367;
- 526: Lemma 6.2, p.367;
- 544: the six λ-invariants;
- 547: Lemma 6.3, p.368;
- 554: the halving test;
- 568: the Lemma 6.4 step;
- 658: the descent map;
- 663: Lemma 6.5, p.370;
- 703: the twist by 2;
- 710 and 715: the root images;
- 718: the printed order-four point, p.371.

Line 715's images (2,2,1), (2,2,1), (1,1,1) agree with the §2.6 formula at d=2, λ=3 over 𝔽₅. The raw tuples there are (2,3,4), (2,2,1) and (1,4,4).

## H07 (CBirkbeck) — answered

At the pinned Tau Ceti a91d3aaf there is no `Legendre` module and no `freyCurve`, so §§0.1, 0.8 and 0.9 duplicate nothing at the pin. Pinned Mathlib has no Legendre model either.

The newer Tau Ceti c7cfc607 is 7952 commits past the pin. Its `exists_variableChange_smul_eq_freyCurve_one` assumes `u ^ 2 = e₂ - e₁` and reaches the unscaled `freyCurve 1 (-λ)`. That is the coefficient tuple of `legendre λ` here, as §0.1's Frey bullet states. So the newer module agrees with this README's shape, and with its §0.8 Check that L(2,3) is not ℚ-isomorphic to L(3). The scaled normalization of §0.9 over the original field remains this roadmap's target.

## Build

`lake build TauCetiRoadmap.EllipticLegendreCharacterInterfaces.Suggested`: Build completed successfully (8995 jobs). The only warnings are the seven `declaration uses 'sorry'` lines, at Suggested.lean lines 34, 45, 58, 70, 79, 89 and 97.

## Gate

After commit 2b50d7a9:

    gate EllipticLegendreCharacterInterfaces: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK

Direction check (`gate --depcheck … --movable`):

    depcheck: 55 roadmaps, 633 edges, 0 problem(s)

The output has no UPWARD, CYCLE or `moved:` line for this roadmap.

## Signatures

`Suggested.lean` is unchanged, and the new README statements are supporting API, not headlines, so nothing was added to it. I compared each of the 9 elaborated types in the job's signature file (from its `#check @name` scratch file) with its README statement; this is the same comparison as last round:
- `legendre` and `scaledLegendre` are over `CommRing`.
- `exists_scaledLegendre_of_full_two_torsion` has Field, `DecidableEq`, 2≠0, `IsElliptic` and a doubling kernel of cardinality 4.
- `legendre_units_of_good_reduction` has p≠2 and good reduction of the minimal model over ℤ_p.
- `scaledLegendre_halving_iff_squares` has d≠0 and λ≠0,1.
- `legendre_two_by_four_subgroup` has `Finite F`, 2≠0, η≠0 and η²≠1.
- `legendre_minus_one_point_count_v_two` has q≡5 mod 8.
- `symmetric_cubic_trace_zero` has q≡3 mod 4 and every a.
- `quadraticTwistOf_frobeniusTrace` has 2≠0, normal form and every d.

No binder is missing and none changed.

## Adversarial pass (statements added or changed)

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §0.2: change with scaling u⁻¹, r=s=t=0, gives C•L(d,λ)=L(u²d,λ) | (d,λ,u)=(1,3,2),(1,3,4),(2,1/2,−3),(−5,7/3,1/2),(0,5,3),(2,3,1) over ℚ, using pinned Mathlib a₂'=u_C⁻²a₂ and a₄'=u_C⁻⁴a₄ | (a₂,a₄)=(−16,48)=L(4,3); (−64,768)=L(16,3); (−27,162)=L(18,1/2); (25/6,175/48)=L(−5/4,7/3); (0,0)=L(0,5); (−8,12)=L(2,3) at u=1 | Holds, including d=0 and u=1 | added |
| §0.2: point map (x,y)↦(u²x,u³y) from L(d,λ) to L(u²d,λ) | 𝔽₇ with (d,λ,u)=(1,3,2),(3,5,3),(2,4,6) | All 3, 3 and 7 affine points land on the target curve | Holds; direction agrees with `addEquivVariableChange : (C•W).Point ≃+ W.Point`, whose inverse is (x,y)↦(u_C⁻²x,u_C⁻³y) | added |
| §0.8: scalars d′ for the six orders | Roots (3,5,9), (1/2,−4,7/3) and (0,1,−1); for each order, translate by the first root and compare with L(d′,λ′) | (3,5,9): (2,3),(6,1/3),(−2,−2),(4,−1/2),(−4,3/2),(−6,2/3). (1/2,−4,7/3): d′=−9/2,11/6,9/2,19/3,−19/3,−11/6. (0,1,−1): d′=1,−1,−1,−2,2,1 with λ′=−1,−1,2,1/2,1/2,2. In all 18 cases the translated curve equals L(d′,λ′) | Holds, including the coincident λ=−1 labels | added with Check |
| §0.8: wrong model, one scalar for every order | Order (021) of (3,5,9) with d′=2 | L(2,1/3) has roots 0, 2, 2/3, whose differences {2, 2/3, 4/3} are not those of {3,5,9} | The wrong model is excluded by the new Check | Check added |
| §0.8: "each nonzero" | d≠0, λ∉{0,1} | The six scalars are products of d, λ, λ−1 and −1 | Holds; fails at λ=1 (d(λ−1)=0) and λ=0 (dλ=0), which the hypotheses exclude | none |
| Line 640 Erdős import list vs Erdős §2.1 at e007747 | Every item of lines 1037–1088 | Ordinary model → §0.1. Scaled model and Δ → §§0.2, 0.5. u²-scaling → §0.2. Six orders and scalars → §§0.3, 0.8. Field normalization → §0.9. Units and conductor → §§1.2, 1.5. Trace transport → §5.2. Subgroup → §3.1. 8∥#F₋₁ → §3.7 | Every deletable item has a target here | list updated |

## Ownership and citations

I checked ownership against open work by object, at these copies:
- ComputationalNumberTheory, ErdosProgressionPowers, ArithmeticDynamics and EllipticCurveModularityPartII: the given sibling checkouts, at the heads above (EllipticCurveModularityPartII at 46ba4f1, §5.1 `FullRationalTwo`).
- MordellLawrenceVenkatesh: the brief's roadmap index tool, at 73dc3e8.
- EllipticCurves and ModularCurves: on main.

The citation resolver finds no unresolved cross-roadmap citation or Lean name. The supplier sections cited all exist under the cited titles:
- ClassicalArithmeticCompletion §§1.7, 1.8, 1.51 (on main);
- NeronModelsAndSemistableAbelianVarieties §§5.3a, 5.3g;
- ArithmeticGaloisRepresentations Layer 3;
- EllipticCurves Layers 4, 5 and the Worked examples.

No supplier later in the order is cited, and no notion moved down this round. The square-scaling change and the ordering scalars belong here because they are facts about this roadmap's own `scaledLegendre` and §0.8 normalization. Their only other occurrence is in ErdosProgressionPowers, which is a consumer.

## Sources

No new source was cited and none was fetched. `needs-references.toml` was not created. The review contains no instruction-like text.
