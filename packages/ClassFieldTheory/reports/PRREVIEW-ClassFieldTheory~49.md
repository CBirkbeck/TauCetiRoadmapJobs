# Review of ClassFieldTheory (pull request #617 at ff2b587)

**Verdict:** needs changes

This is an incremental re-review of the 95 lines that changed in `TauCetiRoadmap/ClassFieldTheory/README.md` since 435dc8a. `Suggested.lean` is unchanged.

Both mathematical findings of the previous report are repaired:
- R01: Layer 0 now gives the Nakayama–Rim hypotheses statement by statement.
- R02: conductor–discriminant step 5 now constructs `𝔪₀` and names its glue.

Every new name resolves at the pin, and the glue composes in Lean. Two findings are still open:
- the gate's `outside-folder` failure (previous R03, carried as R01);
- the unstated merge order against #1215 and #1411 (previous R04, carried as R02).

One new P3 is in the repaired Layer 0 text: R03, which uses "projective cover" in a non-standard sense.

## R01 (P3) — The push gate still fails on files outside the pull request's declared folders

Carries the previous R03.

**Location.** `git diff --stat origin/main...HEAD` lists five files outside `TauCetiRoadmap/{ClassFieldTheory, IntegralLattices, QuadraticFormInvariants}`:
- `Completed/LocalFieldsRamification/COMPLETION.md`, `README.md` and `Suggested.lean`;
- `Completed/LocalGaloisGroups/README.md` and `Suggested.lean`.

**Claim.** The gate reads `outside-folder … FAIL`, and every other check reads `0`. The pull request's title, "fix(LocalFieldsRamification): …", makes that roadmap its subject, but the brief names only the three `TauCetiRoadmap/` folders as the pull request's own.

**Witness.** gate.md lists: "outside-folder (4) – Completed/LocalFieldsRamification/COMPLETION.md, …/README.md, …/Suggested.lean, Completed/LocalGaloisGroups/README.md". My re-run lists the same four, plus the five files of the two sibling folders, which are the pull request's own.

**Repair.** A human decides whether the `Completed/` edits belong to this pull request:
- if they do, the brief lists those folders and the gate passes;
- if not, they move to a separate pull request that merges together with this one.

Nothing in this folder changes.

## R02 (P3) — The merge order against #1215 and #1411 is still not stated

Carries the previous R04.

**Location.** The pull request's description. Its only merge-order sentence is "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1410".

**Claim.** Two open pull requests change this folder. Both conflict with this head and state shared targets differently.
- #1215, now at head `12aa8f1`:
  - states `cyclotomicCharacter_artinMap` (its `Suggested.lean` line 82);
  - adds `count_relDiscr_eq_finsum_abelianConductor_exponent` (157) and `abelianConductor_eq_lcm` (171).
- #1411, now a draft at head `d6e2855`:
  - states `algebraMap_vle_algebraMap_iff_of_finite_padic` (402);
  - still declares the alias `ClassFieldTheory.TateCohomology.projective_ker_of_isZero_res` (195). This head retires that alias (README line 1473) and rewrites its prose (lines 313–335).

**Witness.** overlaps.md says: "#617 and #1215 conflict in … `TauCetiRoadmap/ClassFieldTheory/README.md`, `TauCetiRoadmap/ClassFieldTheory/Suggested.lean`", and the same for #1411. I read both heads with `roadmaps show ClassFieldTheory --pr N`.

**Repair.** In the description's merge-order paragraph, say which of #617, #1215 and #1411 merges first for this folder. Each later one rebases and keeps one statement of each shared target. Test: the description names both pull requests and the order.

## R03 (P3) — Layer 0 uses "projective cover" for an arbitrary surjection from a projective module

**Location.** `TauCetiRoadmap/ClassFieldTheory/README.md` lines 327–329: "the kernel of the free cover is free over `k` … so the lattice form applies to it, and Schanuel's lemma passes to every other projective cover."

