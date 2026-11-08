# Review of ConformalMappingPartII (pull request #1407 at a182e56)

**Verdict:** needs changes

This is an incremental re-review of the 8 lines changed since 520fb55: README lines 7 (the ConformalMapping scope sentence), 25 (the Little Picard deferral), 102 (the reflection-theorem contract) and 296 (the §1.2 *Needs:* module). `Suggested.lean` is unchanged. Four of the six repairs asked for in round 7 are made and correct; the two that touch README line 99 were not made, because that line is not in the diff. Nothing else changed, and the repairs introduced no new problem.

## R01 (P3) — The `IsLocallyBoundedOn` citation still names a module that does not exist at the pin

**Location.** `TauCetiRoadmap/ConformalMappingPartII/README.md` line 99: “`TauCeti.IsLocallyBoundedOn` Ω (`TauCeti.Analysis.Normed.Group.LocallyBounded`; uniformly bounded on every compact subset)”.

**Claim.** The parenthetical names the Tau Ceti module that declares `IsLocallyBoundedOn`.

**Witness.** At the Tau Ceti pin a91d3aa, `TauCeti/Analysis/Normed/` has `Module`, `Algebra`, `Affine`, `Ring`, `Operator` and `Field` subdirectories but no `Group/LocallyBounded.lean`, and `find -iname '*LocallyBounded*'` returns nothing. The predicate is declared at `TauCeti/Analysis/Complex/Conformal/NormalFamilies.lean:101` in `namespace TauCeti` (line 85), as a single constant per compact subset of s, which matches the README's gloss. (Round 7 said there was no `Normed/` directory at all; that was wrong, but the cited file is still absent.)

**Repair.** Replace `TauCeti.Analysis.Normed.Group.LocallyBounded` by `TauCeti.Analysis.Complex.Conformal.NormalFamilies` (or `NormalFamilies`, under the prefix the surrounding bullets use). Checked against the declaring file above. This is the unrepaired half of round-7 R01.

## R02 (P3) — The Hurwitz contract still says “frequently injective” where the pin assumes “eventually injective”

**Location.** README line 99: “`TauCeti.hurwitz_injOn` (`Hurwitz`): on a preconnected open Ω, a locally uniform limit of maps that are eventually holomorphic and frequently injective on Ω is injective on Ω or constant there.”

**Claim.** The contract states the hypotheses of the pinned theorem.

**Witness.** `TauCeti/Analysis/Complex/Conformal/Hurwitz.lean:286` reads `(hinj : ∀ᶠ i in l, Set.InjOn (F i) Ω)`: injectivity eventually along the filter, not frequently. (Lines 284–285 give `∀ᶠ … DifferentiableOn` and `TendstoLocallyUniformlyOn`.) A contract promising the frequent form overstates the supplier; the sequence of §1.1 is injective at every index, so the eventual form suffices there.

**Repair.** Write “eventually holomorphic and eventually injective on Ω”. This is the unrepaired first part of round-7 R02.

## Previous findings

