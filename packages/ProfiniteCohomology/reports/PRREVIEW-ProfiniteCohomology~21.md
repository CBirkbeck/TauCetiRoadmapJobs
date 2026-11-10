# Review of ProfiniteCohomology (pull request #616 at ed9bdba)

**Verdict:** accepted

Incremental re-review of the 32 lines changed in the folder since `fb3e3c2` (`README.md` 10 lines, `Suggested.lean` 22 lines). No finding remains and the gate passes.

## Previous findings

- R01 — repaired: `Suggested.lean:6` adds the `ClassModule.Sylow` import; `:312`–`:318` ends `:= TauCeti.abelianizationProPClass_generates Fact.out hG hV`; `:571`–`:577` ends `:= TauCeti.galoisEvens_galoisRes K L σ hdeg y`; `README.md:473`–`:481` says both are proved from the Tau Ceti theorems.

The repair introduced no new problem: the two statements are unchanged character for character (only the bodies changed), the import exists at the pin, and all four importing modules still compile (below).

## Verified sound

**The change.**
- `Suggested.lean`: one added import, two `by sorry` bodies replaced by term proofs, and the last paragraph of the module docstring (`:76`–`:87`) rewritten to say that the two theorems are proved by Tau Ceti theorems from which they differ in form (primality as a `Fact`; the pairing written `cup (f2Pairing _)`). Both descriptions of the difference are exact against the pinned declarations quoted below.
- `README.md:473`–`:481`: the supplier-contract preamble now says `Suggested.lean` proves the two theorems from the Tau Ceti theorems, and that the two universe-independence theorems of 11.2 are the only statements carried with `sorry` and the only ones the cited revisions do not prove. `grep sorry Suggested.lean` gives exactly `:281` and `:289` (the two 11.2 theorems) besides the docstring's own sentence at `:38`, so the README sentence is exact. No other README line mentions `sorry`; the Downstream consumers entries for the two names (`README.md:4086`–`:4089`, `:4115`–`:4118`) describe them as the Tau Ceti statements and needed no change.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ProfiniteCohomology'` is empty: nothing changed outside the folder. `lake-manifest.json` pins Tau Ceti `2fd255d9` and Mathlib `1b1ccf4b`, the revisions `README.md:470`–`:471` names.

**Gate, dependency check, elaboration.**
- Gate rerun at this head: every counter `0`, `OK`. The worker's gate, with the targeted build of this module, ClassFieldTheory and QuadraticFormInvariants, reports `build=0 OK`.
- Dependency check:

```text
depcheck: 235 roadmaps, 2268 edges, 0 problem(s)
```

  No UPWARD, CYCLE or `moved:` line.
- `lake env lean` on `Suggested.lean`: exit 0, two warnings, both `declaration uses sorry`, at `:278` (`cohomologicalDimensionAt_universe_eq`) and `:286` (`strictCohomologicalDimensionAt_universe_eq`). The previous head had four.
- Importers. `TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean` and `TauCetiRoadmap/ClassFieldTheory/Suggested.lean` compile in the gate's targeted build. `Completed/LocalGaloisGroups/Suggested.lean` (which calls `abelianizationProPClass_generates`) and `Completed/ProfiniteProPGroups/Suggested.lean`: `lake env lean` on each at this head, exit 0, 0 errors. This closes the item the previous report left under "Not verifiable".

**Library declarations opened at the pin** (2).
- `TauCeti/RepresentationTheory/Homological/ContCohomology/CohomologicalDimension/ClassModule/Sylow.lean:156`: `abelianizationProPClass_generates (hp : p.Prime) (h : strictCohomologicalDimensionAt.{u} p G ≤ 2) (hV : IsOpen ↑V)`, with the conclusion `zmultiples (abelianizationProPClass p G V hV) = ⊤ ∧ Nat.card (H2 (G ⧸ V) (Additive (abelianizationProP p G V))) = p ^ padicValNat p (Nat.card (G ⧸ V))`: the roadmap's conclusion, with `hp` explicit where the roadmap has `[Fact p.Prime]`.
- `TauCeti/FieldTheory/GaloisCohomology/EvensNorm.lean:143`: `galoisEvens_galoisRes (hL : Module.finrank K L = 2) (y)`, `galoisEvens K L σ hL (galoisRes K L σ 1 y) = (trivialF2TopPairing _).cup 1 1 y y + (trivialF2TopPairing _).cup 1 1 (galoisCharacter K L σ hL) y`: the roadmap's statement up to unfolding its `cup (f2Pairing _)`, as the accepted term proof shows.

**Elaborated signatures.** The elaborated types of the two changed declarations (`scratch/signatures.md`) keep every binder: `[Fact p.Prime]`, `[CompactSpace G]`, `[TotallyDisconnectedSpace G]`, `scd_p p G ≤ 2`, `[V.Normal]`, `hV` for the first; `[FiniteDimensional K L]`, `σ`, `hdeg` for the second. They agree with 11.8 and 13.3 of the README. The tools report 0 of 57 declarations with a lost section binder.

**Padding.** The two theorems now close with one library term, which is what a consumer-interface name is: `QuadraticFormInvariants/Suggested.lean` and `Completed/LocalGaloisGroups/Suggested.lean` call them by this roadmap's names, so they cannot be deleted from this folder, and they have the same form as the sibling `galoisRes_eq_zero_iff` (`:582`–`:588`) passed by earlier reviews. The module docstring and Downstream consumers both say they are interface names, not headlines. The two headlines of 11.2 are untouched; the previous report's probe (`rfl`, `simp`, `exact?`, `infer_instance` all fail) stands.

**Seeded sample.** Of the fifteen sampled targets (0.1, 0.3, 1.1, 4.2, 5.1, 5.2, 5.3, 7.3, 8.2, 8.4, 9.8, 10.2, 10.4, 11.1, 13.3) only 13.3 touches the diff: its Lean statement `galoisEvens_galoisRes` is unchanged and is now proved from the pinned theorem. The README text of all fifteen is unchanged since the reviews that passed it.

**Overlaps and ownership.** `scratch/overlaps.md`: no cited id dropped, none defined only by an open revision, none dropped by this pull request. The pin-bump pull request conflicts in this folder's `Suggested.lean`; the description's merge-order block states the order (this pull request first). The diff adds no object and no declaration name, so the ownership audit of the earlier reviews stands. The 16 names in `scratch/citations.md` are unchanged README text.

**The description.** It now matches the head: 591 lines, 57 declarations, two `sorry`s, pins `2fd255d9` and `1b1ccf4b`, and the two theorems "proved from" the Tau Ceti theorems. The stale sentences the previous report remarked on are gone.

**Remarks on text needing no change.**
- `Suggested.lean:80`–`:81`: after the repair the list "three short definitions …, the coordinate table `WreathC2.sectionTable` with the section `wreathSection` it defines" lacks an "and" before its last item. The meaning is clear.
- The generated `STATUS.md` (main's copy) reports a later Tau Ceti revision than the pin; untouched by this pull request.

**Adversarial table.** The diff changes no statement; it changes two proofs. The first two rows were computed in this review; the others are carried from the previous report (r20), whose rows carry the values.

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| `abelianizationProPClass_generates` (`:312`) | term `TauCeti.abelianizationProPClass_generates Fact.out hG hV` at pin `2fd255d9`; `G = ℤ_p ⊇ V = pℤ_p`; `p ∤ #(G ⧸ V)` | elaborates, no `sorry` warning at `:312`; `H²(C_p, ℤ_p) = ℤ/p`, order `p = p^{v_p(p)}`, generated by the carry class; coprime index: `p⁰ = 1` and `H²` of a prime-to-`p` group in a pro-`p` module is `0`, generated by `0` | proved by the pin | none |
| `galoisEvens_galoisRes` (`:571`) | term `TauCeti.galoisEvens_galoisRes K L σ hdeg y` at pin `2fd255d9`; `𝔽₉/𝔽₃`; `y ↦ y + χ` | elaborates, no `sorry` warning at `:571`; both sides in `H²(Ẑ, 𝔽₂) = 0`; `res(y + χ) = res y` and `(y+χ)² + χ(y+χ) = y² + χy + 2χy + 2χ² = y² + χy` | proved by the pin | none |
| 11.2 universe equality (`:278`, `:286`, headline) | r20: `G = 1`, `C_p`, `u = 0`; four one-tactic probes | r20: `0 = 0`, `⊤ = ⊤`, one term at `u = 0`; all probes fail | true, not padding | none |
| `README.md:469`–`:472` cited revisions | manifest at this head | Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`: equal | exact | none |
| `README.md:479`–`:481` "only statements carried with `sorry`" | count in `Suggested.lean` | 2 `sorry` bodies (`:281`, `:289`), 2 warnings | exact | none |
| 0.3 section and extension | r20: `ℤ_p → ℤ/p` | `s((p−1)+1) = 0 ≠ p` | hypotheses needed | none |
| 1.4 compatible pairs | r20: `C₂`, `ℤ`, `×2`, `×3` | `1 ↦ 2 ↦ 6` | direction as in Mathlib | none |
| 2.2 explicit functoriality | r20: `C₄ ↠ C₂`, `1 ↪ C₄` | `χ ↦ (0,1,0,1) ↦ 0` | consistent | none |
| 2.4 conjugation | r20: `S₃ ⊇ A₃`, `𝔽₃` | `τ : f ↦ −f`; `H¹(A₃)^{C₂} = 0 = H¹(S₃)` | inner acts trivially | none |
| 3.3, 3.4 comparison and transport | r20: `∏ℕ C₂`; `C₂ ⊂ C₄` | `0` not isolated pointwise; parity restricts to `0` on both sides | as stated | none |
| 6.6 `cor ∘ res = index` | r20: `C₂ ⊇ 1`; `S₃ ⊇ C₂` | `1 ↦ 1 ↦ 2`; `res ∘ cor : 1 ↦ 3 = 1 + 2` | order as stated | none |
| 8.3 graded commutativity | r20: `C₂×C₂`, `𝔽₂`; `C₃`, `𝔽₃` | `(x⌣y)(a,b) = 1`, `(y⌣x)(a,b) = 0`, `d¹c(a,b) = 1`; `−2χχ = χχ` | homotopy correct | none |
| 8.7 duality pairings | r20: `𝔽₃`; sign | `(id,1) ↦ 1`; `(−id)(−1) = 1` | as stated | none |
| 9.4 dictionary | r20: `𝔽_p`; `ℚ(∛2)` | `U_{𝔽_{pⁿ}} = nẐ`, `Ẑ/4Ẑ ≅ ℤ/4`; index 3, not normal | bijective, inclusion-reversing | none |
| 9.5 Hilbert 90 | r20: `ℂ/ℝ` | `w = 1 + z` gives `w/w̄ = z`; `z = −1`: `w = i` | `H¹ = 0` | none |
| 9.8 mod 2 | r20: `𝔽₃`; `ℝ` | `{±1} ≅ 𝔽₂`; Frobenius sends `√−1` to `−√−1` | no `CharZero` needed | none |
| 11.3 `p`-primary | r20: `⊕ℕ ℤ` | `H¹ ∋ (p^{−k})`, killed by no `pᵏ` | compactness needed | none |
| 11.7 strict criterion | r20: `ℤ_p`, `n = 1, 2` | `H²(p^rℤ_p, ℤ)(p) = ℚ_p/ℤ_p ≠ 0`; `H³ = 0` | holds for every `n` | none |
| 12 sign of `δ` on the right | r20: `(m,n) = (2,1)`, `(1,2)` | `(−1)¹`, `(−1)²` | excludes `(−1)^m`, `(−1)^{mn}` | none |
| 13.1 index-two form | r20: `C₄ ⊇ C₂` | `Σ_τ ν(τ,σ) = 1 ≠ 0`, extension `C₈` | Checks correct | none |
| 13.2 odd-characteristic Check | r20: `C₃ × C₂ ⊇ C₃`, `𝔽₃` | `res N(a) = a²`; `N(2a) = N(a) ≠ 2N(a)` | non-additive | none |

## Not verifiable

- **NSW and Serre, *Galois Cohomology*.** Settled as `uncertified`, cited by locator; the diff adds no locator into either.
- **Ribes–Zalesskii, Brown, Koch, Serre *Local Fields*.** Not in the manifest or the cache; the diff does not touch their citations.

## Source issues

- none
