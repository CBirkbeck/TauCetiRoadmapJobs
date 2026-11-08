# Review of ClassicalArithmeticCompletion (pull request #1409 at aa03308)

**Verdict:** needs changes

🤖 Independent AI review: an incremental re-review of the 38 lines changed since d8a53de. The AI never approves or merges. "Accepted" means this roadmap folder is ready for a human's final approval.

- **What changed:** the head moves the standard trace characters, their conductors, self-dual measures and local Fourier inversion out of §7.12a. It now cites them from AnalyticNumberTheoryPartII §5.3g, in the scope, the supplier contracts and §§7.12a, 7.13 and 7.30.
- **Gate:** fails. The dependency check reports an UPWARD supplier (R01, P2).
- **Previous findings:** the report on d8a53de had none.
- **New findings:**
  - R01 (P2): the upward supplier above.
  - R02 (P3): the tower-compatibility statement left in §7.12a cites no input.
- **Mathematics of the change:** the new contract describes §5.3g correctly. Every sign, conductor and volume recomputes (table below).
- **Elaboration:** `Suggested.lean` is unchanged and elaborates with only `sorry` warnings.

## R01 (P2) — A roadmap on main now takes its trace characters from AnalyticNumberTheoryPartII, which is not on main

**Location.**

- The new subsection at `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:244–246`, "### From TauCetiRoadmap.AnalyticNumberTheoryPartII, §5.3g".
- The *Needs* lines `:14098` (§7.12a), `:14192` (§7.13) and `:14617` (§7.30), which read "TauCetiRoadmap.AnalyticNumberTheoryPartII §5.3g".
- The prose citations at `:28`, `:242`, `:262`, `:14072`, `:14152`, `:14595` and `:14597`.

**Claim.** The finite and archimedean standard characters ψ_v, their conductor 𝔇_v⁻¹, the self-dual measures and local Fourier inversion are supplied by AnalyticNumberTheoryPartII §5.3g. §§7.12a, 7.13 and 7.30 consume them.

**Witness.**

- The push gate on this head fails with `depcheck=1`. The dependency check prints:
  `UPWARD: ClassicalArithmeticCompletion (on main) -> AnalyticNumberTheoryPartII (#50) at README lines [244, 14072, 14098, 14192, 14617]`.
- AnalyticNumberTheoryPartII is not on main. It is the draft new-roadmap pull request at `c0e5090` and sits at line 50 of the merge order.
- This roadmap is on main, so every roadmap may consume it. NoncommutativeAndEquivariantIwasawa (merge order line 29, `README.md:125` at its head) uses this roadmap's "additive-character and self-dual-measure conventions" and §§7.13 and 7.30. With this change, those rest on a roadmap 21 places later.
- If this pull request merged before AnalyticNumberTheoryPartII, main would cite a section that does not exist on main.

**Repair.** Move the notion back down into this roadmap: restore the d8a53de text of every passage this head changed.

- **§7.12a.** Put back the paragraph that defines the adelic trace character. It covers continuity, nontriviality, triviality on diagonal F, conductor 𝔇_v⁻¹, self-dual volumes q_v^(−d_v/2), dx and 2 dx dy, the local Schwartz–Bruhat spaces, Fourier inversion, the classification x↦ψ(bx) and the product of local components. Its locator is Deligne §3.1–§3.11, pp. 524–532, and Kudla §3, pp. 120–125, and §4, pp. 127–129. Put back its four API bullets and its three Checks (x = 1/3; ℚ₂ under ψ(2x); ℚ₃(√3) and ℚ₂(i)).
- **§7.12a *Needs*.** Restore it to "TauCetiRoadmap.GlobalNumberFields Layers 4–9; TauCetiRoadmap.ClassFieldTheory Layer 7; …".
- **Other passages.** Revert `:28`, `:242`, `:262–263`, `:14152`, `:14192`, `:14595`, `:14597` and `:14617` to their d8a53de wording, and delete the subsection at `:244–246`.
- **Test.** I ran the dependency check on a scratch copy of the d8a53de README. It prints `depcheck: 239 roadmaps, 2382 edges, 0 problem(s)`.
- **Ownership.** After the restore, this roadmap and AnalyticNumberTheoryPartII §5.3g (the case V = F_v, B(x,y) = xy) both state the scalar standard character. The owner is the earlier one, and this roadmap, on main, comes first. So AnalyticNumberTheoryPartII should cite §7.12a for that case and keep its general pairings; that edit belongs to its own pull request.
- **Alternative.** Keep the citation and wait until AnalyticNumberTheoryPartII is on main, when the edge becomes main → main. The description's depends-on block already lists it. Until then the gate fails and this folder cannot be accepted.

