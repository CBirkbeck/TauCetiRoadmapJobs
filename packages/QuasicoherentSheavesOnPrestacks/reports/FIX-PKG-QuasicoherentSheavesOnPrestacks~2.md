# FIX-PKG-QuasicoherentSheavesOnPrestacks~2

One review, five findings, all P3. All five were verified against the sources, the supplier text and the pins before any edit. Four are applied as asked. F03 is applied in a more general form than the review proposed, and also cites the source for coproducts in `CAlg`.

## F01 (P3) — applied

Verified: in `BZFN`, the page marker `=== page 24 ===` is at BZFN line 1159 and the next is at line 1215. The Chevalley sentence at BZFN line 1205 therefore lies on p. 24, inside the proof of Corollary 3.22.

Change: in `packages/QuasicoherentSheavesOnPrestacks/README.md` (gap `chevalley-quasiprojective-quotient`), "BZFN Corollary 3.22, BZFN line 1205" → "BZFN Corollary 3.22, p. 24".

Same pattern elsewhere: the `detail` of that gap in `design/plan.json` (top-level `gaps` list) carried the same extraction-line locator, and "(BZFN line 1205)" → "(p. 24)" there too. A grep of README, Suggested.lean, metadata, sources and plan for `<source> line N` found no other such locator.

## F02 (P3) — applied

Verified: the README cites 18 Stacks tags. 0FXR, 0FXS, 0FXT and 02JR are in *Morphisms of Schemes*; 023Q and 0245 are in *Descent*; 0A0J, 08D3, 06Z0, 08DZ, 08E8, 09IS, 0BQR, 09M1, 08EU and 08IB are in *Derived Categories of Schemes*, each found in the cached chapter (for example 09IS at Stacks line 1806 and 09M1 at Stacks line 1969); 06WG and 06WT are in *Sheaves on Algebraic Stacks*. No tag is in *Derived Categories of Spaces*, and the `version_note` in `sources.toml` lists four chapters.

Change: in References, the chapter list "…, *Derived Categories of Schemes*, *Derived Categories of Spaces* and *Sheaves on Algebraic Stacks*" → "…, *Derived Categories of Schemes* and *Sheaves on Algebraic Stacks*".

## F03 (P3) — applied differently

Verified on main (`TauCetiRoadmap/EnhancedDerivedSheaves/README.md`):
- E5:animation.4 (`animatedToCAlg`) states only that θ preserves sifted colimits.
- E5:animation.1 (`animationExtension`) says the extension preserves all colimits exactly when the input preserves finite coproducts.
- The supplier's own proof route for `animatedToCAlg` notes that the inclusion of polynomial rings preserves finite coproducts.

So the claim that θ preserves all colimits is true, but the README attributed it to the supplier and left out the step that proves it.

Changes:
- Supplier contract: "(θ, which preserves colimits)" → "(θ, which preserves sifted colimits)".
- 1.1 API bullet: "it is the colimit-preserving extension … (`animationExtension`)" → θ is the sifted-colimit-preserving extension of the inclusion of finitely generated polynomial rings into `CAlg^cn`, and that inclusion preserves finite coproducts:
  - the empty coproduct is ℤ, initial in both;
  - a binary coproduct in `CAlg^cn` is `A ⊗ᴸ_ℤ B` (HA Proposition 3.2.4.7, p. 371), and `ℤ[x₁…x_m] ⊗ᴸ ℤ[y₁…y_n]` is the discrete `ℤ[x, y]`.

  Hence θ preserves all small colimits.

Why this differs from the review's wording: the review used `ℤ[x] ⊗ᴸ ℤ[y]` and gave no source. That treats one variable on each side, leaves out the empty coproduct, and does not say why the coproduct is a tensor product. The new text covers all finitely generated polynomial rings and both missing points. HA Proposition 3.2.4.7 was added to the `HA` locator list in `sources.toml` (`cited_for` already contains 1.1).

Same pattern elsewhere: 3.1 ("For θ, which preserves colimits and homotopy groups (1.1)") cites 1.1, which now carries the argument, so it needs no change. No other place attributes the colimit claim to the supplier.

## F04 (P3) — applied

