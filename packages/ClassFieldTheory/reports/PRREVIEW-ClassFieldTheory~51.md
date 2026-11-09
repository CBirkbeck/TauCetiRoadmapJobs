# Review of ClassFieldTheory (pull request #1411 at d6e2855)

**Verdict:** needs changes

This is an incremental re-review of 0 changed lines since 5d0d7c6. The one commit since then, d6e2855, touches only `TauCetiRoadmap/IntegralLattices/`. Both P3 findings of the previous review are still open. Neither is in this folder's text: one is in the pull request description, the other is the edit to `Completed/LocalGaloisGroups/Suggested.lean`. Nothing inside `TauCetiRoadmap/ClassFieldTheory/` needs to change.

## R01 (P3) — The merge-order paragraph still names the old theorem `closure_map_artinMap_unitFiltration`

Carried from the previous R01; not repaired.

**Location.** The pull request description, *Merge order*: "this head's definition name `localAbsoluteUpperRamificationGroup` and its theorem names `map_unitFiltration_normResidue` and `closure_map_artinMap_unitFiltration` survive, and #1215's renamed copies are dropped on rebase".

**Claim.** This head declares `map_artinMap_unitFiltration` (`TauCetiRoadmap/ClassFieldTheory/Suggested.lean:540`), and the old name occurs nowhere in the folder. Whoever rebases #617 or #1215 onto this head is told to keep a declaration that does not exist.

**Witness.** `roadmaps grep 'closure_map_artinMap_unitFiltration'` finds the name only in #1215 at b5b3cde, `TauCetiRoadmap/ClassFieldTheory/README.md:302`. That line is a rename row mapping it to `map_artinMap_unitFiltration_eq_upper`, which #1215 declares at `Suggested.lean:131`.

**Repair.** Change the sentence to: "its theorem names `map_unitFiltration_normResidue` and `map_artinMap_unitFiltration` survive, and #1215's copies `normResidue_map_unitFiltration` and `map_artinMap_unitFiltration_eq_upper` are dropped on rebase". Every name in that sentence resolves:
- at this head: `Suggested.lean:503`, `:524` and `:540`;
- in #1215 at b5b3cde: `Suggested.lean:98` and `:131`, and the rename rows at `README.md:301–302`.

## R02 (P3) — The edit to `Completed/LocalGaloisGroups/Suggested.lean` is still outside the folders recorded for this review

Carried from the previous R02; not repaired.

**Location.** `Completed/LocalGaloisGroups/Suggested.lean:326` and `:485`, as changed against main:
- "`⟨ClassFieldTheory.h2MuEquivZMod_mixed p F n hn⟩`"
- "`⟨ClassFieldTheory.h2FpEquivZMod_of_mu p F _ (muNRepIsoTrivialFp p F ζ hζ)⟩`"

**Claim.** The review brief names `IntegralLattices` and `QuadraticFormInvariants` as this pull request's other folders, and not `Completed/LocalGaloisGroups`. The targeted build covers `TauCetiRoadmap.ClassFieldTheory.Suggested` and `TauCetiRoadmap.GlobalQuadraticForms.Suggested`, so it never compiles these two lines. Two things already point the right way:
- the description lists `Completed/LocalGaloisGroups` among the pull request's folders;
- the gate's configured outside-folder allowance covers exactly this file, so the gate does not list it.

What is still missing is the board's folder record that drives this review and the build.

**Witness.** `git diff --stat origin/main...HEAD`, restricted to paths outside the three folders the brief names, prints `Completed/LocalGaloisGroups/Suggested.lean | 4 ++--`. Neither the brief's folder list nor the targeted build names `Completed.LocalGaloisGroups`.

**Repair.** No change inside this folder, and nothing more for the author: the description already declares the folder. Record `Completed/LocalGaloisGroups` as one of this pull request's folders on the board, so that the review brief and the targeted build include it. Keep both lines. They are forced:
- they wrap this head's canonical equivalences in `Nonempty`;
- reverting them would contradict the README's rule against an arbitrary `Nonempty (X ≃ Y)` where a canonical map is required.

The type check of the two lines is under *Verified sound*.

## Previous findings

- R01 — not repaired: the description still says "its theorem names `map_unitFiltration_normResidue` and `closure_map_artinMap_unitFiltration` survive", while `Suggested.lean:540` declares `map_artinMap_unitFiltration`. Carried as R01.
- R02 — not repaired: `Completed/LocalGaloisGroups/Suggested.lean | 4 ++--` is still changed, and the brief's folder list and the targeted build still omit it. The description and the gate allowance now cover it. Carried as R02.

