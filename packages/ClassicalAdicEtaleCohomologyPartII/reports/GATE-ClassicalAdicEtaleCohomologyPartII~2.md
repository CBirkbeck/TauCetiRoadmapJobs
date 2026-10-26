# GATE-ClassicalAdicEtaleCohomologyPartII~2: reply to the review of head f89fac3

The review is one comment by CBirkbeck at 2026-10-25T23:17Z. It has one finding, and its suggested fix makes three separate points, numbered H01–H03 in the order they appear:
- the supplier must be identified or published, declared, and its sections verified;
- the stated generality must be kept;
- the two labelled extensions need a concrete destination in the supplier.

Nothing else in the comment is a defect: its "Checks that were sound" section raises none. The repairs are in commit `bcae9a6`. Only the README changed; `Suggested.lean` is unchanged.

## H01 (CBirkbeck) — answered

The supplier is AdicSpacesPartIIPartII, under that name. It is an accepted package on the job board: `packages/AdicSpacesPartIIPartII/README.md` of TauCetiRoadmapJobs, package pull request #1098, head `2fad3dd`. Package review round 4 accepted it, and its red-team round 1 is open. It is line 11 of the merge order; this roadmap is line 291. It has not yet been opened as a roadmap pull request, so the review is right that no TauCetiRoadmap revision contains it. No README edit can change that. This pull request cannot be approved before that supplier pull request exists, and its dependency declaration should name it then; the pull-request text is outside this job.

I re-checked every cited section at `2fad3dd`. Each says what README:72 says it supplies:
- §0.1 Zariski closed subsets: coherent supports, reduced structures, a topology coarser than the analytic one.
- §0.2 local dimension at every point.
- §0.3 the five equivalent nowhere-density criteria, including local dimension drop.
- §0.4 Zariski-closed images of proper maps.
- §1.1 finite normalization, glued from affinoid charts.
- §1.7 unique extension of bounded functions across a nowhere dense analytic subset of a normal space, over any K.
- §2.1 the Zariski closed singular locus, nowhere dense when X is reduced.
- §2.2 over a perfect field, the smooth locus equals Reg(X), dense when X is reduced.
- §4.4 weakly Shilov points, which are dense.
- §4.6 their characterization by residue transcendence degree equal to dim_x X.
- §4.7 their absence from nowhere dense Zariski closed sets.
- §5.3 functorial resolution over characteristic-zero K of any rigid space whose non-reduced locus is nowhere dense: proper, smooth source, isomorphism over Reg(X).
- §5.4 surjectivity for reduced S, and the proper surjection from the resolution of T_red for any T.

No other owner exists under another name. A search by object found no other roadmap stating rigid Zariski closed sets, weakly Shilov points or rigid resolution as targets. It covered main and the 367 open heads (terms: weakly Shilov, generic smoothness, generic flatness, branched cover, Lütkebohmert, Riemann existence, Zariski-constructible). Main's RigidAnalyticGeometry supplies affinoid algebra only, and the supplier consumes it.

## H02 (CBirkbeck) — answered

The generality is kept, and the supplier sections support it.
- The supplier's Conventions take K complete for any nontrivial rank-one nonarchimedean absolute value.
- §5.3 assumes only characteristic zero, with no properness and no residue-characteristic condition, and is compatible with complete extensions of K. §5.4 applies to every reduced rigid space and, through T_red, to every rigid space.
- §2.2 needs only a perfect K, so every characteristic-zero K qualifies.
- §§0.1–0.4, 1.1, 1.7 and 4.4–4.7 hold over every K.

README Conventions ("Layer 7 allows every complete nontrivially valued characteristic-zero nonarchimedean K. Residue characteristic zero is included …") and §7.4 ("any proper morphism f:X→Y of rigid spaces over a characteristic-zero complete nonarchimedean field") are unchanged. Witness: K=ℚ((t)), f:Spa K⟨T⟩→Spa K⟨S⟩ with S=T², a finite map. §5.3 applies to both spaces, and S_f=Y∖{0} is a dense Zariski open.

## H03 (CBirkbeck) — applied

