# FIX-RT-ExoticMonoidalStructuresAndAbstractAutomorphicity~2

## RT-ExoticMonoidalStructuresAndAbstractAutomorphicity~2a/F02 (P2) — applied

The witness holds. §11.2 asserted invariance under a "global intertwiner" that it never constructed, and §10.5 is local only. Dor21 line 2066 (Remark C.2.5, pp. 43–44) shows that the local trace does not respect distinguished vectors. A global map exists only after inverting ηv(w), with targets as in Dor21 lines 2082 and 2084. Changes to §11.2 of `packages/ExoticMonoidalStructuresAndAbstractAutomorphicity/README.md`:
- The Lnorm reference 1Ov(λ)1Ov×(y) is now stated.
- New paragraph: the localizations A[η⁻¹] and A[η(w)⁻¹]; per-place completion through ηv(w) with reference preservation; the natural maps Φ⁻î(A)→underlineHomT(Lnorm⊗T Lnorm(w),A[η(w)⁻¹]) and M_A:î(A)→î(A(w)[η⁻¹]); the identification IT(w)≅IT; invariance of the unit image under M:î(IT[η⁻¹])→î(IT[η⁻¹,η(w)⁻¹]). Locator: Dor21 Remark C.2.5 and Remark C.3.9 (Dor21 line 2066; Dor21 line 2156).
- Interface bullet "invariant under the normalization-aware global intertwiner" → two bullets with these exact sources and targets.
- First Check → computed: ηv(1Ov×⊗1Ov×)=1Ov×(λ)1Ov×(y), which is 0 at (0,1), against reference value 1. This holds at every place and for ηv(w) too.

## RT-ExoticMonoidalStructuresAndAbstractAutomorphicity~2a/F01 (P3) — applied

The witness holds: the zero map satisfies rational balancing, the transpose symmetry and the codomain S̃. Old: the three non-discriminating §6.4 Checks. New: three computed Checks.
- An indicator isolating (0,1) gives m([Ψ])(Γ·1)=1, against 0 for the zero map and c for c·m.
- A coefficient-1/2 pair at (E₀₁,1) and (E₁₀,1) gives 3 before and after transposition, against −1 and 1 for an antisymmetric model.
- Over 𝔽₃(t) with the residue character of dt and b=t⁻¹ at t=0, the value at u(b) is ζ (via §0.4's phase e(by det m)), against 1 for a constant output and ζ² for the inverse character.

The S̃-codomain remark is kept inside the third Check.

## RT-ExoticMonoidalStructuresAndAbstractAutomorphicity~2b/F01 (P3) — applied

Verified against the Dor23 extraction: line 768 is Lemma 2.19, line 854 is Remark 2.21, line 967 is equation (3.1), line 976 is Definition 3.2, line 2335 is inside the proof of Proposition 4.16, line 2350 is Proposition 4.19, line 2357 ends Remark 4.20 and line 2359 is Corollary 4.21. Edits in README §1.3, §2.2, §7.3 and §7.4:
- 768→854
- 967→976
- 2335→"2350; Dor23 line 2411". Line 2411 is "Proof of Proposition 4.19" on p. 48, matching the README's "proof p. 48".
- 2357→2359

Line 215 keeps line 768 because it cites Lemma 2.19 itself.

## RT-ExoticMonoidalStructuresAndAbstractAutomorphicity~2b/F02 (P3) — applied

Verified on main: `Completed/RestrictedProducts/README.md` puts Layer 1 (functoriality, change of family, reindexing) at line 268 and Layer 2 (packaging and the away-`S` decomposition) at line 305. Changes:
- Scope paragraph: "Layer 1 … and away-S decomposition" → "Layers 1–2 … reindexing (Layer 1) and the away-S decomposition (Layer 2)".
- Supplier contract: "Layer 1 and Change of family …" → "Layer 1, Layer 2 and Change of family …", with each item attributed to its layer.

The `*Needs:*` lines citing Layer 1 consume only transports and are unchanged.

## Checks

- `lake env lean packages/ExoticMonoidalStructuresAndAbstractAutomorphicity/Suggested.lean` (run from the content checkout): succeeds. The only output is `Suggested.lean:77:8: warning: declaration uses 'sorry'` for `idempotent_defect_eq_id`. The only change to `Suggested.lean` is the `module` header line described below. Its two declarations (`UnitFreeTensor`, `idempotent_defect_eq_id`) keep the elaborated signatures recorded in the job's signatures file, with all binders explicit and no section variables, so no new `#check` comparison was needed.
- Dependency check output: `depcheck: 186 roadmaps, 1219 edges, 0 problem(s)`. There are no UPWARD or CYCLE lines.
- Gate failure (warning: `Suggested.lean` imports `Mathlib`, which is designed for the module system; consider adding `module`): repaired by adding the line `module` (and a blank line) before `import Mathlib` at the top of `Suggested.lean`. The import header stays the single line `import Mathlib`, as the import rule requires. Nothing else in the file changed. The declarations therefore move down two lines. I chose the plain `import` over `public import Mathlib` with `@[expose] public section` so that the header follows the import rule literally. Both forms elaborate at the pins.

## Adversarial pass on new or changed statements

| Statement | Instances | Computed values | Result |
|---|---|---|---|
| §6.4 Check 1 | Isolating indicator at (0,1); zero map; c·m | Θ(Ψ)=Ψ(0,1)=1; 0; c | discriminating |
| §6.4 Check 2 | 1·1_{N₁}+2·1_{N₂} at (E₀₁,1), (E₁₀,1); transpose; antisymmetric model | 3, 3; −1, 1 | discriminating |
| §6.4 Check 3 | F=𝔽₃(t); e = residue character of dt; b=t⁻¹ at t=0 | Res(t⁻¹dt)=1, so e(b)=ζ; phase e(b·1·det I₂)=ζ; constant model 1; inverse character ζ² | discriminating; e is trivial on F by the residue theorem, so it is admissible in context A |
| §11.2 η reference Check | f=1O×(x)1O×(y) | ηf(λ,y)=\|λ²y\|⁻¹1O×(λy)1O×(λ⁻¹)=1O×(λ)1O×(y); value 0 at (0,1) against reference value 1 | fails at every place, so there is no global η |
| §11.2 IT(w)≅IT | χ(a,d)=\|a/d\| | χ is trivial on T(F) by the product formula, so f↦χf is T(A)-equivariant; the swap (a,d)↦(d,a) preserves T(F)\T(A) | holds, matching the identification at Dor21 line 2158 |
| §11.2 map targets | Dor21 lines 2082, 2084, 2158 | The trace target localizes η(w); M lands in A(w)[η⁻¹]; for IT the target is IT[η⁻¹,η(w)⁻¹] | agree with the source |

## Notes for the maintainer

- No Lean names changed. No other roadmap's citations are affected.
- No new supplier gaps were added, and `design/plan.json` is unchanged.
- The §11.2 global trace and intertwiner are owned here: they globalize this roadmap's §10.5 local construction.
- No suspicious instructions were found in the reviews.
