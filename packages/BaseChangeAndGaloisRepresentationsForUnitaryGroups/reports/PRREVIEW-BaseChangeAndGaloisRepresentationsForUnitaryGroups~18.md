# Review of BaseChangeAndGaloisRepresentationsForUnitaryGroups (pull request #3027 at f0da4ff)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/BaseChangeAndGaloisRepresentationsForUnitaryGroups/`
**Verdict:** accepted

**Summary.** An incremental re-review of the 21 lines changed since `4b01d78`: accepted, with no finding. The change rewrites three sentences on what [FormalProof] states (the setting of the map of 10.29a, the restricted away-prime comparison of 14.1, the hypotheses of the depth-zero case of 14.2); each was read against the Lean source at the commit the References name and agrees with it. The family index now carries the sentence on corollaries that the previous review asked for. Two format notes remain, neither blocking; three points are left for the human reviewers.

## N01 — Two citations of [FormalProof] give a declaration name without its file

In 10.27 (line 178) `GlobalTheory.T.tateLocalEpsilonFactor_mul_tameChar` and, new in this change, in 14.1 (line 955) `GlobalTheory.Published.GaloisRepOfPolarizedPair` are cited by name only, while every other citation gives the path. The second is in `Development/AbelianVarietyTheory/PublishedTheorems/GaloisGeometry₂/GaloisRepOfPolarizedPair.lean`.

## N02 — In 14.2 (line 1011) "its supercuspidal support" has lost its referent

The clause inserted before it makes "its" read as the support of the Weil–Deligne image. The source's condition is on the support of `π_w ⊗ |det|^{(1−n)/2}`, which is of pairwise unlinked characters exactly when that of `π_w` is. Would "the supercuspidal support of `π_w`" do?

## Questions for the author

- The Origin label of 13.8a (line 749) still credits the comparison of simple trace formulas for inner forms of unitary groups to "Kottwitz, Clozel, Harris and Taylor, Labesse" with no works and no locators. Which works and statements are meant? There was nothing to open.

## Previous findings

- none: the previous report (of `4b01d78`) raised no finding. Its small correction and format note are accounted for as follows.
- C01 — repaired (D01): the family index reads "needs no more of the general theorem than that case" (line 203), as the roadmap's convention does.
- N01 — not repaired: carried above, with the new citation of line 955.

## Deferred findings

- D01 — resolved: the family index, line 203, now reads "needs no more of the general theorem than that case".

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 10.29a, setting of the form the family uses (line 230) | `F = ℚ_p`; `F/ℚ_p` finite | Source: `RecTExists` quantifies over a number field `E`, an algebraic closure `Ω`, a valuation subring above `w`; maps `IrrGL(E_w) → WD h`. Every finite `F/ℚ_p` is some `E_w` | README sentence matches; statement "for `F/ℚ_p` finite" is covered | none |
| 14.1, restricted form (lines 950–953) | `n = 1`; `GL_2`, twist of Steinberg; `GL_2`, `π_θ̃`, `E_w ≅ ℚ_p`, `p > 64` | `n = 1`: commutators act trivially, `N = 0`, so equality holds. Steinberg: `N ≠ 0`, only `2 = 2`. `π_θ̃`: not abelian, tame, eigenvalues `θ(ζ) ≠ θ(ζ)^p`, so `N = 0` and inertia polynomials | The three clauses are those of `AwayB` (`dim`, `tor`, `tame0`); agrees with the Checks `n = 1` and `n = 2` of 14.1 | none |
| 14.1, "trivial on the commutators" against the source's condition | Frobenius-semisimple `y` | Source: characteristic polynomial of each commutator is `(X − 1)^n`; commutators lie in inertia, of finite image, so unipotent means trivial | equivalent | none |
| 14.1, the full comparison `GaloisRepOfPolarizedPair` (lines 954–955) | the clause `away` of `IsGalRepOf` | Source: at every `w ∤ ℓ`, `IsWDOf ι r (rc(…))` with monodromy `N`, for the full correspondence; the declaration is absent from the kernel export of the proof's main theorems | stated, and not depended on, as the README says | N01 |
| 14.2, the case [FormalProof] has (lines 1010–1014) | support `{χ, χν}`, `π_w = χ∘det`-type quotient, `E_w ≅ ℚ_p`; same support, Steinberg twist | First: linked, no member of rank ≥ 2, `N = 0`: second alternative applies. Second: `N ≠ 0`, hypothesis fails | hypotheses are depth zero, `N = 0` of the image, and `PlainTor ∨ (E_w ≅ ℚ_p ∧ Apart)`; the parenthesis on linked supports is right | N02 |
| Convention on corollaries, family index (line 203) | 13.0a against AnabelianGeometryAndNonabelianChabauty §2.0a | roadmap: "no more … than that case (for 13.0a, all of it)"; index: "no more of the general theorem than that case" | agree | none |

