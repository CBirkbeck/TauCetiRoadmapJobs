# Review of ClassFieldTheory (pull request #617 at cca39ab)

**Verdict:** needs changes

This is an incremental re-review of the 17 lines of `TauCetiRoadmap/ClassFieldTheory/README.md` that changed since ff2b587: the §3 Layer 0 row and the Nakayama–Rim kernel sentence of Layer 0, lines 326–335. `Suggested.lean` is byte-identical to ff2b587.

The rewrite repairs the previous R03 and introduces no new defect: the route it describes is the route the pinned proof takes, and both new names resolve at the pin. The two P3 findings outside the folder's text are still open, so they are carried as R01 and R02.

## R01 (P3) — The push gate still fails on files outside the pull request's declared folders

Carries the previous R01.

**Location.** `git diff --stat origin/main...HEAD` lists five files outside `TauCetiRoadmap/{ClassFieldTheory, IntegralLattices, QuadraticFormInvariants}`:
- `Completed/LocalFieldsRamification/COMPLETION.md`, `README.md` and `Suggested.lean`;
- `Completed/LocalGaloisGroups/README.md` and `Suggested.lean`.

**Claim.** The gate fails on `outside-folder`, and no acceptance is possible while it fails. The title, "fix(LocalFieldsRamification): …", makes that roadmap the pull request's subject, but the brief names only the three `TauCetiRoadmap/` folders as the pull request's own.

**Witness.** gate.md: "outside-folder=4 … FAIL", listing `Completed/LocalFieldsRamification/{COMPLETION.md, README.md, Suggested.lean}` and `Completed/LocalGaloisGroups/README.md`. My re-run gives `outside-folder=9`: those four plus five files of the two sibling folders.

**Repair.** A human decides whether the `Completed/` edits belong to this pull request:
- if they do, the board lists those folders as the pull request's own, and the gate passes;
- if they do not, they move to a separate pull request that merges together with this one.

Nothing in `TauCetiRoadmap/ClassFieldTheory/` changes. Test: the gate's `outside-folder` count is `0` for files outside the declared folders.

## R02 (P3) — The merge order against #1215 and #1411 is still not stated in this pull request

Carries the previous R02.

**Location.** The pull request's description. Its only merge-order sentence is still "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1410".

**Claim.** Two open pull requests change this folder, and both conflict with this head (overlaps.md). They state shared targets differently.
- #1215, now at head `b5b3cde`:
  - states `cyclotomicCharacter_artinMap` with `sorry` (its `Suggested.lean` line 82), where this head proves it (lines 271–283);
  - has `count_relDiscr_eq_finsum_abelianConductor_exponent` (157) and `abelianConductor_eq_lcm` (171), where this head has `relDiscr_eq_finprod_abelianConductor` (358);
  - writes its own Nakayama–Rim prose (its README lines 799–832).
- #1411, a draft still at head `d6e2855`:
  - declares `TauCetiRoadmap.ClassFieldTheory.TateCohomology.projective_ker_of_isZero_res` (its `Suggested.lean` line 195). This head retires that alias (README line 1478).
  - its Layer 0 prose (its README lines 636–660) differs from the paragraph this head has just rewritten.

#1411's description states a rule: "whichever of the three merges first, the other two are rebased onto it". Neither #617's description nor #1215's says anything about the order.

**Witness.** overlaps.md: "#617 and #1215 conflict in … `TauCetiRoadmap/ClassFieldTheory/README.md`, `TauCetiRoadmap/ClassFieldTheory/Suggested.lean`", and the same for #1411. I read both heads with `roadmaps show ClassFieldTheory --pr N`.

**Repair.** In this description's merge-order paragraph:
- name #1215 and #1411, and say which of the three merges first (or adopt #1411's rule explicitly);
- say which statement survives the rebase: the proved `cyclotomicCharacter_artinMap`, the retired alias, and the Layer 0 paragraph of lines 313–335.

Test: the description names both pull requests and the order.

## Previous findings

- R01 — not repaired: the gate still lists `Completed/LocalFieldsRamification/{COMPLETION.md, README.md, Suggested.lean}` and `Completed/LocalGaloisGroups/README.md` under `outside-folder`. Carried as R01.
- R02 — not repaired: the description still names only #1410. #1215 (`b5b3cde`) and #1411 (`d6e2855`) still conflict with this head. Carried as R02.
- R03 — repaired: lines 326–333 now say "Let `F` be the free `k[G]`-module on the elements of `A` and `R` the kernel…". `R` is cohomologically trivial by the long exact sequence, free over `k`, and Schanuel's lemma is named. "Projective cover" no longer appears.