## Verified sound

**Gate, build and order.**
- The worker's gate at this head passes every check, including `build=0` and `outside-folder=0` (`scratch/gate.md`).
- I reran `gate … ClassFieldTheory --base origin/main`. Every check inside the folder is 0. It reports `outside-folder=5`, and all five files belong to the declared sibling folders: `IntegralLattices/{README.md,Suggested.lean}` and `QuadraticFormInvariants/{NativeCompletion.md,README.md,Suggested.lean}`. This is the same as the previous round. `Completed/LocalGaloisGroups/Suggested.lean` is not listed because the configured allowance covers it.
- Dependency check, verbatim: `depcheck: 235 roadmaps, 2268 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- `lake env lean TauCetiRoadmap/ClassFieldTheory/Suggested.lean` exits 0. Its only output is five `declaration uses sorry` warnings, at lines 401, 503, 540, 687 and 697. The file has 53 declarations and one `import Mathlib`, followed by 53 `TauCeti.*` modules.

**Signatures.** I elaborated `#check @` on ten declarations in one scratch file that imports the built module:
- the five sorried theorems: `algebraMap_vle_algebraMap_iff_of_finite_padic`, `map_unitFiltration_normResidue`, `map_artinMap_unitFiltration`, `isPrincipal_map_hilbertClassField` and `relDiscr_eq_finprod_abelianConductor`;
- the two abbreviations flagged as dropping binders: `restrictAbsolute` and `absoluteGaloisGroupExtend`;
- `h2MuEquivZMod_mixed`, `h2FpEquivZMod_of_mu` and `localAbsoluteUpperRamificationGroup`.

Each elaborated type matches `scratch/signatures.md` and the previous report:
- `map_unitFiltration_normResidue` carries `[ValuativeExtension K L]` and `[IsAbelianGalois K L]`.
- `map_artinMap_unitFiltration` has no characteristic hypothesis.
- `restrictAbsolute` and `absoluteGaloisGroupExtend` correctly need only `[Field K] [Field L] [Algebra K L] [Module.Finite K L]`, plus `[IsGalois K L]` for the first.

Four entries of `scratch/signatures.md` are artifacts of the extraction tool, not declarations: `below` (line 70), `argument` (380), `on` (522) and `field` (608). They are words in docstrings, and the four "Unknown identifier" errors at lines 763–797 come from them.