**Claim.** The sentence uses "projective cover" for any surjection from a projective module. In the standard sense (Bass), a projective cover is a surjection from a projective module whose kernel is superfluous. Over `ℤ` or `ℤ[G]`, a non-projective module almost never has one. So the sentence, read literally, ranges over objects that do not exist, while the theorem it explains (`Rep.projective_ker_of_isZero_res`) covers every surjection from a projective module.

Two smaller gaps are in the same sentence:
- "the free cover" is undefined;
- the sentence omits why the kernel is cohomologically trivial, which the lattice form needs.

**Witness.** `ℤ/2` has no projective cover over `ℤ`, since a superfluous submodule of a free `ℤ`-module is zero. Tau Ceti's docstring (`NakayamaRim.lean` lines 26–33) says "the kernel of any other surjection onto `A` from a projective module".

**Repair.** Replace "the kernel of the free cover is free over `k` by … so the lattice form applies to it, and Schanuel's lemma passes to every other projective cover" with:

> the kernel of the surjection onto `A` from the free `k[G]`-module on the elements of `A` is cohomologically trivial by the long exact sequence and free over `k` by `Submodule.free_of_isPrincipalIdealRing` (Lang, *Algebra*, III Theorem 7.1), in every rank, so the lattice form applies to it, and Schanuel's lemma passes to the kernel of every other surjection onto `A` from a projective `k[G]`-module

Test, at `k = ℤ`, `G = C₂`, `A = 𝔽₂[C₂]`:
- the surjection `ℤ[C₂] ↠ 𝔽₂[C₂]` has kernel `2ℤ[C₂] ≅ ℤ[C₂]`, which is free;
- the rewritten sentence covers this surjection and every other one without invoking a projective cover, which `𝔽₂[C₂]` lacks.

## Previous findings

- R01 — repaired: lines 316–328 give `k` and `G` arbitrary for projective and length-one modules. The lattice form needs a char-0 domain with the prime-number condition. The kernel adds the PID hypothesis. Examples cover `ℚ[x, y]` and `ℤ[i]`.
- R02 — repaired: lines 1049–1087 build `𝔪₀` via `hasFiniteMulSupport_asIdeal_pow_of_le_count`, `finprod_ne_zero`, `count_finprod_asIdeal_pow`, and name `mem_raySubgroup_iff`, `ideleClassNormMap_mk`, `exponent_mono`; *Needs:* lines 1135–1145; `ℚ(√−5)` Check at lines 1166–1171.
- R03 — not repaired: the gate still lists `Completed/LocalFieldsRamification/{COMPLETION.md, README.md, Suggested.lean}` and `Completed/LocalGaloisGroups/README.md` as outside-folder. Carried as R01.
- R04 — not repaired: the description still names only #1410 in its merge-order paragraph, and #1215 (`12aa8f1`) and #1411 (`d6e2855`) still conflict. Carried as R02.

## Verified sound

**Gate, dependency check, elaboration.**
- Gate re-run with `--base origin/main`: every check reads `0` except `outside-folder=9 … FAIL`.
  - The nine files are R01's four `Completed/` files and the five files of `IntegralLattices` and `QuadraticFormInvariants`, which the brief names as the pull request's own.
  - The worker's gate reports `build=0`.
- Dependency check, with `--movable`: `depcheck: 235 roadmaps, 2265 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- `lake env lean TauCetiRoadmap/ClassFieldTheory/Suggested.lean` gives three `declaration uses 'sorry'` warnings, at lines 159, 349 and 358, and nothing else. This matches the previous report.
- `Suggested.lean` is byte-identical to 435dc8a. The previous `#check @` comparison of its declarations and the padding probe, in which `exact?` fails on all three open targets, therefore stand.

**Every name in the changed passages, elaborated with `#check @` at the pin.** One scratch file importing `Mathlib` and ten `TauCeti.*` modules elaborated without error.

Layer 0 (8 names):