- R01 — partly repaired: line 296 now reads “`TauCeti.exists_eqOn_const_mul_of_leftInvOn_ball_of_map_zero` in `TauCeti.Analysis.Complex.Conformal.UnitDisc.Automorphism.Rotation`”, which is the declaring file (`Rotation.lean:72`). Line 99 still names `TauCeti.Analysis.Normed.Group.LocallyBounded` (R01 above).
- R02 — partly repaired: line 7 now reads “Its local-mapping layer (Hurwitz's theorem, including its injectivity form) and its layers on normal families (Montel compactness)”, matching ConformalMapping's L0 on main (`Completed/ConformalMapping/README.md` lines 104–108, “the local-mapping engine … *Hurwitz*”). Line 102 now says the map “sends the closed side Im e≥0 of the source of e into the source of d”, which is `hf_maps` at `Reflection/Arc.lean:212`. Line 99 still says “frequently injective” (R02 above).
- R03 — repaired: line 25 now reads “The λ-uniformization ℍ/Γ(2) ≅ ℂ∖{0,1} and Little Picard are not targets here: ConformalMapping, in its relation to sibling roadmaps, records them as ModularForms material, and no section of this roadmap consumes them.” `Completed/ConformalMapping/README.md` lines 163–167 (“Relation to sibling roadmaps”, heading at line 148) assign the λ-covering and Picard's theorem to ModularForms without naming a layer. No layer number is claimed any more.

## Verified sound

**Mechanical evidence.**
- HEAD is a182e563d0d5a08eebfdcc2e9d59024b2c9b76b3 and the worktree is clean.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ConformalMappingPartII'` is empty.
- `git diff --stat 520fb55..HEAD -- TauCetiRoadmap/ConformalMappingPartII/` is `README.md | 8 ++++----` only; `Suggested.lean` (332 lines) and `metadata.toml` are unchanged. The folder holds only those three files.
- The gate rerun at this head prints every scanner at 0 (`set_option=0 … build=0 … stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`), exit 0.
- `lake env lean` on `TauCetiRoadmap/ConformalMappingPartII/Suggested.lean` exits 0 in 30 s with exactly 17 warnings, all `declaration uses sorry`, at lines 62, 72, 92, 108, 155, 165, 183, 201, 216, 223, 236, 250, 270, 285, 299, 311 and 322: the same set as rounds 6 and 7. The three `TauCeti.*` imports (`Fuchsian.Compactification.Manifold`, `Fuchsian.Covolume`, `Geometry.Manifold.Instances.OnePoint`) have object files in this workspace. There is no `set_option`, no sorried data and no `lemma`.
- The dependency command reports exactly

```text
depcheck: 243 roadmaps, 2457 edges, 0 problem(s)
```

  with no UPWARD, CYCLE or `moved:` line. `ConformalMappingPartII` is line 244 of the merge order. The diff adds no supplier.

**The changed passages, against the pins and main (file:line).**

| Changed line | Checked against | Result |
|---|---|---|
| 7: Hurwitz placed in ConformalMapping's local-mapping layer | `Completed/ConformalMapping/README.md:104–108` (L0, “the local-mapping engine”, lists Rouché and Hurwitz); L1 at line 111 is Montel | correct |
| 25: λ-uniformization and Little Picard recorded as ModularForms material in ConformalMapping's sibling relation | `Completed/ConformalMapping/README.md:148` (section heading), 163–167 (ModularForms owns the λ-covering, j and Picard) | correct; no layer named |
| 102: reflection theorem's hypotheses | `Reflection/Arc.lean:208–215`: `hf_maps` (closed side into `d.source`), `hf_cont`, `hf_diff`, `hf_real`; symmetric targets `he_symm`, `hd_symm` | all six hypotheses now described |
| 296: module of the rotation theorem | `UnitDisc/Automorphism/Rotation.lean:72` | correct; line 335 (§1.6) cites the classification theorem in `Automorphism.Classification`, which is also right (`Classification.lean:89`) |

The only other occurrences of the stale strings are on line 99 (R01, R02); `grep` for `Normed.Group`, `frequently` and `Automorphism.Classification` finds lines 99, 100 and 335 only, and lines 100 and 335 are correct.

**Adversarial table.** No mathematical statement changed in this diff, so every row is carried forward from round 7 (and the rounds it cites) with its values abbreviated; the one new row records the pinned binder that decides R02.

| Statement | Instances and values | Result |
|---|---|---|
| Hurwitz contract (line 99) | `Hurwitz.lean:286` binds `hinj : ∀ᶠ i in l, Set.InjOn (F i) Ω`. Instance z/(n+1) on 𝔻: injective at every n, limit 0 constant, so the second alternative occurs; with F i = z for even i and 0 for odd i, injectivity is frequent but not eventual and the sequence does not converge, so the frequent form is not what the pin proves. | wording R02 |
| `finite_puncture_cusp_comparison`, binder form and S = {0,1,∞} | Round 7: `(∃ hd, IsCofinite ∧ P hd) ↔ (IsCofinite ∧ ∀ [hd], P hd)` proved for all Γ, P; λ = θ₂⁴/θ₃⁴, covolume 6.283185 = 2π(2·0 − 2 + 3), λ/q → 16 (15.7746, 15.99018, 15.999982 at Im τ = 2, 3, 5), width-4 coordinate gives u′(0) = 0 as the wrong-coordinate control; \|S\| = 2 excluded by `hS`. | keep (round 7) |
| Classification and isometry (§§1.6, 1.7) | Round 7: φ = i(z − 1/2)/(1 − z/2), \|φ′\|/(1 − \|φ\|²) = 1.000000, 1.333333, 1.333333, 1.960784 at z = 0, 0.5, 0.3 + 0.4i, −0.7i, equal to 1/(1 − \|z\|²); centre g(0) = 1/2. | keep (round 7) |
| Rotation (§1.2) | Round 7: f = iz, g = −iz, f(0) = 0 gives c = i, \|c\| = 1; the pin needs only a left inverse. Module now `Rotation`. | keep |
| Reflection (line 102) | Round 7 instances: triangle with vertices 0, 1, e^{πi/N} and a Möbius chart straightening its arc; the added `hf_maps` is satisfied by the triangle Riemann map because it sends the closed triangle into the closed disc, which is a chart source for the target chart d = id on 𝔻. | keep |
| Normalized Riemann map, branch log and root, Jordan closure, monodromy (§§1.1, 2.4, 3.3, 6.1, 0.4) | Round 7 values: (z − i)/(z + i) has derivative −i/2 at i, i·that has 0.5 > 0; log(1 + z) with L(0) = 0 and √(1 + z), n = 0 excluded by `hn`; Ω = 𝔻, g = id; log at 1 inside ℂ∖{0} is excluded by simple connectivity. | keep (round 7) |
| `zero_balanced_connection`, `uniform_cusp_asymptotic`, §4.6, §8.1 | Round 6: ₂F₁ vs series agree to 1.2e−14; γ_N quotient 4.376879230453 at N = 2; max D ≤ 0.9995 up to N = 2000. | keep (round 6) |
| `RootsCover.halfPlaneForm`, `free_deck_presentation`, §1.5, §6.3 | Round 5: h_N = 2cot(π/2N) = 2, 3.464102, 4.828427, 12.627503; 13 120 reduced words with no violation. | keep (round 5) |
| Conventions; 0.1–0.6; 1.1–1.12; 2.1–2.9; 3.1–3.8; 4.1–4.5, 4.7–4.8; 5.1–5.8; 6.1–6.8; 7.1–7.10; 8.2–8.7; 9.1–9.19 | Untouched. Round 4: S(z²)(1) = −3/2; γ₂ = Γ(1/4)⁴/(4π²); half rotation 1.2111859623 at z = 0.1; C* = 7. | keep (round 4) |

**Headline theorems and padding.** `Suggested.lean` is byte-identical to the file reviewed in round 7, so its 17 sorried headlines, the one-tactic probe of round 7 (`simp` leaves goals on `finite_puncture_cusp_comparison`) and the `#check` comparison of rounds 6–7 stand; nothing was re-probed.

**Seeded sample.** None of the fifteen sampled targets (0.3, 1.6, 1.7, 1.11, 1.12, 3.5, 3.6, 4.7, 5.4, 7.4, 7.8, 8.1, 8.4, 9.16, 9.17) has a statement, locator or *Needs:* line in this diff; §1.7's dependence on line 25 is through its unchanged first two sentences (the ComplexCurveModuli D0.4 metric), not the rewritten deferral. Their locators were read in rounds 1–7 and are not re-read here.

**Ownership and overlaps.** The diff adds no object and no supplier. `overlaps.md` lists no other pull request changing this roadmap, no dropped id and no revision-only id; the closest roadmap in vocabulary is ConformalMapping (#998), which this roadmap consumes through pinned Tau Ceti names only. The `citations.md` leads are unchanged from round 7 and are not findings: TeschlODE and McMullenRS are source ids, and the six flagged Lean names are declared at `Suggested.lean` lines 62, 50, 142, 72, 223 and 183.

## Not verifiable

- **Hem88**, Theorem 3.1: settled as waived; cited by locator only, untouched by this diff.
- **KR16**, §1: settled as uncertified; untouched by this diff.
- The Tau Ceti modules `Hurwitz`, `NormalFamilies`, `UnitDisc.Automorphism.Rotation`, `Reflection.Arc` have no object files in this workspace; their declarations were verified by reading the source at pin a91d3aa, not by `#check`.

## Source issues

- none