## Verified sound

**Gate, dependency check, elaboration.**
- I re-ran the gate with `--base origin/main`. Every check reads `0` except `outside-folder=9 … FAIL`:
  - four of the nine files are the `Completed/` files of R01;
  - the other five belong to `IntegralLattices` (`README.md`, `Suggested.lean`) and `QuadraticFormInvariants` (`NativeCompletion.md`, `README.md`, `Suggested.lean`), which the brief names as the pull request's own.
  - The worker's gate reports `build=0`.
- Dependency check, with `--movable`: `depcheck: 235 roadmaps, 2265 edges, 0 problem(s)`. It prints no UPWARD, CYCLE or `moved:` line.
- `lake env lean TauCetiRoadmap/ClassFieldTheory/Suggested.lean` exits 0. It gives three `declaration uses 'sorry'` warnings, at lines 159, 349 and 358, and nothing else, the same as at ff2b587.
- `git diff --quiet ff2b587 HEAD -- …/Suggested.lean` succeeds, so the file is unchanged. The previous `#check @` comparison of its 35 declarations, and the one-tactic padding probe (`exact?` fails on all three open targets), therefore still hold.

**The changed passage, checked against the pinned proof.** I elaborated every name the rewritten sentence and the §3 row use, in one scratch file importing `Mathlib` and six `TauCeti.*` modules. It elaborated without error.

| Name | File and line at the pin | Elaborated hypotheses and conclusion |
|---|---|---|
| `LinearMap.projective_ker_of_projective_ker` (new in the §3 row) | Tau Ceti `Algebra/Module/Projective/Schanuel.lean:190` | `[Semiring R]`; `P`, `Q` projective; `f : P → M`, `g : Q → M` surjective; `[Projective R (ker g)]` gives `Projective R (ker f)`. This is the direction the README uses: from the free cover to every other surjection. |
| `Submodule.free_of_isPrincipalIdealRing` | Tau Ceti `LinearAlgebra/FreeModule/PID.lean:42` | `[CommRing R] [NoZeroDivisors R] [IsPrincipalIdealRing R]`, `[Module.Free R M]`, with no finiteness, so "in every rank" is right. Mathlib's `Submodule.nonempty_basis_of_pid` (`LinearAlgebra/FreeModule/PID.lean:278`) needs `[Finite ι]`, so this is not a duplicate. |
| `Rep.projective_ker_of_isZero_res` | `TateCohomology/NakayamaRim.lean:117` | `[Finite G] [IsDomain k] [IsPrincipalIdealRing k] [CharZero k]`, `hk`, `P : Type u_2` in any universe |
| `Rep.projective_of_isZero_res` (the lattice form) | `TateCohomology/Projective/Basic.lean:232` | needs `[Module.Projective k A]`; `R` is free over `k`, so this holds |
| `Rep.isZero_res_of_projective` | `Projective/Basic.lean:123` | `[CommRing k] [Group G]`; makes `F` cohomologically trivial |
| `Rep.isZero_res_of_exact` | `Projective/Basic.lean:251` | unchanged |
| `TauCeti.TateCohomology.primaryComponent_tateCohomology_eq_bot` | `TateCohomology/PrimaryComponent.lean:81` | unchanged |

The pinned private proof `projective_ker_linearCombination` (`NakayamaRim.lean` lines 79–110) takes the README's steps in the README's order:
1. `F = A →₀ k[G]`;
2. `ker` is cohomologically trivial via `isZero_X₁_of_isZero_X₃_of_isZero_X₂` and `isZero_res_of_projective`;
3. `ker` is free over `k` via `free_of_isPrincipalIdealRing` after `restrictScalars k`;
4. `ker` is projective via `projective_of_isZero_res`;
5. line 127 applies `projective_ker_of_projective_ker`.

The README's prose is therefore an accurate account of the pinned proof. Mathlib at the pin has no file mentioning Schanuel (`grep -rl Schanuel` gives 0 files), so naming Tau Ceti's lemma duplicates nothing.

The texts that cite the changed passage still agree with it:
- line 1365 (downstream consumers);
- line 1421 ("the two Nakayama–Rim names");
- line 1432 (the old → new row for Layer 0 item 4);
- line 1478 (the alias row);
- the references at line 1546, which keep Lang, *Algebra*, III Theorem 7.1.