| Name | File and line at the pin | Hypotheses read from the elaborated type |
|---|---|---|
| `Rep.isZero_res_of_projective` | `TateCohomology/Projective/Basic.lean:123` | `[CommRing k] [Group G]`, no finiteness |
| `Rep.isZero_res_of_exact` | `Projective/Basic.lean:251` | `[CommRing k] [Group G]`, no finiteness |
| `Rep.projective_of_isZero_res` | `Projective/Basic.lean:232` | `[Finite G] [IsDomain k] [CharZero k]`, `hk` on prime numbers, `[Module.Projective k A.V]` |
| `Rep.projective_ker_of_isZero_res` | `NakayamaRim.lean:117` | adds `[IsPrincipalIdealRing k]` (line 76); `P` in any universe |
| `TauCeti.TateCohomology.isZero_of_forall_isPGroup` | `TrivialityCriterion.lean:193` | its conclusion is `IsZero` for every `S` with `[Fintype S]` and every `n : ℤ` |
| `TauCeti.TateCohomology.primaryComponent_tateCohomology_eq_bot` | `PrimaryComponent.lean:81` | — |
| `Submodule.free_of_isPrincipalIdealRing` | `LinearAlgebra/FreeModule/PID.lean` | — |
| `LinearMap.projective_ker_of_projective_ker` | `Projective/Schanuel.lean:190` | the Schanuel step |

So each hypothesis set in lines 316–328 is exactly the one Tau Ceti carries.

The consumer sentence at lines 332–334 matches `Completed/LocalGaloisGroups/README.md`:
- line 854 applies the kernel theorem "at `k = ℤ_[p]`";
- line 831 uses the `p`-primary vanishing.

Tau Ceti applies the kernel theorem at `ℤ_[p]` in `LayerTateModule/Basic.lean:140` with `PadicInt.isUnit_natCast_or_isMaximal_span`. The old → new row at README line 1473 maps the retired alias.

Step 5 (13 names):

| Name | File and line at the pin |
|---|---|
| `Modulus.finitePart_ne_bot` (a structure field) | `RayClass/Modulus.lean:102` |
| `Modulus.exponent_def` | `RayClass/Modulus.lean:195` |
| `Modulus.exponent_mono` | `RayClass/Modulus.lean:243` |
| `Ideal.hasFiniteMulSupport_asIdeal_pow_of_le_count` | `DedekindDomain/Factorization.lean:157` |
| `Ideal.count_finprod_asIdeal_pow` | `DedekindDomain/Factorization.lean:168` |
| Mathlib `finprod_ne_zero` | `Algebra/BigOperators/Finprod.lean:419` |
| `mem_raySubgroup_iff` | `Ideles/Ray/Subgroup.lean:75` |
| `ideleClassNormMap_mk` | `Ideles/Norm/Relative.lean:200` |
| `mem_range_ideleNormMap_iff` | `Ideles/Norm/Range.lean:115`, namespace `TauCeti.GlobalNumberFields` |
| `isAdmissibleModulus_abelianConductor` | `AdmissibleModulus/Basic.lean:208` |
| `isAdmissibleModulus_iff_abelianConductor_dvd` | `AdmissibleModulus/Basic.lean:200` |
| `IsAdmissibleModulus` (definition: `raySubgroup 𝔪 ≤ range ideleClassNormMap`) | `AdmissibleModulus/Basic.lean:161` |
| `IsAdmissibleModulus.conductorExponent_le_exponent` | `AdmissibleModulus/Ramification.lean:116` |

`conductorExponent_le_exponent` holds at any prime above `v`, so the chosen `u'` is legitimate.

A scratch `example` over any Dedekind domain chains these lemmas from the bound `e v ≤ count v I`, with `I ≠ 0`:
- `hasFiniteMulSupport_asIdeal_pow_of_le_count` gives finite support;
- `count_finprod_asIdeal_pow` then gives the multiplicity `e v`;
- `finprod_ne_zero` with `pow_ne_zero` gives `∏ᶠ w, w.asIdeal ^ e w ≠ ⊥`.