README:78 used to say only what the two contracts "build on", and that they are "not among that roadmap's own targets". It now ends with "Both contracts extend AdicSpacesPartIIPartII beyond its own targets, …". A new paragraph, README:80, names a destination for each:
- **gap:proper-generic-smoothness** goes in Layer 4, as a section following §4.7. This agrees with the plan's recorded section (RZ.2 and RZ.4). Its route is BH's: flatness over weakly Shilov points (BH line 475), smooth fibres over Shilov points (BH line 536), and Zariski-closed images by §0.4 (BH line 570).
- **gap:finite-branched-covers** goes in Layer 5, as a section following §5.4, not Layer 1. Full faithfulness needs only §§1.1, 1.4 and 1.7 (Han Theorem 2.6, Propositions 2.8–2.9, Han line 409 and Han line 435). Essential surjectivity needs more (Han Theorem 2.10 and proof, Han line 445–516):
  - an embedded principalization on affinoid charts. This is ResolutionOfSingularitiesCharacteristicZero §7.7 `qeEmbeddedStrictTransform`, which AdicSpacesPartIIPartII already consumes (its contract cites §§7.1, 7.5–7.8);
  - Lütkebohmert's extension across a strict normal crossings divisor (Han Theorem 2.11, Han line 469), which the paragraph makes a target of the same section.

  Neither is available in Layer 1. Because full faithfulness glues the local extensions, the global embedded rigid resolution that the supplier excludes from its scope is not needed.

The same defect affected every supplier gap block, so each now names its destination section, matching the sections recorded in the plan:
- README:68: "All five AdicSpacesPartIII contracts extend its §§R2.2–R2.8; gap:refined-formal-algebraization also extends its §F0.8."
- README:96: SchemeAndStackFoundations §§2.19–2.21, plus §0.6 for gap:valuation-canonical-reflexivity.
- README:122: PadicHodgeTheory §§2.1–2.7.
- README:144 (EtaleCohomologyFoundations §F.3) already had a destination.
- Scope, README:11: "The additional valuation-base and branched-cover conclusions are exact supplier contracts below" → the sentence now lists every contract family (valuation-base formal and duality statements, nearby coherence, toric field extension, quasi-excellent direct images, branched covers, proper generic smoothness), "each with its destination section in the supplier".

**For the worker (not a README matter).** Neither AdicSpacesPartIIPartII gap was ever announced to that supplier:
- Its board job, issue #279, has 11 comments, and none names finite-branched-covers or proper-generic-smoothness.
- Package pull request #1098 does not name them either.
- The intake announcements of 2026-10-25T11:51Z on this roadmap's job, issue #260, cover the other twelve declared gaps, but not these two.

Until they are announced on #279, the supplier's open red-team and gate rounds cannot take them in. The plan's recorded section for finite-branched-covers is "RZ.1", and it should be announced as RZ.5 (Layer 5), for the reason above.

## Build and gate