The rows for the untouched statements stand as in the previous review, of `4b01d78`.

- **Source locators checked against the text: 4** declarations of [FormalProof], read in the Lean source: `UpperTheory.Zero.LLC.RecTExists` (with `LawsT`, `TypeLaw`), `UpperTheory.GalStar.Row0b` (with `AwayB`, `IsQpBig`, `Tor`, `Sqf`, `TmW`), `GlobalTheory.Published.GaloisRepOfPolarizedPair` (with `IsGalRepOf`), `UpperTheory.Gal.ToralGalois.R2.LocalGlobalCompatAtIwahoriFixedPlaces` (with `Apart`, `PlainTor`, `Inert`). The five files have the same blobs at the first commit `40e56bab`, which the References name.
- **Sampled targets in the changed passages:** 10.29a, 14.1, 14.2 (above). 15.1 and 16.1 are untouched; the bound "`n = 1` or `p > 16n²`" that line 956 keeps for them is `IsQpBig`.
- **Cross-roadmap citations resolved:** the change adds none; "the laws of 10.29a" resolves to this roadmap's 10.29a, whose form is `RecTExists`, the map `Row0b` is instantiated with (`IsRecT`).
- **Library declarations opened at the pin:** none; the change names no library declaration.
- **Record:** against the merge base no heading is removed or retitled; no layer is added, removed or reordered.
- **Pull request text:** title and description read against this head; the sentences on this roadmap (two new suppliers, 16.1 as a remark, 10.0a a corollary of InductionRestriction §6.2) hold, and the description's sentence that the family's statements about the formal proof were checked against the Lean source covers this change. The family index rows on the local correspondence and on the Galois representations (lines 163–164) say the same as the new sentences.
- **Dependency check:** `depcheck: 121 roadmaps, 1398 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- **Elaboration and automatic checks:** `lake env lean` on `Suggested.lean` exits 0 with no message; the file is unchanged since `4b01d78` (a docstring and an empty namespace, so no one-tactic probe or signature comparison applies). All automatic checks passed at this head.

Overlap check: read LocalFactorsOfTwistsAndTypes, FiniteReductiveGroups, CongruenceModulesOfThetaLifts (scope sections, as in the previous review); nothing shared: the change adds no object, only sentences on the forms of [FormalProof]. No other open pull request changes this roadmap and none drops an id it cites.

Source independence: changed passages only; 3 passages (the setting of 10.29a, the restricted form of 14.1, the case of 14.2) compared with 1 source ([FormalProof], Lean declarations), none shared: the README describes in prose what the declarations state; largest share [FormalProof], 32 file-path locators; contents not compared: the change adds, removes and reorders no layer.

Research link: Layers 10 and 14–16 state the explicit depth-zero local Langlands correspondence (Henniart 1992; Bushnell–Henniart 2005; Scholze 2013) and properties of the Galois representations of polarized cuspidal representations and of definite unitary groups (Shin 2011; Caraiani 2012; BLGGT 2014; Guerberoff 2011). Rests on the README's Summary and References and on Scholze Thm 1.2, BLGGT Thm 2.1.1, Guerberoff Thm 2.3.

## Not verifiable

- [FormalProof] outside the changed passages: the other file paths, declaration names and *Method of the formal proof* labels were not reread in this round.
- DeBacker–Reeder 2009, Henniart 1992, Bushnell–Henniart 2005, Deligne–Henniart 1981, Kottwitz 1986, Caraiani 2012, Kudla 1994, Harris–Kudla–Sweet 1996 and Radford 1979 (uncertified): no text read, as in the previous review; the change touches none of their locators.
- The comparison of 13.8a with published simple trace formulas: the Origin label gives no work to open (the question above).

## Source issues

- none

## For the human reviewers

- Scope: the statements of 10.27, 10.29a and 16.1 (README lines 172, 220, 1269) are forms particular to [FormalProof], a Lean formalization announced on 20 November 2026; published or general forms stand beside them as remarks or in EndoscopicTransferAndUnitaryTraceComparison.
- Licence: [FormalProof], the source with the largest share of locators (32), was read for the changed passages in a copy of its public repository, which states no licence; the README cites names and paths only. Arrangement was not compared with it.
- Supplier: this roadmap, on `main`, cites DeligneLusztigTheory (§§2.6 (d), 2.9), a roadmap this same pull request adds and the merge order does not list; the dependency check reports no problem.
- Decisions: no section leaves this folder (no heading removed against the merge base), so neither recorded decision was needed here.
