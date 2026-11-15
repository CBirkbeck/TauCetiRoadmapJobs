# FIX-PKG-ModularCharactersAndBlocksPartII~2

One review, one finding.

## F01 (P3) — applied

Verified: `packages/ModularCharactersAndBlocksPartII/README.md` cites CharacterTheory §4.5 in Conventions, in §6.1 (change of system) and in the Layer 6 Dependencies. It names `IsDedekindDomain.HeightOneSpectrum.adicCompletion` and `UniformSpace.Completion.extension` in the §6.1 *Needs:* line. None of the three appeared in the Scope list or in a supplier subsection.

Changes (old → new):
- Scope, CharacterTheory bullet: "…§4.4 (… field of values)." → adds ", §4.5 (Brauer's splitting field: a field of characteristic zero containing a primitive `exp(G)`-th root of unity splits `G`)".
- `### From TauCetiRoadmap.RepresentationTheory.CharacterTheory`: adds §4.5. The new entry states what is consumed and where it is used (Conventions, §6.1 with `K_w`).
- `### From Mathlib`: adds both declarations with their files and hypotheses.
- Same pattern in Layer 6 `### Dependencies`: it named only `Ideal.exists_smul_eq_of_isGaloisGroup`. It now also names the two completion declarations for the change of system.

The reviewer's wording for §4.5 was made more precise, for two reasons:
- **What the contract describes.** The section that CharacterTheory §4.5 consumes from Tau Ceti, `FDRep.exists_simple_nonempty_iso_baseChange_of_isPrimitiveRoot` (`TauCeti/RepresentationTheory/Induction/Cyclotomic/SplittingField.lean` line 107), has these hypotheses:
  - `CharZero K`;
  - a primitive `n`-th root of unity with `exp G ∣ n`;
  - an algebraically closed extension `L`;
  - `K`, `L` and `G` in one universe.

  Its conclusion is an absolutely irreducible model over `K`. The contract now says exactly this. It also says that §4.5's own target transports the realisation along `ULift`/`Shrink` to a group in another universe.
- **The `UniformSpace.Completion.extension` description.** Agreement with `f` on `α` is `UniformSpace.Completion.extension_coe` (line 446). That lemma needs `T0Space β` and uniform continuity, not completeness. Uniform continuity of the extension (line 437) needs only `CompleteSpace β`.

Other places checked for the same omission:
- Every `CharacterTheory §`, `InductionRestriction Layer`, `IG.` and `base §` citation in the body was compared with the Scope list and the contracts. Only §4.5 was missing. The base §§ cited are 0.2, 1.1–1.3, 2.1–2.4, 3.1, 4.1–4.3, 5.1, 6.1–6.3, 7.1–7.2 and 8.1–8.2, all listed.
- Every backticked dotted library name in the README was compared with the front matter. Only the two completion names were absent. All other Mathlib and Tau Ceti names are in the Scope's "Already in the libraries" list, which the `From Tau Ceti` contract adopts, or in `From Mathlib`.

## Adversarial pass on the added text

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §4.5 contract: char-0 `K` containing a primitive `exp(G)`-th root of unity splits `G`, and so does every extension | `G = 1`; `G = C₃`, `K = ℚ₂`; `G = Q₈`, `K = ℚ(i)`; `G = S₃`, `K = ℚ₂(ζ₃) ⊆ K'` with residue field `𝔽₄(T)` | `exp = 1`, root `1`, every char-0 field splits `1`. `exp = 3`: `ℚ₂` has no primitive cube root (`2 ≢ 1 mod 3`), hypothesis fails, and indeed `ℚ₂[C₃]` has an irreducible of degree 2, values `2, −1, −1` (the README's own §6.1 Check). `exp = 4`: `i ∈ ℚ(i)` and the degree-2 character of `Q₈` is realised over `ℚ(i)` (Schur index 1). `exp = 6`: `ζ₆ = −ζ₃² ∈ K'`, and §4.5 applied to `K'` itself gives the splitting, three characters of degrees 1, 1, 2 (`1 + 1 + 4 = 6`) | true; "every extension" holds because an extension is again of characteristic zero and contains the root | wording made exact (above) |
| `adicCompletion` contract: completion of `Frac R` at a height-one prime | `R = 𝓞 F`, `F = ℚ(ζ₃)`, `v = (2)` | variables at `Completion.lean` line 34: `[IsDedekindDomain R] [IsFractionRing R K] (v : HeightOneSpectrum R)`. Structure at line 52 wraps `(v.valuation K).Completion`, which is `UniformSpace.Completion (WithVal v)` (`Topology/Algebra/Valued/WithVal.lean` line 471). `2` is inert in `ℤ[ζ₃]` (`X² + X + 1` is irreducible over `𝔽₂`), so the completion is `ℚ₂(ζ₃)` with residue field `𝔽₄`, matching Conventions | as stated | none |
| `UniformSpace.Completion.extension` contract | `f` uniformly continuous into complete T0 `K'`; `f` not uniformly continuous | line 429 is the definition, a junk constant off uniformly continuous `f`. Line 437 is `uniformContinuous_extension` under `[CompleteSpace β]` only. Line 446 is `extension_coe` under `[T0Space β]` and `hf`. `K'` is the fraction field of a complete DVR, so complete and Hausdorff. `F_H → K'` is a ring map, continuous for the restricted valuation (equivalent to `w`-adic), hence uniformly continuous | hypotheses as stated | "when moreover" corrected to the exact hypotheses |
| Layer 6 Dependencies now lists the completion names | — | each item of the §6.1 *Needs:* line (base §§, CharacterTheory §§4.3, 4.5, Mathlib, Tau Ceti) now appears in the Dependencies and in a contract | consistent | added |

No theorem, definition or Check changed, and `Suggested.lean` did not change. No worked example uses a changed object. The §6.1 Check with `k' = 𝔽₄(T)` uses `K_w = ℚ₂(ζ₃)`, as recomputed in row 2.

## Checks

- **Elaboration.** Ran `lake env lean` on `packages/ModularCharactersAndBlocksPartII/Suggested.lean` from the content checkout (file unchanged): exit 0, 16 warnings, all "declaration uses `sorry`", no errors. No `TauCeti.*` build was needed.
- **Signatures.** All 20 declarations went through `#check @TauCetiRoadmap.ModularCharactersAndBlocksPartII.<name>` in one scratch copy, elaborated once (exit 0). The elaborated types are identical to `scratch/signatures.md`, and no binder is lost. The file did not change, so the README agreement verified by the review stands.
- **Dependency check** (`gate --depcheck … --movable`), output:

      depcheck: 246 roadmaps, 2245 edges, 0 problem(s)

  No UPWARD, CYCLE or `moved:` line.
- **Citations** (`roadmaps resolve`) after the edit: no cross-roadmap citation and no Lean name found nowhere. Before the edit the worker listed four leads (`IsGlaubermanFamily.adjoin_range_eq`, `.exists_sign_of_isCyclic`, `.index_mul_degree_eq`, `.restrict_pairing_ne_zero`). All four are this roadmap's own declarations, confirmed by the `#check` pass.
- **Gate failures listed in the brief:** none.

## For the maintainer

- No name that another roadmap cites changed. No target, layer or section id changed. `design/plan.json` is unchanged (no new supplier gap: the three items exist on main and at the Mathlib pin).
- Ownership against open pull requests needed no new check: no construction was added, only supplier lists were completed.
- The review's "For the human reviewers" notes (licence of martinez and sambale; LocalFiniteGroupTheory L3) were not acted on, as the brief directs.
