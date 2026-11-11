# Review of PurityOfBranchLocus (pull request #1807 at 2faed4d)

**Verdict:** needs changes

## R01 (P3) — The description leaves most of this folder's revision unstated

**Location:** pull request description, bullet "Targets retired to the pinned libraries": "the regular-local-ring chain (global dimension, Auslander–Buchsbaum, Serre's theorem, Stacks 0AFS) that PurityOfBranchLocus §0.3 planned is at the pins, mostly in Tau Ceti; PurityOfBranchLocus maps each former §0.3 target to its declaration".

**Claim:** This is the only sentence about this folder's content, and it covers §0.3 only. The description does not state three other changes this pull request makes to the folder:
- it removes the rest of Layers 0 and 1;
- it drops three supplier roadmaps;
- it removes 20 `Suggested.lean` declarations and adds a headline.

None of DerivedModuleAlgebra, SchemeAndStackFoundations, ModularCurves, §0.4, §1.1 or `etale_of_etaleAt_codimOne` occurs in the description.

**Witness:** At this head, README 82–88 also retire §§0.1, 0.2, 0.4 and 1.1. Main's README 32–34, 87 and 91 consume SchemeAndStackFoundations §§0.17 and 4.13, DerivedModuleAlgebra §0.K.1 and ModularCurves §4D. None of these appears at this head (grep exit 1).