Verified: the binder `[Fact p.Prime]` is redundant.
- `Γ` is a group, so it is nonempty, and with `Finite Γ` this gives `Nat.card Γ > 0` (`Nat.card_pos`, Mathlib/SetTheory/Cardinal/Finite.lean:87).
- So `p ∣ Nat.card Γ` forces `p ≠ 0`.
- `CharP.char_is_prime_or_zero` (Mathlib/Algebra/CharP/Defs.lean:246; it needs a nontrivial semiring without zero divisors) then gives `p.Prime`.

I checked this mechanically with a scratch `example` having exactly the remaining binders and conclusion `p.Prime`, proved by those two lemmas. It elaborated with no error.

Changes:
- `Suggested.lean`: `[Fact p.Prime]` deleted from `not_preservesCoproducts_trivial`. The docstring now says "…divisible by `p`, so that `p` is prime."
- README, same pattern: Cauchy's theorem (`exists_prime_orderOf_dvd_card`, which takes `[Fact p.Prime]`) is used by the 8.5 witness and by the 8.6 route. I added these:
  - the 8.5 coinduced-witness bullet now says why p is prime;
  - `CharP.char_is_prime_or_zero` is in the Mathlib supplier contract (with file and line), in the *Needs* lines of 8.5 and 8.6, and in the Layer 8 Dependencies;
  - the contract entry for `exists_prime_orderOf_dvd_card` now says it takes primality as `Fact p.Prime`.

## F05 (P3) — applied

Verified at the pinned Tau Ceti: `TauCeti.AlgebraicGeometry.Descent.qcohPseudofunctor : SchPseudofunctor` is at TauCeti/AlgebraicGeometry/Descent/QuasicoherentSheaf.lean:139. The stack property is not stated at the pin: line 22 of that file only says it "can be stated as" `qcohPseudofunctor.IsStack Scheme.fpqcTopology`. SchemeAndStackFoundations §1.1 on main cites the pinned declaration and owns `qcoh_fpqc_descent`.

Changes:
- New `### From Tau Ceti` bullet: `TauCeti.AlgebraicGeometry.Descent.qcohPseudofunctor` with its file:line. It is the pseudofunctor `T ↦ QuasicoherentSheaf T` with pullback; SchemeAndStackFoundations §1.1 proves it is a stack, and 3.2 compares its affine case with hearts.
- The SchemeAndStackFoundations §1.1 bullet → "`qcoh_fpqc_descent` (Tau Ceti's `Descent.qcohPseudofunctor` is a stack for Mathlib's `fpqcTopology`); 3.2 compares its affine case with hearts."

The README mentions `qcohPseudofunctor` nowhere else.

## Checks

- **Elaboration:** `lake env lean packages/QuasicoherentSheavesOnPrestacks/Suggested.lean`, run from the content checkout, exits with exactly one diagnostic: `Suggested.lean:79:8: warning: declaration uses 'sorry'`. No `TauCeti.*` import is needed or present.
- **`#check @` comparison:** one scratch file contained the declaration, `#check @not_preservesCoproducts_trivial` and the primality `example`, and it elaborated once. The elaborated type has these binders: `k : Type u`, `Field k`, `Γ : Type u`, `Group Γ`, `Finite Γ`, `p : ℕ`, `CharP k p`, `p ∣ Nat.card Γ`, `HasDerivedCategory (Rep k Γ)` (morphism universe w), and the conclusion `¬ ∀ J : Type w, PreservesColimitsOfShape (Discrete J) (preadditiveCoyoneda.obj (op ((DerivedCategory.singleFunctor (Rep k Γ) 0).obj (Rep.trivial k Γ k))))`. No section binder was lost. The only change from the previous signature is the deleted `Fact p.Prime`. The type now matches README 8.6 ("a field k of characteristic p and a finite group Γ whose order is divisible by p, both u-small"), which never assumed primality separately.
- **Dependency gate** (`gate --depcheck … --movable`), full output:

  ```
  depcheck: 251 roadmaps, 2385 edges, 0 problem(s)
  ```

  No UPWARD, CYCLE or `moved:` line.
- **Citations** (`roadmaps resolve` on the edited README): "Cross-roadmap citations found nowhere: None. Lean names found nowhere: None." The 12 leads in `scratch/citations.md` came from an earlier run; the review had already resolved them as supplier names. The new names `CharP.char_is_prime_or_zero` and `TauCeti.AlgebraicGeometry.Descent.qcohPseudofunctor` were opened at the pins (file:line above).
- **Style:** grep found no LaTeX delimiters, no process words and no extraction-line locators in the README. `sources.toml` parses as TOML and `design/plan.json` as JSON. Only the top-level `gaps` list of `design/plan.json` changed: one `detail` string.