**Moved down (recorded as the brief requires):** the scalar standard characters, conductors, self-dual measures and local Fourier inversion, from AnalyticNumberTheoryPartII §5.3g back into §7.12a.

## R02 (P3) — The tower-compatibility statement in §7.12a has no locator and no input

**Location.** `README.md:14072`: "This section adds that these characters are compatible in towers: for a finite extension E/F of number fields and a place w over v, ramified or not, ψ_w=ψ_v∘Tr_(E_w/F_v), by transitivity of the trace."

**Claim.** The statement is a theorem of §7.12a. It has no locator, and the §7.12a *Needs* line (`:14098`) names no trace-transitivity input. That line lists only "Mathlib Haar measures, Fourier transforms, Schwartz functions and finite Gauss sums".

**Witness.**

- The input is Mathlib `Algebra.trace_trace` (`Mathlib/RingTheory/Trace/Defs.lean:137`). It gives `trace R S (trace S T x) = trace R T x` for a scalar tower with `Module.Free`/`Module.Finite` at both steps.
- Neither §7.12a nor the Layer 7 dependency list (`:16740–16888`) cites it. A grep of the README for `trace_trace` returns 0 hits.

**Repair.**

- Add "Mathlib `Algebra.trace_trace`" to the §7.12a *Needs* line and to the Layer 7 dependency list.
- This applies in either form R01 leaves §7.12a in. The d8a53de API bullet "Local trace and finite-extension trace composition give compatible characters" rests on the same lemma.
- **Test.** For the ramified tower ℚ₃ ⊂ E = ℚ₃(√3) ⊂ E′ = ℚ₃(√3, i), every step is a finite-dimensional vector space, so the lemma's hypotheses hold. At x = 1/9, Tr_{E′/E}(x) = 2/9 and Tr_{E/ℚ₃}(2/9) = 4/9 = Tr_{E′/ℚ₃}(x), so both sides give ψ = exp(−8πi/9).

## Previous findings