**The two lines in `Completed/LocalGaloisGroups/Suggested.lean`** (R02), checked against the elaborated types at this head:
- `h2MuEquivZMod_mixed p F n hn : H n F 2 (muNRep n F) ≃+ ZMod n`. Wrapped in `⟨_⟩`, this is exactly the stated `Nonempty (ClassFieldTheory.H n F 2 (ClassFieldTheory.muNRep n F) ≃+ ZMod n)`.
- `h2FpEquivZMod_of_mu p F (T : GalRep p F) (e : muNRep p F ≅ T) : H p F 2 T ≃+ ZMod p`. The line passes `_` for `T` and `muNRepIsoTrivialFp p F ζ hζ` (that file's line 412) for `e`, which matches the new argument order. On main the call passed `ζ hζ _ ⟨iso⟩`, for the former `Nonempty`-valued signature.
- I could not build the file (see *Not verifiable*).

**One-tactic probe.** Carried from the previous report: the five sorried statements are byte-identical. There, `first | rfl | (simp; done) | infer_instance | trivial | (simp_all; done) | exact?` failed on all five, so none is padding.

**Seeded sample.** None of the sampled targets lies in changed text, and the README flags no locator as unverified. All 15 "Exit criterion" paragraphs are unchanged: README 678, 754, 806, 852, 910, 1222, 1331, 1603, 1696, 1773, 1966, 2027, 2142, 2319 and 2394. I spot-checked four sampled targets that the previous round did not read:
- *Global Herbrand quotients and fixed points* (README 1843), cited as milne-cft VII, Proposition 2.7, Proposition 3.1 and Lemmas 4.1–4.2. All four are where cited:
  - Proposition 2.7: `h(I_{L,T}) = ∏_{v∈S} n_v` for cyclic `L/K` (milne-cft line 9379).
  - Proposition 3.1: `n·h(U(T)) = ∏ n_v` (line 9470).
  - Lemma 4.1: `C_K ≃ C_L^G` (line 9574).
  - Lemma 4.2: `I_K = K^× I_S` once `S` contains generators of the class group (line 9583).
  - They lie on PDF pages 215–219.
  - The README's three calculations (S-ideles, S-units, S-class group) and the hypotheses on `S` match.
- *Local duality and the Euler characteristic* (README 1174), cited as milne-adt I, Theorem 2.8. The theorem is at milne-adt line 1227, and it gives `χ(G,M) = (R : mR)⁻¹`. This is the README's `#H¹ = #H⁰ · #H² · p^{[F:ℚ_p] v_p(#A)}`, since `(𝒪_F : m𝒪_F) = p^{[F:ℚ_p] v_p(m)}`.
- *The absolute upper ramification groups* (README 1446), cited as milne-cft I §4, the definition after Proposition 4.4, p. 46:
  - Proposition 4.4 and the filtration `σ ∈ G^v ⇔ σ|_L ∈ Gal(L/K)^v` for every finite Galois `L` are at milne-cft lines 2410–2419.
  - That text is on PDF page 55, which is printed page 46; the next page is headed 47.
- *The Kummer class* (README 961). It has no source locator, only Tau Ceti names, and every one resolves at the pin:
  - `MuNRep.lean`: `kummerEquiv_ofMul_mk` (line 288), `kummerClass_mul` (313), `kummerEquivOfCharZero` (358) and `kummerEquivOfCharZero_ofMul_mk` (371);
  - `LocalField/PowerSubgroup/Basic.lean`: `card_powerClasses` (line 288);
  - `Brauer/Invariant.lean`: `invMap_brCor` (line 334);
  - `Local/Duality/Basic.lean`: `tateDualMap_exact` (line 363).

**Sibling folder changed since 5d0d7c6.** The `IntegralLattices` diff mentions this roadmap only in unchanged context rows (diff lines 32 and 204). Those rows cite Tau Ceti's `TauCeti.ClassFieldTheory.hilbertProductFormula` directly, which is at `Global/Hilbert/Reciprocity.lean:65` at the pin. This roadmap re-exports it at `Suggested.lean:754`.

**Citations and overlaps.**
- `scratch/citations.md` lists 13 Lean names found nowhere. Ten are the "Former label" column of the rename table (README 203–212), and their absence is by design.
- The other three resolve on main at 3090489:
  - `ProfiniteCohomology.cd_p_le_scd_p`, at `TauCetiRoadmap/ProfiniteCohomology/Suggested.lean:3069`;
  - `ProfiniteCohomology.cd_p_le_of_isClosed`, at `:3126`;
  - `ProfiniteProPGroups.cd_p_eq_of_isProPSylow`, at `Completed/ProfiniteProPGroups/Suggested.lean:3758`.
- Overlaps (`scratch/overlaps.md`, checked against the index):
  - #617 (at b22a824) and #1215 (at b5b3cde) change this roadmap and conflict with this head. The description states the rebase order; its one stale name is R01.
  - #1215 also defines `localAbsoluteUpperRamificationGroup` (its `Suggested.lean:113`). That is the same roadmap amended twice, and the same rebase order settles it; it is not a second owner.
  - No id this README cites is dropped by an open pull request or defined only by an open revision. This pull request drops no id that other roadmaps cite.

**Adversarial pass.** No statement changed. Rows 1–31 are carried from the previous report (r47). That report carried rows 1–28 from r44 and r40, and computed rows 29–31. Rows 32–34 are new: I computed them here for the sampled targets I spot-checked.

| # | Statement | Instance | Left side / right side | Result |
|---|---|---|---|---|
| 1 | `map_artinMap_unitFiltration` (r47) | `K = ℚ_p`, `n = 0` | `Art(ℤ_pˣ)` = inertia of `ℚ_p^ab/ℚ_p` / image of `G_K^0` = image of inertia | holds |
| 2 | same (r47) | `ℚ_3`, `n = 1`, level `ℚ_3(ζ_9)` | `{1, 7, 4}` / `G^1 = {a ≡ 1 mod 3} = {1, 4, 7}` | holds |
| 3 | same, wrong model `U^n ↔ G^(n−1)` (r47) | as row 2 | order `3` / `G^0 = (ℤ/9)ˣ`, order `6` | shift excluded |
| 4 | same (r47) | `ℚ_2(ζ_8)`, `n = 2, 3` | `{1, 5}` / `{1, 5}`; `{1}` / `1` | holds |
| 5 | same, equal characteristic (r47) | `𝔽_p((t))`, `y^p − y = t⁻¹`, `n = 1, 2` | `ℤ/p` / `G^1 = G`; `1` / `1` | holds |
| 6 | same, closure (r47) | every `n` | LHS compact, `artinMap` continuous, `G_K^ab` T2, so LHS is closed | holds |
| 7 | same, normalization `Art⁻¹` (r47) | — | images of subgroups agree under `Art` and `Art⁻¹`; sign pinned by `unramifiedCoordinate_artinMap` | no change needed |
| 8 | depth-0, wrong model `G_K^0 = G_K` (r47) | `n = 0` | `unramifiedCoordinate(Art π)` = `zHat.gen` ≠ identity | excluded |
| 9 | Layer 5 nondegeneracy (r47) | `ℚ_7`, `n = 3`, `b = 7`, `a = 2`; `b = 8` | `2^2 = 4 ≢ 1 mod 7`, so `(2,7) ≠ 0`; `8 = 2³` pairs to zero | holds both ways |
| 9b | same (r47) | `ℚ_2`, `n = 2`, `b = 5`; `b = 17` | `(2,5)_2 = −1`; `17` is a square | holds |
| 9c | perfectness (r47) | `ℚ_7`, `n = 3` | `#ℚ_7ˣ/(ℚ_7ˣ)³ = 9` on both sides | perfect |
| 10 | `algebraMap_vle_algebraMap_iff_of_finite_padic` (r47) | `ℚ_2(i)`, `(2,1)`, `(1,2)` | true, false / true, false | holds |
| 11 | `map_unitFiltration_normResidue` (r47) | `L = K`; `ℚ_2(√2)`, `n = 2, 3` | `{1}/{1}`; `G/G`, `1/1` | holds |
| 12 | same (r47) | `ℚ_p(ζ_p)`, `n = 0, 1`; unramified | `G/G`, `1/1`; `1/1` | holds |
| 13 | same, lower numbering (r47) | `ℚ_2(ζ_8)`, depth 3 | `{1}` / `G_3 = ⟨σ_5⟩`, `G^3 = 1` | upper numbering right |
| 14 | same, non-abelian (r47) | `ℚ_2(∛2, ζ_3)`, `S_3` | `U^(0) ⊆ N` / `#G_0 = 3` | `IsAbelianGalois` needed |
| 15 | `localAbsoluteUpperRamificationGroup` (r47) | `u = −1`; `u ∈ (−1, 0]` | `G_K`; trivial restriction vs `G_K ↠ ℤ/f` | ceiling right |
| 16 | `isPrincipal_map_hilbertClassField` (r47) | `ℚ(√−5)`, `I = (2, 1+√−5)`, `H = K(i)` | `(I𝒪_H)² = (2) = ((1+i)²)` | holds |
| 17 | `relDiscr_eq_finprod_abelianConductor` (r47) | `ℚ(i)`; `ℚ(ζ_5)` | `(4) = (1)(4)`; `(5³)` = product vs `(5)` for lcm | product right |
| 18 | `eulerCharacteristic_finrank_fp` (r47) | `ℚ_p` odd; `ℚ_2` | `2 = 1+0+1`; `3 = 1+1+1` | holds |
| 19 | Layer 5 duality Check (r47) | `ℚ_2`, `μ_3`, `ℤ/3` | `(1,3,3)`, `(3,1,3)` | holds |
| 20 | `scd_p_absoluteGaloisGroup_eq_two` (r47) | `ℓ = p`, `ℓ ≠ p` | `2 / 2` | holds |
| 21 | `cyclotomicCharacter_artinMap_padic` (r47) | `p = 2`, `u = −3`, `μ_16` | `(−3)⁻¹ ≡ 5`, not `13` | sign pinned |
| 22 | `hilbertProductFormula` (r47) | `ℚ`: `(−1,−1)`, `(3,7)`, `(5,5)` | sums `0, 0, 0` | holds |
| 23 | `cyclicHasseNorm` (r47) | `ℚ(√13, √17)`, `x = 25` | local norm everywhere, not global | cyclic needed |
| 24 | `card_ideleClassNormQuotient` (r47) | `ℚ(i)/ℚ`; `L = K` | `2/2`; `1/1` | holds |
| 25 | Layer 7 conductor formula (r47) | `ℚ_2(√2)`, `ℚ_p(ζ_p)`, unramified | `3`, `1`, `0` | holds |
| 26 | Layer 12 Kummer degree (r47) | `ℚ`, `p = 2`, `S = {2}`; `ℚ(ζ_3)`, `p = 3` | `4 = 2²`; `9 = 3²` | holds |
| 27 | Layer 6 Frobenius (r47) | `ℚ_2(ζ_5)/ℚ_2` | `Art(2)(ζ_5) = ζ_5²`, not `ζ_5³` | holds |
| 28 | Layer 5 coordinate sign (r47) | `ℚ_7`, `n = 3` | `1` / negated `2` | holds |
| 29 | `relDiscr_eq_finprod_abelianConductor` (r47) | `ℚ(ζ_8)/ℚ` | conductors `1, 4, 8, 8`; product `2⁸` / `disc ℚ(ζ_8) = 2⁸`; lcm model gives `8` | product, not lcm |
| 30 | `isPrincipal_map_hilbertClassField` (r47) | `ℚ(√−6)`, `𝔭 = (2, √−6)`, `H = K(√2)` | `a² + 6b² = 2` unsolvable / `(𝔭𝒪_H)² = (2) = (√2)²`, so `𝔭𝒪_H = (√2)` | holds |
| 31 | `h2FpEquivZMod_of_mu`, hypothesis `e : μ_p ≅ T` (r47) | `ℚ_3(ζ_3)`, `T = 𝔽_3`; `T = 0`; `ℚ_3`, `T = 𝔽_3` | `3` / `3`; `1 ≠ 3`; `1 ≠ 3` | hypothesis needed |
| 32 | Global Herbrand quotient, `h_G(C_L) = [L:K]` (README 1843) | `L = ℚ(i)`, `K = ℚ`, `S = {∞, 2}`, `T` above `S` | `h(I_{L,T}) = n_∞·n_2 = 2·2 = 4`. For `U_T = μ_4 × (1+i)^ℤ`: `U^G = {±2^m}` and `N(U_T) = 2^ℤ` give `#Ĥ⁰ = 2`; `ker N = μ_4 = I_G U_T` gives `#Ĥ⁻¹ = 1`; so `h(U_T) = 2 = 4/2`. `h_L = 1` gives `Cl_{L,T} = 1`, so `h(C_L) = 4/2 = 2 = [L:K]` | holds; matches milne-cft VII 2.7 and 3.1 |
| 33 | Euler characteristic, cardinality form (README 1174) | `F = ℚ_2`, `A = ℤ/2`; `F = ℚ_3`, `A = ℤ/2` | `#H¹ = #ℚ_2ˣ/(ℚ_2ˣ)² = 8` / `#H⁰·#H²·2^{1·1} = 2·2·2 = 8`. `#ℚ_3ˣ/(ℚ_3ˣ)² = 4` / `2·2·3⁰ = 4`. The wrong exponent `v_p(#A)` without `[F:ℚ_p]` over `ℚ_2(i)` gives `2·2·2 = 8` against `#ℚ_2(i)ˣ/(ℚ_2(i)ˣ)² = 2^(2+2) = 16 = 2·2·2²` | holds; the degree factor is needed |
| 34 | `localAbsoluteUpperRamificationGroup` against milne-cft I 4.4 (README 1446) | `K = ℚ_3`, `u = 1`, levels `M = ℚ_3(ζ_9)`, `ℚ_3(ζ_27)` | `σ` with cyclotomic coordinate `4`: in `Gal(ℚ_3(ζ_9)/ℚ_3)^1 = {1,4,7}` / in `Gal(ℚ_3(ζ_27)/ℚ_3)^1 = {a ≡ 1 mod 3}`. Both levels agree, as Proposition 4.4 requires for the intersection to be compatible | holds |

## Not verifiable

- serre-local-fields (uncertified, paywalled), XV §2 Theorem 2 and Corollary 3 to Theorem 1: the locator of both unit-filtration statements. Earlier rounds checked the statements mathematically (rows 1–6 and 11–14) and against milne-cft I 1.11.
- Whether `Completed/LocalGaloisGroups/Suggested.lean` builds at this head. It imports `Completed.ProfiniteProPGroups.Suggested` and `Completed.LocalFieldsRamification.Suggested`, which have no build output in this worktree, and the commands allowed here do not build them. The two changed lines were checked against the elaborated types instead (above; R02).
- Ownership against open pull requests was checked with `roadmaps grep` and `roadmaps overlaps` across all open heads (above). The files of #1410 and #1474, which the description names as consumers, are not among those this review was given; I read them only through `roadmaps grep`.

## Source issues

- none