## Adversarial pass on changed statements

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| 1.1: the inclusion of polynomial rings into `CAlg^cn` preserves finite coproducts | empty family; `ℤ[x], ℤ[y]`; `ℤ[x₁,x₂], ℤ[y]`; negative control `𝔽_p, 𝔽_p` (not polynomial) | empty: ℤ, the unit, is initial in `CAlg^cn` (HA 3.2.4.7, the unit of `CAlg(C)` is initial) and initial among polynomial rings. Binary: `Tor_1^ℤ(ℤ[x], ℤ[y]) = 0` (ℤ[x] free), `π₀ = ℤ[x, y]`, `π_i = 0` for `i > 0`. Two-plus-one variables: `ℤ[x₁,x₂,y]`, discrete. Control: `π₁(𝔽_p ⊗ᴸ 𝔽_p) = 𝔽_p ≠ 0`, so freeness is used; this agrees with the 1.1 Check that ι does not preserve this pushout | holds; θ preserves all small colimits by `animationExtension`'s criterion |
| 1.1 vs the Check "products are limits, not colimits" | `θι(ℤ × ℤ)`; coproduct `θιℤ ⊔ θιℤ` | `π₀ = ℤ²` for the product; coproduct `ℤ ⊗ᴸ_ℤ ℤ = ℤ` | consistent with the new sentence (coproduct = tensor product) |
| 8.5/8.6: p is prime from `CharP k p` and `p ∣ |Γ|` | p = 0; p = 1; p = 4; p = 2 with Γ = ℤ/2, k = 𝔽₂; p = 3 with Γ = S₃, k = 𝔽₃ | p = 0: `0 ∣ n` iff n = 0, but `|Γ| ≥ 1`, so the hypotheses are inconsistent. p = 1: `CharP k 1` makes `1 = 0` in k, impossible in a field. p = 4: a field has prime or zero characteristic, so `CharP k 4` is impossible. p = 2 and p = 3: prime, `2 ∣ 2`, `3 ∣ 6`, and Cauchy gives the generator of ℤ/2 and a 3-cycle | the binder set without `Fact p.Prime` admits exactly the same instances; the theorem is unchanged in truth |
| Lean `not_preservesCoproducts_trivial` after the edit | the scratch `example` | `p.Prime` derived from the remaining binders, no error | statement equivalent to the previous one; README and Lean agree |
| F05 contract bullet | pinned file | `qcohPseudofunctor : SchPseudofunctor := isQuasicoherent.fullsubcategory` at line 139; `qcohPseudofunctor_obj T = Cat.of (QuasicoherentSheaf T.as.unop)` (line 143); no `IsStack` theorem for it at the pin | as stated: Tau Ceti has the pseudofunctor, the supplier owns the stack theorem |
| F01 locator | BZFN page markers | page 24 runs from BZFN line 1159 to footer "24" at line 1214; Cor 3.22 proof at lines 1202–1208 | p. 24 |

## Ownership and overlaps

No new target was added, so no ownership question arises. The objects touched were checked against their owners, with these results:
- θ is EnhancedDerivedSheaves E5:animation.4, on main.
- `qcohPseudofunctor` is pinned Tau Ceti.
- `qcoh_fpqc_descent` is SchemeAndStackFoundations §1.1, on main.
- The Mathlib lemmas are pinned.

`scratch/overlaps.md` lists no pull request that changes this roadmap and no dropped id. Nothing moved down from a later roadmap.

## For the maintainer

- The fully qualified Lean name `TauCetiRoadmap.QuasicoherentSheavesOnPrestacks.not_preservesCoproducts_trivial` is unchanged. Its signature lost the binder `[Fact p.Prime]`. No other roadmap cites it (the review's `roadmaps grep` found no match).
- `target.md` still lists "`Descent.qcohPseudofunctor`, `qcoh_fpqc_descent`" under SchemeAndStackFoundations §1.1. It is not among the files this job may edit, and it is an input rather than the roadmap.
- No source text was missing. `needs-references.toml` was not written.
