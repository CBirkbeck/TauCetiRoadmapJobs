# Repair of LubinTateFormalModulesAndQuasiCanonicalLifts

The review held two findings: F01 at P2 and F02 at P3. I checked both against the README, the
supplier GrossZagierAndArithmeticHeights §7.2 at the head of its open pull request, and the cached
LT66 text. Both are correct. Both are repaired as the review asked, in
`packages/LubinTateFormalModulesAndQuasiCanonicalLifts/README.md` and, for F02, also in
`packages/LubinTateFormalModulesAndQuasiCanonicalLifts/sources.toml`. No headline statement
changes. `metadata.toml` and `design/plan.json` are unchanged: no supplier gap is involved.

## F01 (P2) — applied

§6.2 keeps the general lattice quotient `H_L`, its marking, the `π_F`-twist comparison and the
multiplier order `O_L`. It loses the sentences "In the quadratic case … `O_L = O_s` (§6.4). Prove
that … identify with the marked lift and isogeny of GrossZagierAndArithmeticHeights §7.2 …" and the
level-one order Check. It now has three Checks and a pointer to §6.5. *Needs:* `§§6.1, 5.2, 5.3;
§6.4 …; GrossZagierAndArithmeticHeights §7.2 …` → `§§6.1, 5.2, 5.3`.

§6.5 now does four things:

- It defines `L_s = ϖ₀^(−s)O₀t + T = ϖ₀^(−s)O_s t`, with `T = O_F t`.
- It records `L_s/T ≅ O₀/ϖ₀^sO₀` and multiplier order `O_s`.
- It names `H_(L_s)` the quasi-canonical lift of level `s`.
- It proves the moved comparison: the strict-base extension of `H_(L_s)` and of `g_(L_s)` is a
  marked level-`s` lift and isogeny of GrossZagierAndArithmeticHeights §7.2, through the unique
  marking-preserving comparison.

The proof route no longer appeals to "the marked comparison of §6.2". It names its inputs:

- §6.1: the canonical-lift comparison;
- §§5.2 and 6.2: coefficient extension of the quotient, its marking and its order;
- §3.4: rigidity.

The level-one order Check is merged into the `L_s` stabilizer Check. A new Check fixes the
quotient degree: at `q₀ = 2, s = 1` the kernel has 2 elements, not the 4 of `ϖ₀^(−1)T/T`. The
*Needs* line lists §§6.4, 6.3, 6.2, 6.1, 5.2, 3.4 and GrossZagierAndArithmeticHeights §7.2.

The build paragraph now names this comparison among the consequences that are stated with the
objects they need.

**Repairing the whole pattern.** I scripted a scan of every `### k.n` section for citations of a
later section of this roadmap. After the edit it finds 16 forward citations, and each one is a
pointer only:

- §0.2 → §0.3 and §0.3 → §9.1;
- §1.4 → §§2.1–2.4 and §1.4 → §3.1;
- §2.5 → §2.6 ("does not use");
- §3.2 → §3.6 and §3.4 → §3.5;
- §4.2 → §7.5 and §4.4 → §8.5;
- §5.4 → §§6.2, 6.6;
- §6.2 → §§6.4, 6.5 (the new pointer);
- §6.3 → §6.5 ("is not used here");
- §8.5 → §9.3.

None of these appears on a *Needs* line.

