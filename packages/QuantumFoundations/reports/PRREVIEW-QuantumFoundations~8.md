# Review of QuantumFoundations (pull request #1771 at 824bab8)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since 824bab8. The folder is unchanged; this round reads the pull request's title and description against the head, and re-resolves the supplier citations against main at 1a19c9f. Main's OperatorAlgebraDynamics was revised on 8 and 10 November, after the previous review (7 November), and R01 and R02 come from that revision, not from text the previous review passed against the same supplier.

## R01 (P2) — vacuum cyclicity of the Fock representation has two owners

**Location:** `TauCetiRoadmap/QuantumFoundations/README.md` line 15, "CAR occupation bases, Fock irreducibility and vacuum cyclicity", and §6.4 line 742, "Prove bosonic vacuum cyclicity and, on the real one-particle space, that `Φ_F(h)` … is essentially self-adjoint".

**Claim:** This roadmap owns and proves cyclicity of the vacuum for the symmetric Fock Weyl representation.

**Witness:** Main's `TauCetiRoadmap/OperatorAlgebraDynamics/README.md` line 163 lists "the cyclicity of its vacuum" among what D8 solely owns, lines 3672–3676 prove it from the exponential vectors, and lines 4141–4143 list it as consumed by QuantumFoundations Layer 6.

**Repair:** Line 15: "CAR occupation bases, Fock irreducibility, the Segal-field normalization adapter, …" and add to line 24's D8 deferral "… its Stone-generator field operators, vacuum characteristic function and vacuum cyclicity". Line 55: add "and cyclicity of its vacuum" after "vacuum characteristic function `exp(−‖h‖²/4)`". Line 742: replace "Prove bosonic vacuum cyclicity and, on the real one-particle space, that" by "Consume D8's cyclicity of the vacuum for `π_F`; prove, on the real one-particle space, that". The later use ("then on every vector from vacuum cyclicity and `‖W(h)‖ = 1`") stands, now resting on D8, which line 748's `*Needs:*` already names.

## R02 (P3) — permutation projectors cited to NoncompactQuantumSymmetry P.6 while main's D8 owns them

**Location:** `README.md` line 22, "the permutation projectors of completed tensor powers (P.6)"; line 65 (supplier table, "permutation projectors"); §6.2 line 711, "Consume NoncompactQuantumSymmetry P.6 for the permutation unitaries on `H^(⊗̂n)` and the projectors `P₊`, `P₋`"; §6.3 line 726; `*Needs:*` lines 716 and 732.

**Claim:** The permutation unitaries and the projectors onto `Symⁿ` and `Λⁿ` are supplied by NoncompactQuantumSymmetry P.6.

**Witness:** Main's OperatorAlgebraDynamics README line 163: D8 is "the single owner … of the permutation unitaries `U_σ` … with the symmetrizing and antisymmetrizing projections `P_s` and `P_a`"; lines 4136–4138 say QuantumFoundations §§6.2–6.4 consumes them (its `P₊`, `P₋`). A roadmap on main precedes an open one.

**Repair:** Line 22: delete "the permutation projectors of completed tensor powers (P.6);" and add to line 24's D8 deferral "the permutation unitaries `U_σ` of completed tensor powers with the projections `P_s`, `P_a` onto `Symⁿ(h)`, `Λⁿ(h)`". Line 65: drop "permutation projectors" and "P.6" from the row (P.1–P.5). Line 711: "Consume OperatorAlgebraDynamics D8 for the permutation unitaries `U_σ` on `H^(⊗̂n)` (left action, `U_σU_τ = U_(στ)`) and its projections `P_s`, `P_a`, written `P₊`, `P₋` here." Line 726: "built from OperatorAlgebraDynamics D8's projections". Lines 716 and 732: replace "NoncompactQuantumSymmetry P.6" by "OperatorAlgebraDynamics D8" (once in 732). Line 55: add the permutation unitaries and projections to what D8 supplies.

## R03 (P3) — the description counts five Lean companions and 29 admissions