**Adversarial table.** The new rows for the changed statement come first. The rows marked "(r49)" are carried from the previous report for statements the diff leaves untouched; their values are as computed there.

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| L0 kernel route, at the changed lines 326–333 | `k = ℤ`, `G = C₂`, `A = 𝔽₂[C₂]` (induced, hence cohomologically trivial) | `F = ℤ[C₂]^(4)` has ℤ-rank 8, and so has `R`, since `A` is finite. `Ĥⁿ(C₂, R) ≅ Ĥⁿ⁻¹(C₂, A) = 0`. Schanuel against `ℤ[C₂] ↠ 𝔽₂[C₂]`, whose kernel is `2ℤ[C₂] ≅ ℤ[C₂]`, gives `R ⊕ ℤ[C₂] ≅ 2ℤ[C₂] ⊕ ℤ[C₂]⁴`, with ℤ-ranks `8 + 2 = 2 + 8 = 10`. | holds | none |
| same, negative control: `A` not cohomologically trivial | trivial `ℤ/2`, with `ℤ[C₂] ↠ ℤ/2` by `a + bg ↦ a + b mod 2` | The kernel is `{a + bg : a + b even} = ℤ(1+g) ⊕ ℤ(1−g)`: `det [[1,1],[1,−1]] = −2` matches index 2. That is `ℤ_triv ⊕ ℤ_sgn`, and `Ĥ⁰(C₂, ℤ_triv) = ℤ/2 ≠ 0`, so it is not projective. Likewise `Ĥ⁰(C₂, ℤ/2) = ℤ/2 ≠ 0`. | the hypothesis is needed | none |
| same, infinite rank ("no finiteness") | `k = ℤ`, `G = C₂`, `A = ℚ[C₂]` (induced) | `F` has countable rank, and `R ⊂ F` is ℤ-free only by the arbitrary-rank Lang III 7.1, which is Tau Ceti's lemma rather than Mathlib's `[Finite ι]` form. The projective dimension is exactly 1, since `ℚ[C₂]` restricted to `1` is `ℚ²`, which is not ℤ-projective. | holds; the rank-free lemma is needed | none |
| same, the freeness step without a PID | `k = ℚ[x, y]`, `G = 1`, `(x, y) ⊂ k` | `dim_ℚ (x,y)/(x,y)² = 2 > 1`, so the submodule is not free. This is the README's own example at lines 347–353. | the PID hypothesis is needed | none |
| same, degenerate `k` and `G` | `k = ℚ`, `G` finite; `k = ℤ_(p)`; `G = 1`, `k = ℤ`, `A = ℤ/2` | `ℚ[G]` is semisimple (Maschke), so every kernel is projective. For `ℤ_(p)`, `(p)` is maximal and every `ℓ ≠ p` is a unit, so `hk` holds. For `G = 1`, the kernel is `2ℤ ≅ ℤ`. | consistent | none |
| L0: projective ⇒ cohomologically trivial (r49) | `C₂`, `ℤ[C₂]`; trivial `ℤ` | `Ĥ⁰ = Ĥ⁻¹ = 0`; trivial `ℤ` has `Ĥ⁰ = ℤ/2` | holds | none |
| L0: length-one resolution ⇒ cohomologically trivial (r49) | `0 → ℤ[C₂] →·2 ℤ[C₂] → 𝔽₂[C₂] → 0`; `ℤ₋` | `Ĥ⁰(𝔽₂[C₂]) = 0`; `Ĥ¹(ℤ₋) = ℤ/2` | holds | none |
| L0: lattice form (r49) | trivial `ℤ`; `ℚ[x, y]`; `ℤ[i]` | `Ĥ⁰ = ℤ/2`; averaging splits; `(2) = (1+i)²` lies outside `hk` | as stated | none |
| L0: trivial group (r49) | any `M` | `N = id` gives `Ĥ⁰ = Ĥ⁻¹ = 0` | as stated | none |
| CD step 5: `𝔪₀` (r49) | `ℚ(√−5)`; `e ≡ 1` | `∏ = 20 ≠ 0`; infinite support makes the count 0 | holds | none |
| CD step 5: admissibility (r49) | `ℚ(i)/ℚ`, `4·∞`; `ℚ(ζ₅)` | index 2; `5·∞` | holds | none |
| CD Check `ℚ(√−5)` (r49) | `p = 2, 3, 5` | `v₂ = 2`, `5` tame, `3` splits; `20·∞` | as stated | none |
| `valuativeExtension_of_finite` (r49) | `ℚ₂(i)/ℚ₂`; `u = −3`, `ℓ = 3`; `ℓ = p`; `𝔽_p((t))`; uniformizer step | `2 <ᵥ 1` on both sides; `f(1) = 4`, `f′(1) = 3^k`; `ℓ ≠ p` needed; `w(t^p) = p`; contradiction closes | holds | none |
| `eulerCharacteristic_mixed`, `_finrank_fp` (r49) | `ℚ_p, ℤ/p`; `ℚ₂, ℤ/2`; `ℚ₂, μ₃`; `ℚ₂, 𝔽₂`; `ℚ₃, 𝔽₃` | `p² = p·1·p`; `8 = 8`; `3 = 3`; `3 = 3`; `2 = 2` | equal | none |
| `cyclotomicCharacter_artinMap` (r49) | `ℚ₂`, `u = −3` on `μ₁₆` | `13⁻¹ ≡ 5 mod 16`, not `13` | arithmetic convention | none |
| Kummer, `H²(μ_n)`, `h2FpEquivZMod_of_mu`, cup pairing, local symbol (r49) | `ℚ₂, ℚ₃, ℚ₇`, `n = 1, 2, 3`; `(−1, −1)`, `(5, −1)` | 8 and 4 classes; orders `1, 2, 3`; `H²(inv) = −1`; `−1 ↦ 1`, `5 = 1² + 2² ↦ 0` | as stated | none |
| restriction along `iota` (r49) | splitting field of `X³ − 2` | `τ⁻¹sτ` fixes `τ⁻¹(∛2)` | the embedding is data | none |
| `isPrincipal_map_hilbertClassField` (r49) | `ℚ(√−5)`; `K = ℚ`; `I = ⊥`; `ℚ(i)/ℚ` at `2` | `𝔭₂𝔭₃ = (1+√−5)`; `(1+i)² = (2)` | holds | none |
| `relDiscr_eq_finprod_abelianConductor` (r49) | `ℚ(ζ₅)`; `L = K`; `ℚ(ζ₁₅)`; `ℚ(i, √5)` | `5³`; `⊤`; `3⁴·5⁶`; `400` | equal | none |
| Layers 2, 10, 12, 13, 14, §5.3, §5.6 (r49) | `[U : V] = 4`; `ℚ(√13, √17)`; `D₄ ×_{V₄} D₄`; `29 = 3² + 5·2²`; `(3, 7)`; `ℚ₂(ζ₅)`; `C₄`, `V₄` | `1/2`, `1/4`; `ℤ/4`; `8 > 4`; `h = 1`; sums vanish; `ζ ↦ ζ³`; `g²` | as stated | none |