**Repair:** Add to the description: "**PurityOfBranchLocus** keeps one layer, Layer 2 (§§2.1–2.3), under its old number.
- Layers 0 and 1 (§§0.1–0.4, 1.1) are now at the Tau Ceti pin, and so are the two auxiliary targets of §2.3: equality of local dimensions and equality of the ramification and non-étale loci. Two tables in Scope and ownership map each former section and target to its declaration.
- It no longer consumes SchemeAndStackFoundations §§0.17 and 4.13, DerivedModuleAlgebra §0.K.1 or ModularCurves §4D. LocalPurity §2.1 is now its only roadmap supplier.
- Its Suggested.lean drops 20 declarations: the 18 of the former Layer 0 (stalk forms, the three loci and their API, global dimension, Serre's criterion, 0AFS) and the two auxiliary results of §2.3. It adds the §2.2 global corollary `etale_of_etaleAt_codimOne`."

## Previous findings

- None. The previous review (r59, at 8d98b44) raised no finding, so there is nothing to account for.

## Verified sound

**What changed.** Since 8d98b44 the folder gained 51 lines, in two new files: `PROGRESS.md` and `STATUS.md`.
- Both are byte-identical to `origin/main` (`git diff --quiet origin/main HEAD` exits 0). They arrived with the merge of main, so they are outside this pull request's diff against its base.
- The root README's section "Generated status files" says both files are written by machine.
- `README.md`, `Suggested.lean` and `metadata.toml` are unchanged since 8d98b44 (exit 0), and so are the pins.

**Adversarial table.** No statement changed. The rows below are for the statements the new STATUS.md cites. Throughout, `k` is a field with `2 ≠ 0`; `A = k[u,w]`; `B = A[v]/(v² − uw)`, a normal A₁ singularity, free of rank 2 over `A`; and `f : Spec B → Spec A`.

| Statement | Instances tried | Values on each side | Result |
|---|---|---|---|
| §2.2 `etale_of_etaleAt_codimOne`, line 92 | `f`; `Spec ℤ[ω] → Spec ℤ` with `ω²+ω+1 = 0`; `(x,y) ↦ (x²,y)` on `𝔾_m²` | `f`: `Ω_𝔭 = B_𝔭/(2v) ≠ 0` at `𝔭 = (u,v)`, and the fibre over 0 is `k[v]/(v²)`: false ⇔ false. `ℤ[ω]`: `(2ω+1)² = −3`, so ramified at `(1−ω)`: false ⇔ false. `𝔾_m²`: `Ω = 0` since `2x` is a unit: true ⇔ true | sound |
| §2.3 ramification locus, line 106 | `f`; the same cover in characteristic 2 | `R = V(2v) = V(u,v) ∪ V(w,v)`. Its maximal points have height 1, since `B/(u,v) ≅ k[w]` and `dim B = 2`. The origin has dimension 2 and is excluded by hmax. In characteristic 2, `Ω = B·dv` is free, so `R = univ` and hne fails | sound |
| §2.3 branch locus, line 119 | `f` | `f(R) = V(u) ∪ V(w)`. At `η_{V(u)}` and `η_{V(w)}`, `dim 𝒪 = 1`. The origin has dimension 2 and is excluded by hmax | sound |
| §2.1 stalk form, line 40, at the origin of `Spec B` | `f` | Dimensions `2 = 2 ≥ 1`. The stalk is normal and the target regular. hunr fails at `η_{V(u,v)}`, which matches the fact that `f` is not étale at the origin | sound |
| Tau Ceti `ramificationLocus_eq_nonEtaleLocus` (README 22–24) | `f`; Frobenius `t ↦ tᵖ` on `𝔸¹_{𝔽_p}` | `f` is flat, so non-étale = `R` = `V(u,v) ∪ V(w,v)`. Frobenius: `Ω = k[t]dt` and the map is flat, so `univ = univ` | sound |

The other rows stand as in the previous review, of 8d98b44.

**Counts.**
- **Gate.** The worker's gate passes every check. My own run shows 0 for every check except `outside-folder=24`. Those 24 files are the README and Suggested.lean of the 12 other folders this pull request owns. The brief's `diff --stat`, excluding all 13 folders, is empty.
- **Dependency check.** Output: `depcheck: 237 roadmaps, 2140 edges, 0 problem(s)`. There is no UPWARD or CYCLE line.
- **Elaboration.** `lake env lean` on Suggested.lean exits 0. Its only output is six `sorry` warnings, at lines 40, 58, 75, 92, 106 and 119.
- **Binders.** I ran `#check @` on all six declarations; every elaborated binder matches the README, and none was lost.
- **Padding.** No statement changed and the pins have not moved, so the previous padding probe stands.
- **Library declarations opened at the pin (Tau Ceti `2fd255d`):**
  - `RamificationLocus.lean:197`
  - `LocallyQuasiFinite.lean:142`
  - `RegularLocalRing/Purity.lean:88`
  - `FiniteEtale/PuncturedSpectrum.lean:63`
  - LocalPurity `Suggested.lean:45`, matching README 266–270
- **Citations resolved (6).** Outgoing: LocalPurity §2.1, at its README 695. Incoming, all resolving through README 82–116:
  - AbhyankarLemma 31, 363 and 375 (§0.3, 0AFS);
  - ArtinAlgebras 72–73, 218–220 and 1077, which cite `TauCetiRoadmap.PurityOfBranchLocus.globalDimension`, `globalDimension_le_iff` and `globalDimension_le_iff_hasProjectiveDimensionLE`;
  - LocalPurity 863.

  `overlaps.md` reports no dropped id in either direction.
- **Seeded sample (3 locators).** I re-read each one; the README text is unchanged.
  - `stacks-0BMB` lines 2524–2533 (p. 54) give the five hypotheses of 0BMB.
  - `sga1` lines 8355–8364 (printed p. 212) give Théorème 3.1, with the clause `Z ≠ X`.
- **Remarks, no change requested.**
  - DerivedModuleAlgebra on main (README 2818–2820) still names PurityOfBranchLocus as a consumer of §0.K.1.
  - STATUS.md's coverage block cites main's README (its sha256 is `30f3519…`) and Tau Ceti declarations newer than the pin.

## Not verifiable

- Zariski (1958) and Nagata (1959) are cited only as the origin of the theorem, with no locator, so I did not open them.

## Source issues

- none