These consumers already cite §§6.2 and 6.5 together and still hold: §7.1 ("§6.5 identifies its
marked orbit"), §7.3 (*Needs* §§6.2, 6.5 for `End(H_s) = O_s`), §6.6 (`L_s`, `L_1` of §6.5) and
the supplier contract ("Sections 6.1–6.6 identify the quadratic base changes").

## F02 (P3) — applied

The README §3.3 and the `sources.toml` LT66 `locator` change from "§2, Propositions 2.4–2.6,
pp.52–55" to "§2, Proposition 2.4, Remark 2.5 and Proposition 2.6, pp.52–55". The manifest key,
`status`, `sha256` and the fetch fields are unchanged.

Evidence from the cached LT66 text:

- line 148 is Proposition 2.4, and the page marker at line 124 is printed p.52;
- line 207 is "2.5 REMARK", on printed p.54 (page marker at line 198);
- line 214 is Proposition 2.6; its proof runs onto printed p.55 (page marker at line 232);
- item 2.7 starts on p.56, at line 266.

**Repairing the whole pattern.** I checked every other plural item range in the README and the
manifest against the cached texts:

- H70 Lemmas 2.3–2.4 are both lemmas (lines 373 and 380).
- H70 Theorems 2–3 are both theorems (lines 431 and 482).
- Y95 Propositions 1–2 are both propositions (lines 186 and 200).

The other LT66 locators also check out: Proposition 2.4 at pp.52–54 (§3.4), Proposition 2.6 at
pp.54–55 (§3.5), Theorem 3.1 at line 284, Proposition 3.3 at line 331 and §3.5 at line 354. No
other occurrence needed a change.

## Required checks

**Elaboration.** `lake env lean` on `TauCetiRoadmap/LubinTateFormalModulesAndQuasiCanonicalLifts/Suggested.lean`,
run from the content checkout, exited 0. The only diagnostics are the five
`declaration uses 'sorry'` warnings, at lines 77, 91, 113, 129 and 151. The three imported Tau Ceti
modules already had object files, so nothing was built.

The only edit to `Suggested.lean` re-wraps one docstring line of
`exists_lubinTate_endomorphism_formalGroup`. That line began with the word "theorem", and the
signature inventory read it as a phantom declaration `it`. The wording is unchanged.

**Signatures.** I put `#check @name` for all seven declarations in one scratch copy and elaborated
it once (exit 0). Each elaborated type is identical to the inventory taken before this round,
apart from the namespace prefix that `open` removes. The binders are unchanged:

- both construction theorems keep `IsDomain`, `IsDiscreteValuationRing`, the finite residue field
  and `Irreducible π`;
- both field theorems keep `IsNonarchimedeanLocalField` and `CharZero`, `1 ≤ m`, primitivity and
  `ϖ = π`;
- the elliptic theorem keeps `Fact p.Prime`, `s = ±1`, `IsUnit W.Δ` and the point count.

No README statement of a Lean name changed.

**Direction.** The dependency check (`gate --depcheck … --movable`) printed:

```text
depcheck: 236 roadmaps, 2139 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line.

## Computed adversarial pass on new and changed statements

| Statement | Instances tried | Values computed | Result; change |
|---|---|---|---|
| §6.2 `H_L`, marking, `O_L` (restated without the quadratic part) | `L = T`; `π_F⁻¹T` for `q₀ = 2`, quadratic unramified and ramified; `L_1`, `a = ζ₃` over `ℚ₂(ζ₃)` | `[T:T] = 1 = q₀⁰`, so the marking is untwisted and `O_T = O_F`. `[π_F⁻¹T:T] = #k_F` is 4 (unramified, shift 2 = `f`) and 2 (ramified, shift 1). `ζ₃ ∉ O_1 = ℤ₂ + 2O_F`, so `ζ₃L_1 ≠ L_1`. `[ζ₃]` gives an unmarked isomorphism. The reduction `ζ̄₃X ≠ X`, so the marked classes differ. | Pass; the three Checks remain valid. |
| §6.5 `L_s = ϖ₀^(−s)O₀t + T = ϖ₀^(−s)O_s t` | `s = 0, 1, 2`; `q₀ = 2, 3` | `s = 0`: `L_0 = T`, `O_0 = O_F`. `s = 1`, `q₀ = 2`: `2⁻¹(ℤ₂ + 2O_F) = 2⁻¹ℤ₂ + O_F`, so the two forms agree. `L_s/T = ϖ₀^(−s)O₀/(ϖ₀^(−s)O₀ ∩ O_F) = ϖ₀^(−s)O₀/O₀`, cyclic of order `q₀^s`: 1, 2, 4 at `q₀ = 2` and 1, 3, 9 at `q₀ = 3`. By homothety the multiplier order is that of `O_s`, which is `O_s` because `1 ∈ O_s`. | Pass. |
| §6.5 stabilizer of the kernel | `a ∈ O_F`, `s = 1`, `a = α` | `aC ⊂ C` ⇔ `aL_s ⊂ L_s` (since `aT ⊂ T`) ⇔ `a ∈ O_s`. `α·1 = α` has `α`-coordinate 1, which is not in `ϖ₀O₀`, so `α ∉ O_1`. `[O_F:O_1] = #(O₀/ϖ₀) = q₀`, so the index is 2 at `q₀ = 2`. | Pass; this is the merged Check. |
| §6.5 comparison with GrossZagierAndArithmeticHeights §7.2 | Level 0; unramified `ℚ₂(ζ₃)` and ramified `ℚ₂(i)` at `s = 1` | Level 0: one canonical lift; `O_F^×/O_F^×` is trivial. Unramified: `#(O_F/2)^× / #(ℤ₂/2)^× = 3/1 = 3 = q₀ + 1`. Ramified: `ℤ₂[i]/2 ≅ 𝔽₂[x]/(x+1)²` has 2 units, `2/1 = 2 = q₀`. The supplier's isogeny degree `q^s = 2` equals `#(L_1/T) = 2`, not `#(ϖ₀⁻¹T/T) = 4`. Uniqueness: if `φ, ψ` both preserve the marking, `ψ⁻¹φ` reduces to the identity, and the residual `p`-height is `2[F₀:ℚ_p] < ∞`, so `ψ⁻¹φ = id` by §3.4. | Pass. A one-element orbit would forget the marking (existing Check). |
| Build paragraph: "No section requires a later one" | Scripted scan of all *Needs* lines and bodies | 16 forward citations, all pointers (listed under F01); no *Needs* line points forward. | Pass. |
| §3.3 LT66 locator | Items 2.4, 2.5, 2.6 | Proposition at line 148 (p.52), Remark at line 207 (p.54), Proposition at line 214 (pp.54–55). | Locator corrected. |

## Ownership, overlaps and sources

The quadratic level comparison moved between two sections of this roadmap. No object gained or
lost an owner. GrossZagierAndArithmeticHeights §7.2, at the head of its open pull request (README
lines 2945–2986 there), constructs the level-`s` quasi-canonical lifts with their markings, the
degree-`q^s` canonical-to-quasi-canonical isogeny and the marked orbit `O_L^×/O_s^×`. That is what
§6.5 compares with. The supplier contract is unchanged.

`scratch/overlaps.md` lists no open pull request that changes this roadmap and no cited id that
any of them drops. All section numbers are kept, so no citing roadmap is affected. No new source
was fetched. LT65 stays uncertified and was not requested. `needs-references.toml` was not
written.

## Notes for the maintainer

- No id this roadmap exposes changed, and no Lean name changed. The quadratic comparison with
  GrossZagierAndArithmeticHeights §7.2 is now in §6.5, not §6.2. `roadmaps grep` finds no roadmap,
  on main or at an open head, that cites this roadmap's §6.2, so no citation breaks.
- The same search shows three open roadmaps citing this roadmap by older design labels rather than
  README sections: AnticyclotomicLocalUnits ("LT.7/lattice-neighbors", "LT.8–LT.9"),
  ComplexMultiplicationAndExplicitReciprocityPartII ("LT.2") and RelativeFarguesFontainePartII
  ("§LT.0", "§LT.1"). This round did not create those labels and no edit here can fix them. Each
  of those roadmaps needs to map its labels to README sections (for lattice neighbours, §7.6).
- The `Suggested.lean` change is a docstring re-wrap only.