**Seeded sample.** All six targets lie outside the changed lines: lines 496, 557, 578, 692, 709 and 880. The previous verification of each therefore stands. I re-checked two of their locators in the cache:
- *The cyclotomic normalization*:
  - milne-cft line 10059 is VII Example 8.2, on printed p. 221 (header at line 10031), and it continues onto p. 222 (line 10084);
  - line 10075 gives the local symbol at `ℓ` of `u ℓ^s` as `[u⁻¹]`, as the README says.
- *Open target: the comparison of valuations*: milne-ant line 5295 is Proposition 7.31, the lifting of a simple root modulo the maximal ideal, on printed p. 120 (header at line 5294), as cited.

**Cross-roadmap citations and overlaps.**
- The changed text cites no other roadmap.
- overlaps.md finds:
  - no dropped cited id;
  - no id that only an open revision defines;
  - no id this pull request drops that others cite.
- The closest open roadmaps in vocabulary are LocalGaloisGroups (#1187, #1215, #1411), LocalFieldsRamification (#1187) and GlobalNumberFields (#1339). None of them owns the Layer 0 objects: the passage describes Tau Ceti theorems.
- The two heads that change this folder are R02.

## Not verifiable

- Cited by locator only, as the manifest settles them:
  - Artin–Tate (waived);
  - Serre, *Local Fields*; Neukirch; NSW; Engler–Prestel (uncertified).
- The Layer 0 background citations have no manifest entry, and I did not read them: Lang, *Algebra*, III Theorem 7.1; Brown, *Cohomology of Groups*, VI §8; Rim 1959. The Lean statements they back were checked at the pin instead, as above.
- I did not re-verify the `Completed/` files of R01 for content: they are another roadmap's text.

## Source issues

- none
