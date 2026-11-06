# Review of BordismFormalGroups (pull request #1807 at e752fe8)

**Verdict:** accepted

Incremental re-review of 0 changed lines since b0ef636: the folder `TauCetiRoadmap/BordismFormalGroups/` is byte-identical to the head the previous review accepted (`git diff --stat b0ef636..HEAD` lists only `TauCetiRoadmap/ClassifyingSpaces/README.md` and `Suggested.lean`, one of the fourteen folders the pull request declares). The one commit since then touches ClassifyingSpaces only; the BordismFormalGroups README does not cite ClassifyingSpaces, and the ClassifyingSpaces diff does not name BordismFormalGroups, so nothing this roadmap relies on changed. The gate passes every rule, the dependency check prints no UPWARD or CYCLE line, `Suggested.lean` elaborates at the pin with only its `sorry` warning, and the padding probe fails on the one theorem. No finding remains, new or carried.

## Previous findings

The previous report (r16, at b0ef636) recorded no finding: its verdict was accepted with R01–R03 of r14 marked repaired. None is carried forward.

- (r16 carried none) — nothing to account for; the r14 repairs R01–R03 were verified repaired at b0ef636 and the folder is unchanged since.

## Verified sound

**Change outside the folder.** `git diff --stat origin/main...HEAD` restricted to paths outside the fourteen declared folders prints nothing (exit 0, empty). The diff of this folder since b0ef636 is empty, as `changes.md` says.

**Gate.** The worker's gate at e752fe8 (`gate.md`): every counter 0, `build=0`, `OK`. Re-run by me with `--base origin/main --order board/merge-order/ORDER.txt`: every rule 0 except `outside-folder=17`, whose listed files are all inside the pull request's own declared folders (AlgebraicCurves, AlgebraicTopology, CharacteristicClasses, ClassifyingSpaces, ComplexKahlerGeometry, GeneralizedCohomology, LocalPurity, PadicFunctionalAnalysis, …), which this brief names as the pull request's own; so that line is not a finding.

**Dependency check**, re-run on this head:

```
depcheck: 240 roadmaps, 2354 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line for BordismFormalGroups.

**Elaboration.** `lake env lean TauCetiRoadmap/BordismFormalGroups/Suggested.lean` at the pins (Mathlib 1b1ccf4b, Tau Ceti 2fd255d9): exit 0, the single warning `56:8 declaration uses 'sorry'`. The elaborated signature (worker's `signatures.md`) is `∀ {k} [Field k] [IsSepClosed k] (p) [Fact p.Prime] [CharP k p] (F G : FormalGroup k) [F.IsComm] [G.IsComm], Nonempty (TauCeti.FormalGroupIso F G) ↔ F.height p = G.height p`; README lines 269–274 state the same hypotheses (separably closed field of characteristic p, commutative one-dimensional formal groups) and the same conclusion, the infinite-height class included. All binders are the declaration's own; none is a dropped section variable. The worker's extraction again lists two spurious entries (`,` and `and`) parsed from the module docstring; the file declares exactly one theorem. Form: `module` / `public import Mathlib` plus two `TauCeti.*` modules that exist at the pin, `@[expose] public section`, one module docstring naming the non-statable headlines and what each lacks, `theorem` not `lemma`, no `set_option`, no sorry'd data.

**Padding probe** on scratch copies of the file (one tactic in place of `sorry`): `simp` fails ("made no progress"), `rfl` fails (sides not definitionally equal), `infer_instance` fails (not a class). The theorem is not padding.

**Pinned declarations the Lean docstring and the README's F1 passage cite**, opened at Tau Ceti 2fd255d9:

- `TauCeti.FormalGroupIso` — `RingTheory/FormalGroup/Hom.lean` line 351, a structure on `F G : FormalGroup R`.
- `FormalGroup.height` — `Height/Basic.lean` line 200, valued in `ℕ∞`; `height_eq_top_iff` line 205.
- `TauCeti.FormalGroupIso.height_eq` — `Height/Basic.lean` line 346: over `[Field K]`, an isomorphism `e : FormalGroupIso F G` gives `F.height p = G.height p` for every `p` (via `FormalGroupHom.height_eq`, line 316, for a nonzero homomorphism). This is the forward direction the docstring attributes to the pin.
- `FormalGroup.height_eq_top_iff_nonempty_formalGroupIso_𝔾ₐ` — `Logarithm/InfiniteHeight.lean` line 278: under `[Field K] [Fact p.Prime] [CharP K p] [F.IsComm]`, `F.height p = ⊤ ↔ Nonempty (TauCeti.FormalGroupIso F 𝔾ₐ)`. This is the infinite-height case the docstring attributes to the pin, over any field of characteristic p (no separable closure needed there, as the docstring says).
- `existsUnique_iso_comp_iterateFrobeniusHom_eq_nsmulHom_of_height_eq` — `Frobenius/Factorization.lean` line 180; `heightIdeal_eq_bot_iff_le_height` — `Height/Ideal.lean` line 218 (`F.heightIdeal p n = ⊥ ↔ n ≤ F.height p`). Both cited at README lines 262–267 for what they state.

**Ownership.** `roadmaps grep` over the 457 open heads and main (index of 2026-11-06) finds `nonempty_formalGroupIso_iff_height_eq` only in this pull request's folder; no other roadmap's `Suggested.lean` states Lazard's height classification. Pull request #1854 (same author) also carries a `TauCetiRoadmap/BordismFormalGroups/` folder: it revises this existing roadmap, so it is not a supplier and not a second owner; its relation to #1807 is a merge-order matter for a human, not a finding here.

**Cross-roadmap citations.** The worker's `citations.md` for this head lists nothing unresolved; the resolutions of the previous reports (AlgebraicTopology, GeneralizedCohomology and CharacteristicClasses at this head; CompactGroups, SchurWeyl, ConvexityToric, DGAInfinity, ProfiniteCohomology, TopologicalKTheory, ModularCurves, EllipticCurves on main) carry forward unchanged, the README being unchanged.

**Adversarial table.** The folder is unchanged, so every row carries forward from the r16 report (and r14/r9 behind it), each re-stated with its values:

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `nonempty_formalGroupIso_iff_height_eq` (Lean 56–58; README 269–274) | 𝔾ₐ, 𝔾ₘ over 𝔽̄_p; F = G; 𝔾ₘ and its ℤ_p^×-twist over 𝔽_p (r14) | heights ⊤ and 1, no iso (both sides false); F = G: identity series, both sides true; the twist over 𝔽_p has height 1 but no iso over 𝔽_p, so `IsSepClosed` is needed and is present | true as stated | none (r16) |
| Lemma A2.2.7 general form: existence and uniqueness (README 80–87) | f = [p]_𝔾ₘ = X^p over 𝔽_p; f = X^(p²) | order p, h = 1, twist of 𝔾ₘ is 𝔾ₘ, g = id, unique by `Factorization.lean` 125; order p², h = 2, g = id; h = 1 for X^(p²) fails the order hypothesis, so uniqueness is "once h is fixed by the order" | true as stated | none (r16) |
| Universal strict coordinate and `coordinateChangeLift` (139–146) | coefficients of X², X³; φ = X | b₁, b₂ (`coeff_succ_universalStrictCoordinate`); linear coefficient 1; (F, X) ↦ the map killing every b_i | true | none (r16) |
| Obstruction in degree p^k and its vanishing below both heights (288–299) | F = G of height 2 over 𝔽₂, f = X + X², k = 1; control 𝔾ₐ vs 𝔾ₘ over 𝔽₂, f = X, k = 1 | ord([2]_G(f)) = 4 > 2, ord(f([2]_F)) = 4 > 2, degree-2 part 2XY = 0; control: coefficient of X² in X² − 0 is 1, 1·C₂ = XY ≠ 0, so "below both heights" is needed | true, hypothesis present | none (r16) |
| Height definition, `heightIdeal_eq_bot_iff_le_height`, exponent-two statements, mod-2 cocycle diagonal, additive series, universal exponent-two generators, Lazard grading, `lazardGcd` values, invariant differential, log, exp Checks, `log_smul`, Frobenius-twist Checks, n-series laws, prime-series form (README 64–79, 122–132, 150–245, 251–269) | r14 instances | r14 values | all true (r14) | none |
| Kudo–Borel instance, nilpotent completion, Steenrod Checks, Milnor primitives, MU/MO Hurewicz Checks, π₀MO, Toda brackets, James construction, Serre–Cartan basis, K(n)-local Tate, smooth implies PL (README 335–512, 634–660, 985–1012, 1945–2000, 2109–2111) | r9 instances | as in r9 | all correct (r9) | none |

**Seeded sample.** "Lazard ring, cocycle lemma and Hopf algebroid", "Invariant differential, logarithm and exponential", "Exponent two", "Height and Lazard's classification", "Steenrod algebras and mod-p Adams towers", "Unoriented coefficients" and "The smoothing-and-triangulation comparison" were verified at their locators in the full review and re-checked where the r14 diff touched them (ravenel-green lines 19937–20817, quillen-fgl-bulletin 72 and 110, hatcher-at 21563–22197, guillou-weibel 748–788, miller-cobordism 1023–1373, GeometricTopology README on main lines 930–943). The folder is unchanged since, so those verifications stand; the README flags no locator as unverified.

**Policy.** The gate's scanners report `prnum=0 round-labels=0 private-paths=0 latex=0 tex=0 set_option=0 sorry-data=0 stray-files=0`; the README and Lean file contain no pull-request number, process word or machine path.

## Not verifiable

- Bousfield (1979) §6 Theorem 6.6, Thom (1954) Chapitre IV, James (1955), Toda (1962), Whitehead (1940), Munkres (1966), Lubin–Tate, Wilson, Johnson–Wilson, Hovey–Strickland, Symonds: uncertified or no open copy in the cache; cited by locator, untouched since the full review.
- Whether TangentialBordism (#942 head) and HomotopySpheres (#1287 head) have repointed to F2, F4 and F6.2: their reviews' business, as in the previous reports.

## Source issues

- none