It elaborated. The step 5 construction of `𝔪₀` is therefore closed by the cited names.

**Seeded sample, where it falls in the changed text.**
- *Open targets* (Layer 13) contains step 5. I re-read its locators:
  - milne-cft line 7423 is V Theorem 3.27 and line 7436 is Remark 3.28, both on printed p. 165 (line 7405);
  - Milne omits the proof, so the local–global conductor comparison of step 5 is the roadmap's own route, built from the Tau Ceti names above.
- *Definitions on Tau Ceti's carriers*, *The local symbol and the Hilbert pairing*, *Open target: the comparison of valuations*, *Restriction to a finite Galois extension* and *The cyclotomic normalization*: the diff does not touch them, so the previous report's verification stands.

**Cross-roadmap citations in the changed text.**
- `LocalGaloisGroups` (main, `Completed/LocalGaloisGroups/README.md` lines 831 and 854): resolved, as above.
- overlaps.md finds:
  - no dropped cited id;
  - no id that only an open revision defines;
  - no id this pull request drops that others cite.
- The closest open roadmaps in vocabulary are LocalGaloisGroups (#1187, #1215, #1411), LocalFieldsRamification (#1187) and GlobalNumberFields (#1339). None of them owns a Layer 0 or step 5 object here; both passages describe Tau Ceti theorems and a route.

**Adversarial table.** New rows for the changed statements come first. The rows marked "r46" are carried from the previous report for statements the diff leaves untouched.

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| L0: projective ⇒ cohomologically trivial, any `k`, `G` | `C₂`, `k = ℤ`, `A = ℤ[C₂]`; wrong model trivial `ℤ` | `N(a + bg) = (a+b)(1+g)` ⇒ `Ĥ⁰ = ℤ(1+g)/ℤ(1+g) = 0`, `Ĥ⁻¹ = ℤ(1−g)/ℤ(1−g) = 0`; trivial `ℤ`: `Ĥ⁰ = ℤ/2 ≠ 0`, not projective | holds | none |
| L0: length-one resolution ⇒ cohomologically trivial | `0 → ℤ[C₂] →·2 ℤ[C₂] → 𝔽₂[C₂] → 0`; sign module `ℤ₋` | `Ĥ⁰(𝔽₂[C₂]) = 𝔽₂(1+g)/𝔽₂(1+g) = 0`; `Ĥ¹(ℤ₋) = ker N/(g−1)ℤ₋ = ℤ/2ℤ ≠ 0`, so `ℤ₋` has no such resolution | holds | none |
| L0: lattice form (char-0 domain, prime-number `hk`) | `k = ℤ`, trivial `ℤ`; `k = ℚ[x, y]`; `k = ℤ[i]` | trivial `ℤ`: `Ĥ⁰ = ℤ/2`, hypothesis fails; `ℚ[x, y]`: `|G|` is a unit, so averaging splits, holds; `ℤ[i]`: `2 = −i·(1+i)² = −i·2i`, `(2) ⊊ (1+i)`, so outside `hk` | as stated | none |
| L0: kernel statement (PID added) | `G = 1`, `k = ℚ[x, y]`, `A = k/(x, y)`; `k = ℤ`, `A = 𝔽₂[C₂]` | `dim_ℚ (x,y)/(x,y)² = 2 > 1 =` rank, not projective, and not a PID, so nothing is asserted; `ker(ℤ[C₂] ↠ 𝔽₂[C₂]) = 2ℤ[C₂] ≅ ℤ[C₂]`, free | holds | R03 (wording only) |
| L0: Example, the trivial group | any `M` | `N = id` ⇒ `Ĥ⁰ = M/M = 0`, `Ĥ⁻¹ = ker id = 0` | as stated | none |
| CD step 5: `𝔪₀` exists | `M = ℚ(√−5)`; negative control `e ≡ 1` | `c = (2, 1)` at `(2, 5)`, `0` elsewhere, `≤` the exponents `(2, 1)` of `20`; `∏ = 2²·5 = 20 ≠ 0`, count at `5` is `1`; `e ≡ 1` has infinite support, so `∏ᶠ = 1` and count `0 ≠ 1` | finite support is needed and is now supplied | none |
| CD step 5: admissibility of `𝔪₀` | `ℚ(i)/ℚ`, `𝔪₀ = 4·∞`; `ℚ(ζ₅)/ℚ` | unit norms from `ℚ₂(i)` are `a² + b² ≡ 1 mod 4`, i.e. `1 + 4ℤ₂`, of index `2`, the local degree; `x_∞ > 0` is `|z|²`; `exponent_mono` gives `2 ≤ 2`; `c(5) = 1` ⇒ `𝔪₀ = 5·∞` | ray subgroup ⊆ norm group; equality | none |
| CD step 5: new Check `ℚ(√−5)` | `p = 2, 3, 5` | `−5·3 = −15 = 1 − 16 ≡ 1 mod 8` ⇒ `ℚ₂(√−5) = ℚ₂(√3)`, `v₂(disc ℤ₂[√3]) = v₂(12) = 2`; `5` tame ⇒ `1`; `−5 ≡ 1 mod 3` ⇒ `3` splits; `𝔪₀ = 2²·5·∞ = 20·∞` | as stated | none |
| `valuativeExtension_of_finite` | `ℚ₂(i)/ℚ₂` | `w(2) = 2`, `v(2) = 1`; `2 <ᵥ 1` on both sides | holds | none (r46) |
| same, units step | `ℚ₂`, `u = −3`, `ℓ = 3` | `f = X^{3^k} + 3`, `f(1) = 4 ≡ 0`, `f′(1) = 3^k` a unit ⇒ `w(−3) = 0` | holds | none (r46) |
| same, `ℓ = p` | `ℚ₂`, `X² − 3` | `f′(1) = 2` is not a unit; `3 ≢ 1 mod 8` | needs `ℓ ≠ p`, as stated | none (r46) |
| same, equal characteristic | `𝔽_p((t))`, `t ↦ t^p` | degree `p`; `w(t^p) = p > 0` | holds | none (r46) |
| same, uniformizer step | `ϖ = (1 + ϖ) − 1` | `w(ϖ) = 0` ⇒ `w ≡ 0` on `Fˣ` | contradiction; the step closes | none (r46) |
| `eulerCharacteristic_mixed` | `ℚ_p, ℤ/p`; `ℚ₂, ℤ/2`; `ℚ_p, ℤ/ℓ` | `p² = p·1·p`; `8 = 2·2·2`; `ℓ = ℓ·1·1` | equal | none (r46) |
| same, nontrivial action | `ℚ₂`, `A ≅ μ₃` | `#H¹ = 3 = 1·3·2⁰` | equal | none (r46) |
| `eulerCharacteristic_finrank_fp` | `ℚ₂, 𝔽₂`; `ℚ₃, 𝔽₃` | `3 = 1+1+1`; `2 = 1+0+1` | equal | none (r46) |
| `cyclotomicCharacter_artinMap` | `ℚ₂`, `u = −3` on `μ₁₆` | `13⁻¹ ≡ 5 mod 16`, not `13` | arithmetic convention | none (r46) |
| `kummerEquiv_mixed` | `ℚ₂, n = 2`; `ℚ₃, n = 2` | 8 classes; 4 classes | agrees | none (r46) |
| `h2MuEquivZMod_mixed` | `ℚ₂, n = 1, 2, 3`; `ℚ₇, n = 3` | orders `1, 2, 3`; `1/3 ↦ 1` | the invariant fixes the map | none (r46) |
| `h2FpEquivZMod_of_mu` | `T = 0`; `p = 3` with `e ∘ inv` | no `e`; `H²(inv) = −1` | `e` is data | none (r46) |
| `kummerCupPairing` | `n = 2`, `(−1, −1)`; `ℚ₇` | `↦ −1` versus `1` for zero; `(ζ, ζ) ↦ ζ²` | the root is data | none (r46) |
| local symbol | `ℚ₂`, `(−1, −1)`, `(5, −1)` | `−1 ↦ 1`; `5 = 1² + 2² ↦ 0` | Hilbert symbol | none (r46) |
| restriction along `iota` | splitting field of `X³ − 2` | `τ⁻¹sτ` fixes `τ⁻¹(∛2) ≠ ∛2` | the embedding is data | none (r46) |
| `isPrincipal_map_hilbertClassField` | `ℚ(√−5)`; `K = ℚ`; `I = ⊥` | `𝔭₂ ↦ (1+i)`; `𝔭₂𝔭₃ = (1+√−5)`; `ℤ` is a PID | holds | none (r46) |
| same, step 5 | `ℚ(i)/ℚ` at `2` | `e = 2`, `(1+i)² = (2)` | `e` is needed | none (r46) |
| `relDiscr_eq_finprod_abelianConductor` | `ℚ(ζ₅)`; `L = K` | `1·5·5² = 5³`; `⊤ = ⊤^{φ(1)}` | equal | none (r46) |
| same, step 1 | `ℚ(ζ₁₅)` at `5` | `f·d = 2·3 = 6`; `3⁴·5⁶` | equal | none (r46) |
| same, steps 2–4 | `ℚ(i, √5)` at `5` | `g·δ = 2`; `𝔡 = 400`; `√−5 ↦ i√5` | step 4 closes | none (r46) |
| L0 Tate criterion examples | `C₂` on `ℂˣ`; trivial `ℤ/2` | `u = [−1]`; `0 ≠ ℤ/2` | as stated | none (r46) |
| §2.3 and Layer 2 | `[U : V] = 4`, `[U : U′] = 2` | `2·(1/4) = 1/2`; `3·(1/12) = 1/4` | as stated | none (r46) |
| Layer 10 | `ℚ(√13, √17)` | `(17/13) = (13/17) = 1`; `H² ≅ ℤ/4` | as stated | none (r46) |
| Layer 12, `D₄` | `D₄ ×_{V₄} D₄` | order `16`; `|G^ab| = 8 > 4` | as stated | none (r46) |
| Layer 13 splitting, orders, ring class field | `ℚ(√−5)`, `ℚ(√3)`; `ℤ[√−3]`, `ℤ[2i]` | `29 = 3² + 5·2²`; `h = 1, 1`; one `simp` | as stated | none (r46) |
| Layer 14 | `(3, 7)`, `(−1, −1)` | `0+1+0+1`; `1+1` | sums vanish | none (r46) |
| §5.3 and §5.6 | `ℚ₂(ζ₅)`; `C₄`, `V₄` | `ζ ↦ ζ³`; `V(g) = g²`, `= 1` in `V₄` | as stated | none (r46) |


## Not verifiable

- Cited by locator only, as the manifest settles them:
  - Artin–Tate, *Class Field Theory* (waived);
  - Serre, *Local Fields*; Neukirch, *Algebraic Number Theory*; NSW; Engler–Prestel (uncertified).
- The Layer 0 background citations have no manifest entry, and I did not read them: Brown, *Cohomology of Groups* VI §8; Rim 1959; Lang, *Algebra* III 7.1. The Lean statements they back were checked at the pin instead.
- I did not elaborate `Completed/LocalGaloisGroups/Suggested.lean`, because it imports a roadmap module with no object file here. Its use of the Layer 0 names was checked textually.

## Source issues

- **Misprint** in milne-cft at V, "The conductor-discriminant formula", before Theorem 3.27, printed p. 165: the source defines the conductor as the least modulus on which the primitive character is zero; it should be trivial, i.e. identically 1, since the character is multiplicative; affects nothing.