- `lake build TauCetiRoadmap.ClassicalAdicEtaleCohomologyPartII.Suggested`: `Build completed successfully (8976 jobs).` The only warning is `Suggested.lean:70:8: declaration uses 'sorry'`, from the headline `monomial_root_duality`. `Suggested.lean` is unchanged by this job.
- Gate at `bcae9a6`: `gate ClassicalAdicEtaleCohomologyPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK`
- Dependency check (`--movable`): `depcheck: 55 roadmaps, 637 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line. The two new edges are the citations of ResolutionOfSingularitiesCharacteristicZero (merge-order line 5) and AdicSpacesPartIIPartII Layer 5 (line 11), both earlier than this roadmap.

## Signatures

`Suggested.lean` was not edited, so the five elaborated types in the worker's signature file are current. Their comparison with README §3.7 is unchanged from the previous round, and no binder is lost.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| gap:finite-branched-covers (README:74), destination Layer 5 | closed unit disc over ℚ_p with Z={0}, Kummer cover S=Tⁿ; Artin–Schreier y^p−y=1/T over 𝔽_p((t)); X=Spa(K×K) with Z one point; Z=∅; normal surface with Z a nodal curve | Kummer: T↦Tⁿ is finite from a normal disc, étale off 0, and restricts to the given cover, so it extends. Char p: essential surjectivity fails (Han line 153), and the contract keeps char 0. K×K: Z is open, so not nowhere dense; the trivial cover and a split degree-2 cover over Z have the same restriction, so faithfulness would fail; nowhere density is needed. Z=∅: identity. Nodal Z: making the preimage snc needs a blow-up (RoS §7.7), and supplier Layer 1 has no blow-ups | statement holds; Layer 1 placement fails | destination set to Layer 5 |
| gap:proper-generic-smoothness (README:76), destination Layer 4 | point inclusion {a}→disc; Frobenius T↦T^p on 𝔽_p((t))⟨T⟩; f:Spa K⟨T⟩→Spa K⟨S⟩, S=T², K=ℚ((t)) | Point: the flat locus Y∖{a} contains the Gauss point (weakly Shilov), and S_f=Y∖{a}. Frobenius: finite, X smooth, Y reduced, no smooth fibre (BH line 462), so S_f=∅; char 0 is needed. S=T²: S_f=Y∖{0}. The route's inputs §0.4, §§2.1–2.2 and §§4.4–4.7 all precede the end of Layer 4 | holds | destination added |
| README:68, 96, 122: destination sections of the other contracts | headings at main `b240a0d` and at PadicHodgeTheory head `4c4f1e8` | AdicSpacesPartIII F0.8 (its README line 3525), R2.2–R2.8 (lines 4356–7480). SchemeAndStackFoundations 0.6 (line 678), 2.19–2.21 (lines 4094–4390). PadicHodgeTheory 2.1–2.7 (lines 449–594). Each agrees with the plan's `section` for that slug | match | sentences added |
| README:11 contract inventory | count of `What … must provide (gap:…)` lines | 13 contracts: AdicSpacesPartIII 5, AdicSpacesPartIIPartII 2, SchemeAndStackFoundations 3, PadicHodgeTheory 2, EtaleCohomologyFoundations 1. All are covered by the six named families, and every block names a destination | complete | restated |
| README:80 route: RoS §7.7 applies on an affinoid chart | A normal K-affinoid, Z=V(I) nowhere dense | Spec A is a noetherian, excellent ℚ-scheme, reduced because normal. Rigid nowhere density gives algebraic nowhere density (supplier §0.3(c): I lies in no minimal prime), which is §7.7's hypothesis "Z nowhere dense in every component" | holds | none |

## Ownership, citations and sources

- **Ownership.** No construction moved into this roadmap, and no notion moved down. Both AdicSpacesPartIIPartII gaps stay addressed to that earlier supplier, which now has a destination layer for each. No roadmap on main or at the 367 open heads states rigid generic smoothness, Hansen's branched-cover extension or Lütkebohmert's snc extension theorem as a target (search terms as in H01).
- **Citation leads.** `roadmaps resolve` after the edit lists one lead: README:80, "AdicSpacesPartIIPartII Layer 5: no roadmap … on main or in an open pull request". This is expected for a supplier that is still a board package; its Layer 5 and §5.4 exist at `2fad3dd`. This run did not check names against the pinned libraries ("no pinned Lake packages on this host"). That is why the earlier name lead `AdicSpace.henselianComparison_bijective_of_spec` (README:134) is not listed. It is the planned name of the ClassicalAdicEtaleCohomology §2.5 target sheaf-comparison-3-2-9 at that roadmap's open head (its README line 961), not a pinned declaration.
- **Sources.** Read for this job: Han line 120–162 and line 400–520 (Theorem 1.6, Theorem 2.6, Propositions 2.8–2.9, Theorems 2.10–2.11 and proof), and BH line 440–580 (Theorems 2.21, 2.25, 2.27, 2.29, Lemma 2.26, Remark 2.19). All cited texts are in the manifest. No new source was needed, and `needs-references.toml` was not written.
- **Untrusted text.** The review contains no instruction to run commands, reveal credentials or act outside this job. Nothing suspicious was found.