**Location:** Pull-request description: "five native Lean companions provide representative signatures"; "independent review covered the entire mathematics, all five companions and named prerequisite interfaces"; "All five companions elaborate …, with only 29 intentional theorem admissions."

**Claim:** The folder carries five Lean files with 29 `sorry`'d theorems.

**Witness:** At 824bab8 the folder holds `README.md`, `Suggested.lean`, `metadata.toml`; commit ccf4051 deleted `CharacterRegularityTargets.lean`, `RadialHamiltonianTargets.lean`, `SelectedStateExamples.lean`, `SpinHamiltonianTargets.lean`. `Suggested.lean` has 9 declarations, 6 `sorry` warnings (lines 55, 64, 76, 88, 109, 126).

**Repair:** "The README fixes prerequisite ownership, conventions, domains and generality; `Suggested.lean` states the six headline theorems statable at the pins (the fundamental theorem of projective geometry in two forms, Kakutani–Mackey over ℂ and ℝ, finite Naimark dilation, Uhlhorn), each admitted, and its docstring names those not statable." and "Validation: `Suggested.lean` elaborates against the pinned Mathlib and Tau Ceti with six theorem admissions and no other warning."

## R04 (P3) — the description promises supplier proposals with public links

**Location:** Pull-request description: "Supplier proposals have immutable public links; their implementation is work to build in Tau Ceti."

**Claim:** The roadmap carries supplier proposals referenced by links.

**Witness:** `README.md` at 824bab8 contains no URL (`grep -c 'https\?://'` gives 0) and no supplier proposal: `## Exact supplier contracts` (lines 31–72) cites every supplier by roadmap name and section, or by pinned declaration and file.

**Repair:** Replace the sentence by "Suppliers are cited by roadmap name and section (VonNeumannAlgebras, CStarAlgebras, HilbertModules, OperatorAlgebraDynamics, SelfAdjointSpectralTheory, UnboundedOperators, NoncompactQuantumSymmetry and the others of the supplier table) or by pinned Mathlib and Tau Ceti declarations; no supplier is proposed here."

## Previous findings

- none: the previous review, of 824bab8, was an acceptance without findings.

## Verified sound