- none: the report on d8a53de (`PRREVIEW-ClassicalArithmeticCompletion~6`) listed no findings, so there is nothing to account for. Its two remarks on untouched text (§1.43's local-field instance; the Layer 1 list) concern passages this head does not change, and I did not re-examine them.

## Verified sound

### Scope

I read head `aa0330866a0b867089e15d73826602b426ec6732` and checked:

- every passage of the 38-line diff (`scratch/changes.md`);
- the sections that cite those passages (§§7.12b and 7.12c, and the Layer 7 dependency list);
- the supplier section the diff cites, AnalyticNumberTheoryPartII §5.3g, at the head of its pull request (`c0e5090`, `README.md:681`) with §§5.3f and 5.3h around it;
- the gate, the elaboration, the dependency check and the overlap facts.

`git diff --stat origin/main...HEAD` outside the folder is empty. `git diff --stat d8a53de HEAD` touches only `README.md`. The pins are Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`.

### Gate, build and dependency check

- **Gate (my run):** every check is 0 except `depcheck=1`, so it ends in `FAIL`. Full line: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=1 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 FAIL`. This agrees with the worker's run (`scratch/gate.md`, which also has `build=0`).
- **Dependency check**, output verbatim:

  ```text
  UPWARD: ClassicalArithmeticCompletion (on main) -> AnalyticNumberTheoryPartII (#50) at README lines [244, 14072, 14098, 14192, 14617]
  depcheck: 239 roadmaps, 2383 edges, 1 problem(s)
  ```

  This is not a false positive. The roadmap is on main and the supplier is not (R01). There is no CYCLE line: AnalyticNumberTheoryPartII and its supplier AnalyticNumberTheoryPartI do not cite this roadmap as a supplier. Their only mention of it is the downstream-consumer bullet at AnalyticNumberTheoryPartII `README.md:3170`.
- **Elaboration:** `lake env lean TauCetiRoadmap/ClassicalArithmeticCompletion/Suggested.lean` exited 0 with 45 warnings, all `declaration uses 'sorry'`, and no errors. The only other output is the two `#check` lines pinning `pow_card_eq_one'` and `pow_ne_of_irreducible_X_pow_sub_C`.
- **Signatures:** I put `#check @` for each of the 73 declarations in one scratch file after the module body and elaborated it once (exit 0, no errors). I dropped the two spurious entries `targets` and `group` that the worker's signature extraction took from docstring words. The Lean file is byte-identical to d8a53de, so the README–Lean comparison of the previous reports stands: 0 lost binders and no retyped declaration.
- **Headline theorems and padding:** unchanged from the previous report, since no declaration was added, removed or retyped.

### The new supplier contract against AnalyticNumberTheoryPartII §5.3g

| Contract clause (`:246`) | §5.3g at `c0e5090` | Agrees |
|---|---|---|
| ψ_v = ψ_w∘Tr, with ψ_ℝ = exp(2πix), ψ_ℚp = exp(−2πi{x}_p), and exp(2πi(z+z̄)) at a complex place | first sentence of §5.3g | yes |
| conductor 𝔇_v⁻¹ at a finite place | "largest fractional ideal on which ψ_v is trivial is the inverse different" | yes |
| every character of F_v is ψ_v(b·) for exactly one b ∈ F_v | the Pontryagin-dual isomorphism y ↦ ψ_v(B(·,y)) for B(x,y) = xy (b = 0 gives the trivial character) | yes |
| S(F_v), f̂(y) = ∫f(x)ψ_v(xy)dx, f̂̂(x) = f(−x) for exactly one Haar measure | second bullet, symmetric case τ = 1 | yes |
| dx on ℝ, 2dxdy on ℂ, vol(O_v) = N(𝔇_v)^(−1/2) | second bullet, with dx_v(O_v) = 1 from §5.3f | yes |
| the measure is multiplied by \|b\|_v^(1/2) under ψ_v ↦ ψ_v(b·) | "ψ_v(a·) with B is ψ_v with aB" together with the factor \|det A\|_v^(1/2) | yes |
| ψ = ∏ψ_v is nontrivial, continuous and trivial on F, the last by §5.3h | first sentence of §5.3g, and §5.3h | yes |
| "stated in prose, without a Lean signature" | AnalyticNumberTheoryPartII `Suggested.lean` has no §5.3g declaration; `adeleRing_selfDual` is §5.3h | yes |

The library has no duplicate. Mathlib's `AddChar.traceChar` (`Mathlib/NumberTheory/AddCharacter/Trace.lean:56`) is the trace character of a `ZMod n`-algebra, not a local-field standard character. A grep of both pins for a standard additive character or a self-dual measure on a local field finds none.

### Citations in the changed passages

- The `scratch/citations.md` leads list no unresolved cross-roadmap citation. Its "Lean names found nowhere" are this roadmap's own `Suggested.lean` declarations, and none was added by the diff.
- The anchors `#712a-…`, `#712b-…`, `#712c-…` and `#713-…` in the changed *Needs* lines resolve to headings at `:14070`, `:14100`, `:14128` and `:14150`.
- §§7.12b and 7.12c use only a general ψ and the archimedean constants that §7.12a keeps, so their unchanged *Needs* lines remain correct.

### Overlaps and ownership

- `scratch/overlaps.md` lists:
  - no other open pull request changing this roadmap;
  - no dropped id that it cites;
  - no id that only an open revision defines (AnalyticNumberTheoryPartII is a new roadmap, not a revision);
  - no dropped id of its own that others cite.
- The ownership question the diff raises is R01.
- Ownership against open pull requests without a supplied checkout was not checked beyond the roadmaps tool.

### Seeded sample

None of the fifteen seeded targets falls in the diff or cites a changed passage. A scratch script searched each section for `7.12a`, `7.13`, `7.30`, `trace character`, `self-dual`, `5.3g` and `AnalyticNumberTheoryPartII`, with 0 hits in all fifteen. The sections are 1.39 (`:1390`), 1.60 (`:1914`), 2.64 (`:4299`), 2.69 (`:4410`), 3.60 (`:6613`), 4.13 (`:7459`), 4.28 (`:7922`), 4.68 (`:8914`), 5.25 (`:11370`), 6.57 (`:13006`), 7.17 (`:14250`), 7.67 (`:15461`), 7.69 (`:15511`), 7.73 (`:15617`) and 7.93 (`:16049`).

Following the incremental instruction, I did not re-verify their locators against the sources. I did recompute each statement (rows below). The README flags no locator as unverified (grep "unverified": 0).

### Adversarial computations: changed statements

| Statement | Instances and values computed on both sides | Result |
|---|---|---|
| contract: the signs of ψ_ℝ and ψ_ℚp | x = 1/3: ψ_∞ = e^{2πi/3}, ψ_3 = e^{−2πi/3}, ψ_p = 1 for p ≠ 3, product 1. A plus sign at 3 gives e^{4πi/3} ≠ 1. x = 5/6: {5/6}_2 = 1/2 and {5/6}_3 = 1/3, so the product is e^{2πi(5/6−1/2−1/3)} = 1. | holds |
| contract: complex place | z = 1/8 + i: z + z̄ = 1/4, so exp(2πi(z+z̄)) = i = ψ_ℝ(Tr_{ℂ/ℝ} z). | holds |
| contract: conductor 𝔇_v⁻¹ | ℚ₃(√3): 𝔇 = (2√3) = (√3). On (1/√3)O, x = c√3/3 + d has Tr = 2d ∈ ℤ₃, so ψ = 1. At 1/3 ∈ P⁻², Tr = 2/3 and ψ = e^{−4πi/3} ≠ 1. | holds |
| contract: vol(O_v) = N(𝔇_v)^(−1/2) | vol(O)·vol(𝔇⁻¹) = vol(O)²N(𝔇) = 1. ℚ₃(√3): 3^{−1/2}. ℚ₂(i): 𝔇 = (2) = P², N = 4, so 1/2. ℚ₉: 1. | holds |
| contract: 2dxdy on ℂ | f = e^{−2π\|z\|²}: f̂(0) = 2·∫∫e^{−2π(x²+y²)} = 2·(1/2) = 1 = f(0). With dxdy, f̂(0) = 1/2 ≠ f(0). | holds |
| contract: \|b\|_v^{1/2} scaling | ℚ₂, b = 2: the annihilator of ℤ₂ under ψ(2xy) is ½ℤ₂, so μ(ℤ₂)²·2 = 1 and μ(ℤ₂) = 2^{−1/2} = \|2\|₂^{1/2}. ℂ, b = 2: the pairing's determinant scales by 4, giving factor 2 = \|2\|_ℂ^{1/2}. | holds |
| contract: f̂̂(x) = f(−x) | ℝ, f = e^{−π(x−1)²}: f̂̂(1) = f(−1) = e^{−4π} ≈ 3.5·10⁻⁶, not f(1) = 1. The reflection is needed, and the contract states it. | holds |
| contract: ψ(b·) for exactly one b | b = 0 gives the trivial character. On ℚ_p, ψ(b·) is trivial on ℤ_p exactly when b ∈ ℤ_p, which matches conductor ℤ_p. | holds |
| §7.12a tower compatibility (`:14072`) | ℚ₃ ⊂ ℚ₃(√3) ⊂ ℚ₃(√3, i), x = 1/9: 4/9 both ways, ψ = e^{−8πi/9}. Real → complex step, z = 1/8 + i: i both ways. Ramified case included. | holds (input missing: R02) |
| §7.13 "minus character = finite standard character" (`:14152`) | F = ℚ₃, x = 1/3: ψ_F⁺(−1/3) = e^{2πi·2/3} = e^{−2πi/3} = ψ_ℚ₃(1/3). q^{−d/2} = N(𝔇)^{−1/2}, since N(𝔇) = q^d. | holds |
| §7.30 sign conventions (`:14595–14597`) | ℚ(√−3)/ℚ: χ₃(3) = 1, since 3 = N(√−3). The negative character gives Gauss sum e^{−2πi/3} − e^{−4πi/3} = −i√3, so E₃⁻(1/2) = −i. The real place gives i^{n₋} = i, so W = (−i)(i) = 1, as a quadratic character must. The positive finite character would give +i and W = −1. | holds |
| scope `:28`, contracts `:242` and `:262–263` | The sections named (§§7.12a, 7.13, 7.30) are exactly those whose text now cites §5.3g (`:14072/14098`, `:14152/14192`, `:14595/14597/14617`). The "Analytic foundations" row keeps only what §§7.12a–7.12c still own. | consistent |

### Adversarial computations: seeded targets (statements recomputed, locators not reopened)

| Target | Instances and values | Result |
|---|---|---|
| 1.39 | p = 7, π = −1 − 3ω: N = 1 − 3 + 9 = 7 and π ≡ 2 (mod 3), so π is primary. J(χ_π, χ_π) = π ≡ 2 (mod 3), consistent with the sources' −1. | holds |
| 1.60 | χ(−1)² = 1 and χ(−1)³ = 1 give χ(−1) = 1. Then g³ = p·J = p·π. | holds |
| 2.64 | (P,Q) = (3,2): U = 0, 1, 3, 7, 15, all odd, and gcd(15,7) = 1. Control (2,2), not coprime: U₃ = 2 and gcd(2,2) = 2. (0,1): U = 0, 1, 0, −1, 0, and gcd(0, ±1) = 1. | holds |
| 2.69 | F₅: 1/3, 2/5, 1/2 has mediant 2/5. F₇: 1/5, 1/4, 2/7 are consecutive (no fraction with denominator ≤ 7 lies strictly between) and 3/12 = 1/4. | holds |
| 3.60 | D = ℤ, n = 4: I₄ = (1/24), with exponent −3 = −w₂(4) = −(2+1) at 2 and −1 at 3. In ℤ[i], 3 is inert with N = 9 > 4, so w₉(4) = 0. | holds |
| 4.13 | 3^b + 1 ∈ {2, 4, 10, 28, …} and 3^b − 1 ∈ {0, 2, 8, 26, 80, …}. The powers of 2 among them give exactly (1,0), (2,1), (1,1), (3,2); a = 0 gives nothing. | holds |
| 4.28 | d = 2: 1/1 and 3/2 are convergents k = 0, 1. d = 3: 2/1 is convergent k = 1, and 2² − 3 = 1. | holds |
| 4.68 | d = 5, n = −1, u = 9 + 4√5: Y = (√u + 1/√u)/(2√5) = 4.472/4.472 = 1. q₀ = 1 ≤ Y and 2² − 5 = −1, so the bound is attained (≤, not <). n = ±2: ±2 is not a square mod 5, and the criterion is empty. | holds |
| 5.25 | ℚ(√2): σ(1+√2) = −(1+√2)⁻¹ ↦ (−1,1), which is τ₁; N = −1. ℚ(√3): σ(2+√3) = (2+√3)⁻¹ ↦ (−1,0), which is τ₀; x² ≡ −1 (mod 3) is insoluble. | holds |
| 6.57 | β = {1}: G = √(1 − 1/z), and 1 − 1/z ∈ (−∞, 0] exactly on (0, 1], so G is holomorphic off the hedgehog. G² = Q(1/z) and G → 1. | holds |
| 7.17 | ℚ(i)/ℚ: θ = (1+i)/2 is a normal basis generator, while θ = 1 and θ = i are not (their conjugates are dependent). ℤ[G]θ contains 1 and i, and also θ ∉ ℤ[i], so ℤ[G]θ ≠ 𝓞_L. | holds |
| 7.67 | ℤ[i]: Tr(ℤ[i]) = 2ℤ ≠ ℤ, so ℤ[i] is not projective (wild at 2). ℤ[ζ₃]: Tr(ζ₃) = −1, so the trace is surjective, and ℤ[ζ₃] = ℤ[G]ζ₃ is free. | holds |
| 7.69 | e₁(1+i) = 1 and e₋₁(1+i) = i. e₁(a+bi) = a and e₋₁(a+bi) = bi, so both lie in the associated order. | holds |
| 7.73 | G = C_p: A = 0, so ν on Det(1+A) is trivially an isomorphism, and ker ν on Det(1+I) is Det(G) ≅ C_p (torsion). G = 1: both sides are trivial. | holds |
| 7.93 | G = C_p (C′ = L = 1): G′ = 1, and R[G] is commutative, so Det(GL) = Det(units). G′ = C′⋊L has order prime to p, since ℓ ≠ p. | holds |

### Carried adversarial evidence for untouched statements

The diff changes no other README target and no Lean type. All other rows therefore carry unchanged from `packages/ClassicalArithmeticCompletion/reports/PRREVIEW-ClassicalArithmeticCompletion~6.md` and the reports it carries:

- the d8a53de increment: `IsUnramified.tower_bot`, the unramified-extension family, the maximal unramified subextension, Teichmüller, `isTamelyRamified_tower_iff`, and §§1.43, 7.19, 7.38, 7.52 and 7.2;
- the c725fa7 and 121997a increments;
- the full-review rows from compatible CRT through the Fröhlich–Taylor endpoint.

### Remarks on untouched or pre-existing text (no change requested)

- **§7.13 generality (`:14152`).** §7.13 works over any finite F/ℚ_p, but identifies ψ_F⁻ with a character defined only on completions of number fields, both in d8a53de §7.12a and in §5.3g. The formula ψ_ℚp∘Tr_{F/ℚp} makes sense for every such F, and the diff does not change the substance.
- **Layer 7 dependency list.** It lists only linked supplier layers. Plain-text suppliers (GlobalNumberFields, LFunctions, ClassFieldTheory Layer 9) were already absent, and the new AnalyticNumberTheoryPartII item follows that pattern.
- **Pull-request description.** Its "Dependencies" and "Merge order" paragraphs name AnalyticNumberTheoryPartI, which the README does not cite (0 hits). Only its depends-on block names AnalyticNumberTheoryPartII.

## Not verifiable

None. The changed passages replace a locator-backed statement with a cross-roadmap citation, which I checked against AnalyticNumberTheoryPartII at its head. No seeded target falls in the diff. The Deligne (§3.1–§3.11) and Kudla (§§3–4) locators that R01's repair restores are the ones the earlier reports passed; I did not reopen them here.

## Source issues

- none
