# Review of BordismFormalGroups (pull request #1807 at 7e8275c)

**Verdict:** accepted

Incremental re-review of 0 changed lines since 12e0624: the folder `TauCetiRoadmap/BordismFormalGroups/` is byte-identical to the head the previous review accepted (`git diff --stat 12e0624..HEAD -- TauCetiRoadmap/BordismFormalGroups` prints nothing; the md5 sums of `README.md` and `Suggested.lean` at 12e0624 and at 7e8275c agree). The three commits since are a merge of main (eaf17b1, which brought the PseudoholomorphicCurveAnalysis consumer rewrites of DGFloer, TaubesGromov, ComplexCurveModuli and HeegaardFloer, a RepresentationTheory progress report and a workflow pin, all of them main's own content), a ComplexKahlerGeometry repair and an AlgebraicCurves repair. None of the diffs in the pull request's declared folders since 12e0624 contains the string `BordismFormalGroups`, so nothing this roadmap relies on, and nothing that relies on it, changed. The gate passes, the dependency check prints no UPWARD or CYCLE line, `Suggested.lean` elaborates at the pins with only its `sorry` warning, and the one-tactic padding probes fail on the one theorem. No finding remains, new or carried.

## Previous findings

The previous report (r19, at 12e0624) recorded no finding: its verdict was accepted, carrying the r17 and r16 acceptances of the r14 repairs R01–R03 at b0ef636. Nothing is carried forward.

- (r19 carried none) — nothing to account for; the folder is unchanged since b0ef636, where the r14 repairs R01–R03 were verified repaired.

## Verified sound

**Change outside the folder.** `git diff --stat origin/main...HEAD` restricted to paths outside the fourteen declared folders prints nothing (exit 0, empty): the `.github/workflows`, DGFloer, HeegaardFloer, TaubesGromov, ComplexCurveModuli and RepresentationTheory files that `changes.md` lists are main's own commits (77a53e0f–eaf17b10) reached through the merge commit 8e816c6e, not changes of this pull request. The pull request changes 22 files against origin/main: the 2 of this folder and 20 inside the thirteen other declared folders.

**Gate.** The worker's gate at 7e8275c (`gate.md`): every counter 0, `build=0`, `OK`. Re-run by me with `--base origin/main --build --order`: every rule 0 except `outside-folder=20`, and `git diff --name-only origin/main...HEAD` over the thirteen other declared folders lists exactly those 20 files (AlgebraicCurves, AlgebraicTopology, CharacteristicClasses, ClassifyingSpaces, ComplexKahlerGeometry, GeneralizedCohomology, LocalPurity, PadicFunctionalAnalysis, PurityOfBranchLocus, ReductiveGroups, RigidAnalyticGeometry, SchemeAndStackFoundations, TopologicalKTheory), which this brief names as the pull request's own; that line is not a finding, exactly as in r14–r19.

**Dependency check**, re-run on this head with `--movable`:

```
depcheck: 240 roadmaps, 2439 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line for BordismFormalGroups (the edge count rose from 2358 at r19 to 2439 with the merged main; no problem appeared).

**Elaboration.** `lake env lean TauCetiRoadmap/BordismFormalGroups/Suggested.lean` at the pins (Mathlib 1b1ccf4b, Tau Ceti 2fd255d9; `lake-manifest.json` and `lean-toolchain` unchanged since 12e0624): exit 0 in 3 s, the single warning `56:8 declaration uses 'sorry'`. The elaborated signature (worker's `signatures.md`) is `∀ {k} [Field k] [IsSepClosed k] (p) [Fact p.Prime] [CharP k p] (F G : FormalGroup k) [F.IsComm] [G.IsComm], Nonempty (TauCeti.FormalGroupIso F G) ↔ F.height p = G.height p`; README lines 269–274 state the same hypotheses (separably closed field of characteristic p, commutative one-dimensional formal groups) and the same conclusion, the infinite-height class included. Every binder is the declaration's own; none is a dropped section variable (the worker's extraction reports 0 dropped and again lists two spurious entries, `,` and `and`, parsed from the module docstring; the file declares exactly one theorem in 61 lines). Form: `module` / `public import Mathlib` plus the two `TauCeti.*` modules `RingTheory.FormalGroup.Hom` and `RingTheory.FormalGroup.Height.Basic`, both present at the pin, `@[expose] public section`, one module docstring naming the non-statable headlines and what each lacks, `theorem` not `lemma`, no `set_option`, no sorry'd data.

**Padding probe** on scratch copies of the file with one tactic in place of `sorry`, run at this head: `simp` fails ("made no progress"), `rfl` fails (`Nonempty (TauCeti.FormalGroupIso F G)` is not definitionally `F.height p = G.height p`), `infer_instance` fails ("type class instance expected"). No `exact` with one library lemma can close it: `IsSepClosed` occurs in no file of the pinned `TauCeti/RingTheory/FormalGroup/` tree (recursive grep, no match), so the finite-height converse is not a library theorem. The theorem is not padding.

**Pinned declarations the Lean docstring and the README's F1 passage cite**, re-opened at Tau Ceti 2fd255d9:

- `TauCeti.FormalGroupIso` — `RingTheory/FormalGroup/Hom.lean` line 351, a structure on `F G : FormalGroup R`.
- `FormalGroup.height` — `Height/Basic.lean` line 200, valued in `ℕ∞`; `height_eq_top_iff` line 205.
- `TauCeti.FormalGroupIso.height_eq` — `Height/Basic.lean` line 346, over `[Field K]`: the forward direction the docstring attributes to the pin.
- `FormalGroup.height_eq_top_iff_nonempty_formalGroupIso_𝔾ₐ` — `Logarithm/InfiniteHeight.lean` line 278 (module docstring line 57): the infinite-height case over any field of characteristic p, as the docstring says.
- `existsUnique_iso_comp_iterateFrobeniusHom_eq_nsmulHom_of_height_eq`, `heightIdeal_eq_bot_iff_le_height`, `TauCeti.FormalCoordinate.universalStrictCoordinate`, the `Obstruction` and `LeadingDifference` names at README lines 258–268 and 288–299: verified at the pin in r17 and r19; the pin and the README are unchanged.

**Ownership.** `roadmaps grep --fixed 'nonempty_formalGroupIso_iff_height_eq'` (index of 2026-11-07T15:40:27Z) finds the name only in this pull request's README line 274 and Suggested.lean line 56: no other roadmap on main or at an open head declares it. Pull request #1854 (same author) also carries a `TauCetiRoadmap/BordismFormalGroups/` folder, in the older text that cites the Mathlib formal-group pull requests instead of the pinned Tau Ceti tree (`roadmaps show BordismFormalGroups --pr 1854`, lines 15–22): it revises this existing roadmap, so it is not a supplier and not a second owner; which text survives when both merge is a merge-order matter for a human, not a finding on this folder. `overlaps.md` lists #1808 and #1854 as conflicting with #1807 only in other declared folders (AlgebraicCurves, CharacteristicClasses, ClassifyingSpaces, RigidAnalyticGeometry), never in this one.

**Overlap leads.** `overlaps.md` lists GeneralizedCohomology §G2.11, cited at README lines 1896 and 2377 (and 30, 1913–1963, 2296, 2334), as defined only by #1808 and #1854 at their heads. It is also defined at this pull request's own head (`TauCetiRoadmap/GeneralizedCohomology/README.md` at 7e8275c, lines 63, 3077, 3080, 3117, 3120, 3145, 3161, 3386, 3390), the move of F6.5's simplicial foundations into GeneralizedCohomology being one of this pull request's own ownership moves; main (eaf17b1) has no G2.11 (grep count 0). A citation of a section this same pull request creates needs no merge-order clause, so this is not a finding. No id this README cites is dropped by an open pull request; no id this pull request drops is cited elsewhere.

**Cross-roadmap citations.** The worker's `citations.md` for this head lists nothing unresolved (no cross-roadmap citation and no Lean name found nowhere). The resolutions of the previous reports (AlgebraicTopology, GeneralizedCohomology and CharacteristicClasses at this head; CompactGroups, SchurWeyl, ConvexityToric, DGAInfinity, ProfiniteCohomology, TopologicalKTheory, ModularCurves, EllipticCurves on main) carry forward unchanged, the README being unchanged and the diffs of the cited folders since 12e0624 not naming this roadmap.

**Adversarial table.** The folder is unchanged, so every row carries forward from the r19 report (and r17/r16/r14/r9 behind it), each re-stated with its values:

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `nonempty_formalGroupIso_iff_height_eq` (Lean 56–58; README 269–274) | 𝔾ₐ, 𝔾ₘ over 𝔽̄_p; F = G; 𝔾ₘ and its ℤ_p^×-twist over 𝔽_p (r14, carried by r19) | heights ⊤ and 1, no iso (both sides false); F = G: identity series, both sides true; the twist over 𝔽_p has height 1 but no iso over 𝔽_p, so `IsSepClosed` is needed and is present | true as stated | none (r19) |
| Lemma A2.2.7 general form: existence and uniqueness (README 80–87) | f = [p]_𝔾ₘ = X^p over 𝔽_p; f = X^(p²) (r17, carried by r19) | order p, h = 1, twist of 𝔾ₘ is 𝔾ₘ, g = id, unique by `Factorization.lean` 125; order p², h = 2, g = id; h = 1 for X^(p²) fails the order hypothesis, so uniqueness is "once h is fixed by the order" | true as stated | none (r19) |
| Universal strict coordinate and `coordinateChangeLift` (139–146) | coefficients of X², X³; φ = X (r17, carried by r19) | b₁, b₂ (`coeff_succ_universalStrictCoordinate`); linear coefficient 1; (F, X) ↦ the map killing every b_i | true | none (r19) |
| Obstruction in degree p^k and its vanishing below both heights (288–299) | F = G of height 2 over 𝔽₂, f = X + X², k = 1; control 𝔾ₐ vs 𝔾ₘ over 𝔽₂, f = X, k = 1 (r17, carried by r19) | ord([2]_G(f)) = 4 > 2, ord(f([2]_F)) = 4 > 2, degree-2 part 2XY = 0; control: coefficient of X² in X² − 0 is 1, 1·C₂ = XY ≠ 0, so "below both heights" is needed | true, hypothesis present | none (r19) |
| Height definition, `heightIdeal_eq_bot_iff_le_height`, exponent-two statements, mod-2 cocycle diagonal, additive series, universal exponent-two generators, Lazard grading, `lazardGcd` values, invariant differential, log, exp Checks, `log_smul`, Frobenius-twist Checks, n-series laws, prime-series form (README 64–79, 122–132, 150–245, 251–269) | r14 instances (carried by r19) | r14 values | all true (r14) | none |
| Kudo–Borel instance, nilpotent completion, Steenrod Checks, Milnor primitives, MU/MO Hurewicz Checks, π₀MO, Toda brackets, James construction, Serre–Cartan basis, K(n)-local Tate, smooth implies PL (README 335–512, 634–660, 985–1012, 1945–2000, 2109–2111) | r9 instances (carried by r19) | as in r9 | all correct (r9) | none |

**Seeded sample.** "Lazard ring, cocycle lemma and Hopf algebroid", "Invariant differential, logarithm and exponential", "Exponent two", "Height and Lazard's classification", "Steenrod algebras and mod-p Adams towers", "Unoriented coefficients" and "The smoothing-and-triangulation comparison" were verified at their locators in the full review and re-checked where the r14 diff touched them (ravenel-green lines 19937–20817, quillen-fgl-bulletin 72 and 110, hatcher-at 21563–22197, guillou-weibel 748–788, miller-cobordism 1023–1373, GeometricTopology README on main lines 930–943). The folder is unchanged since, so those verifications stand; the README flags no locator as unverified.

**Policy.** The gate's scanners report `prnum=0 round-labels=0 private-paths=0 latex=0 tex=0 set_option=0 sorry-data=0 stray-files=0`; the README and Lean file contain no pull-request number, process word or machine path.

## Not verifiable

- Bousfield (1979) §6 Theorem 6.6, Thom (1954) Chapitre IV, James (1955), Toda (1962), Whitehead (1940), Munkres (1966), Lubin–Tate, Wilson, Johnson–Wilson, Hovey–Strickland, Symonds: uncertified or no open copy in the cache; cited by locator, untouched since the full review.
- Whether TangentialBordism (#942 head) and HomotopySpheres (#1287 head) have repointed to F2, F4 and F6.2: their reviews' business, as in the previous reports.
- Which BordismFormalGroups text survives when both #1807 and #1854 merge: a merge-order decision for a human, outside this folder's review.

## Source issues

- none