| Statement | Instances | Computed | Result |
|---|---|---|---|
| §6.4 vacuum cyclicity (R01), against D8 on main lines 3671–3676 | `h = ℂ`; `h = 0` | `W_F(f)Ω = e^(−|f|²/4)e(if/√2)`; at `f = −i√2·g`: `i(−i√2g)/√2 = g`, so `e(g)` is reached; `e(g) = (gⁿ/√n!)_n`, derivatives at `g = 0` give every basis vector. `h = 0`: `F = ℂΩ` | same statement in both roadmaps; one owner needed |
| §6.2 sector projections (R02), against D8's `P_s`, `P_a` and P.6 | `n = 2, d = 2`; `n = 3, d = 2`; `n = 0, 1` | `P₊ = (1+Σ)/2`, ranks `3 + 1 = 4`, sum `= 1`; `dim Sym³ = 4`, `Λ³ = 0`, `4 < 8`, sum `≠ 1`; trivial group, `P₊ = P₋ = 1` | README line 711 right; D8 and P.6 share the convention `U_σU_τ = U_(στ)`, so repointing changes no formula |
| `naimark_dilation_finite` (cited by the description's summary) | trine POVM on `ℂ²`, `E_i = (2/3)∣ψ_i⟩⟨ψ_i∣`; `n = 0`; `outcomes = 0` | `ΣE_i = (2/3)(3/2)·1 = 1`; `V` with rows `√(2/3)ψ_i†`: `VᴴV = 1`, `Q_i = e_ie_iᵀ`, `VᴴQ_iV = E_i`, `m = 3 ≤ 2·3 = 6`. `n = 0`: `m = 0`. `outcomes = 0`, `n ≥ 1`: `complete` reads `0 = 1`, no such `M` | holds; bound not vacuous |
| Description's counts (R03) | `Suggested.lean` at head | 9 declarations (3 definitions, 6 theorems), 6 `sorry` warnings; description says 5 files, 29 admissions | description wrong |

The rows for the untouched statements stand as in the previous review, of 824bab8.

- Description sentences checked against the head, 14: the summary block's three paragraphs agree with README lines 3, 380 (simple-function and Stinespring routes, no topology on Ω), 424–440 (complete additivity), 1015 (Friedrichs, resolvent kernel, Stieltjes inversion) and 1102 (what RelativisticQuantumFieldTheory receives); the Gudder–Boyce full-state and O(3) sentences agree with lines 338 and 621; two sentences fail (R03, R04).
- Cross-roadmap citations re-resolved against main at 1a19c9f: OperatorAlgebraDynamics D8 (lines 163, 3668–3702, 4136–4146; "D8 constructs no bosonic creation or annihilation operators and no finite-particle domain" still holds, and line 163 assigns them to this roadmap's §6.4, with `Γ`, `dΓ`, `N` to §6.3); SpecialFunctionsParabolicCylinder §1.3 and §1.6 (lines 329, 359, consumer line 1285). No other supplier on main that names this roadmap changed since 7 November. NoncompactQuantumSymmetry P.6 read at its open head (line 657).
- The worker's three Lean-name leads are supplier labels, resolved in the previous review; `overlaps.md` lists no dropped id, no open revision of this roadmap, no second copy.
- Gate at 824bab8, run again: every check `0`, `OK`. Dependency check: `depcheck: 244 roadmaps, 2229 edges, 0 problem(s)`, no `UPWARD`, `CYCLE` or `moved:` line.
- `lake env lean` on `TauCetiRoadmap/QuantumFoundations/Suggested.lean`: exit 0, six `declaration uses sorry` warnings and nothing else. The file is byte-identical to the one probed in the earlier rounds; the one-tactic probe and the `#check @` comparison were not repeated.
- `git diff --stat origin/main...HEAD` outside the folder: empty.
- Remark: the description's generated depends-on block lists no OperatorAlgebraDynamics entry because that roadmap is on main; after R02 the NoncompactQuantumSymmetry edge remains (P.1–P.5, M0–M6).

Overlap check: read OperatorAlgebraDynamics (main), NoncompactQuantumSymmetry (open), RelativisticQuantumFieldTheory (open), and searched UnboundedOperators, VonNeumannAlgebras (main and open revision), SelfAdjointSpectralTheory and SpectralManifolds by object (Uhlhorn, Kakutani–Mackey, Naimark dilation, Gudder–Boyce, bosonic creation operators: no other owner). Shared: vacuum cyclicity of `π_F`, owner OperatorAlgebraDynamics D8 (R01); permutation unitaries and projectors, owner OperatorAlgebraDynamics D8 (R02); bosonic creation and annihilation operators, `Γ`, `dΓ`, `N`, owner QuantumFoundations §§6.3–6.4, as D8 line 163 states.

Source independence: changed passages only; 0 passages changed, so 0 compared; the arrangement was not compared again (no layer added, removed or reordered); the wording and arrangement results of the full reviews stand.

## Not verifiable

- Alfsen–Shultz 1978 and 1998, Iochum–Shultz 1983, Davies–Lewis 1970, Łuczak–Podsędkowska 2015, Gudder–Boyce 1970: settled uncertified in the manifest; untouched this round.
- The seeded sample (§0.1, §0.2, §0.5, §1.3, §1.4, §5.2, §5.7, §6.1, §6.2, §7.1, §7.3, §8.2, §9.1, §9.2, §9.7) falls in no changed passage; only §6.2's supplier citation was re-resolved (R02).
- The description's "Topic and whitespace checks pass" and its account of how sources were transcribed: nothing in the head records either.

## Source issues

- none

## For the human reviewers

- **Licence.** The description says model readers "supplied Markdown from source images"; it does not say which sources or where the images came from. The README's uncertified sources are listed under `## Not verifiable`.
