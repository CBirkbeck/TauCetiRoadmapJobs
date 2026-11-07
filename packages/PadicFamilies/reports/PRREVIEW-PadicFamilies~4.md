# Review of PadicFamilies (pull request #1019 at ec14657)

**Verdict:** accepted

This is an incremental re-review of the 52 changed lines since `511de39` (29 insertions, 23 deletions, all inside `TauCetiRoadmap/PadicFamilies/`). All five findings of the previous review are repaired, and no repair introduces a new problem. The gate passes with the targeted build, and the dependency check is clean. This report raises no findings.

## Previous findings

- R01 — repaired: README:97 "`QuaternionicModularForms`, §0.3 (*Class-set refinement*) … `AdelicAlgebraicGroups`, §5.3 (*quaternion-class-sets*) … Its *Refinement fibres* paragraph … `QuaternionicModularForms`, §2.1 (*Forms on `D_fˣ` and their Banach structure*)"; the same replacement is made at lines 17, 2682–2769 and 2991.
- R02 — repaired: `Suggested.lean:1` `module`, `:3` `public import Mathlib`, `:38` `@[expose] public section`, `:145` `end`. A gate run with `--build` reports `build=0 … OK`.
- R03 — repaired: README:35 "At the pinned Mathlib and Tau Ceti, use `Module.End`, `Module.End.pow_apply`, `IsIdempotentElem`, …".
- R04 — repaired: README:2773 "suppose `U/(U∩F^×)` acts freely on `D^×\D_f^×` by right multiplication".
- R05 — repaired: README:2510 "This uses §4.2; §4.3; `SelmerIwasawaCohomology`, §§2.21–2.22; `SelmerIwasawaCohomology`, §§3.8–3.10; `SelmerIwasawaCohomology`, §3.14."; the locator at line 2508 now names §§2.21–2.22 as well.

## Verified sound

### Gate, dependency check, folder

- My gate run on this head, with `--build`: every counter is 0, including `build=0`, and the result is `OK`. The worker's gate file agrees. Without `--build` the result is also `OK`.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/PadicFamilies'` is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.
- Dependency check (my run, `--movable`, content at main `eaf17b1`):

```text
depcheck: 240 roadmaps, 2449 edges, 0 problem(s)
```

  There is no UPWARD, CYCLE or `moved:` line. The edge count rose from 2444 to 2449 with the new supplier citations. Merge-order positions: this roadmap is at 168; the new or retargeted suppliers are AdelicAlgebraicGroups 35, SelmerIwasawaCohomology 55, QuaternionicModularForms 70 and HilbertModularVarietiesAndShimuraCurves 157. All of them come before 168.
- The pull-request description lists AdelicAlgebraicGroups and QuaternionicModularForms under *Depends on* and in its merge-order chain.
- No declared gaps: the README has no `gap:` slug and there is no readable `design/plan.json`.
- Overlaps: `overlaps.md` lists no open pull request that changes this roadmap, no dropped id and no id defined only by an open revision. The diff changes no heading, so no id that other roadmaps cite is dropped.
- Ownership of the retargeted objects: `roadmaps grep -i 'refinement fib'` finds the class-set refinement fibres owned only by QuaternionicModularForms §0.3 (README:353). HilbertModularVarietiesAndShimuraCurves README:10 and :134 defers them to that section and says §R18.5.16b names no target. This roadmap now consumes them and does not restate them.

### Repairs resolved at the suppliers' heads

| Citation at this head | Where it resolves | Result |
|---|---|---|
| QuaternionicModularForms §0.3: finiteness of `Cl(U)` at every open `U` | #934 `f7ed2fe`, README:345–350. Compact open levels come from AdelicAlgebraicGroups §5.3. A non-compact open `U` contains `U∩(𝒪_D⊗Ô_F)ˣ`, whose class set surjects onto `Cl(U)` | present, as stated at README:17 and :97 |
| QuaternionicModularForms §0.3, *Refinement fibres* | #934 README:353–368: the fibre over `ΓxU` is `Γ_x\U/U′` via `Γ_x uU′ ↦ ΓxuU′`, the count `#(Γ\G₀/U′) = Σ #(Γ_x\U/U′)`, and compatibility with change of representative and with composite refinements | present, matches README:97, :2686, :2703 |
| QuaternionicModularForms §2.1, evaluation, *Finiteness*, *Levels* | #934 README:606–621: `M(U,A) ≃ ⊕_i A^{Γ_{c_i}}`. Over a noetherian ring with finite `A` the module is finite, and free of rank `#Cl(U)·r` under trivial stabiliser action. Representatives can be taken as `c_iu`, restriction is injective, and `tr∘res = [U:U′]·id` | present, matches README:97, :2682, :2713 |
| AdelicAlgebraicGroups §5.3 *quaternion-class-sets* | #792 `2ca91be`, README:5499–5512: for every compact open `U` the class set is finite, with representatives `x_1,…,x_h`, factorizations `g = γx_iu`, and surjective refinement maps for `U′ ⊂ U`. It uses neither a division hypothesis nor definiteness | present, matches README:17 and :97 word for word in content |
| HilbertModularVarietiesAndShimuraCurves §R18.5.16a, items 1–3 | #1005 `cd70693`, README:2354–2364: a maximal order is Eichler of level 1, since two maximal orders may coincide. So `e_v = 0` and `j_v(R_v) = O₀(𝔭_v⁰) = M₂(O_v)` at every split `v`, and item 3 gives `j_v(R_vˣ) = GL₂(O_v)` | present |
| SelmerIwasawaCohomology §2.22 *The `H⁰` correction before the classical Selmer kernel* | #869 `ebadda3`, README:900–917: `0→J→H¹(RΓ_f)→Sel_L→0`, with `J` the cokernel of the local `H⁰` arrow | present. §4.4's "local `H⁰` terms in its comparison to the classical compact Selmer group" is exactly this sequence, so §2.22 belongs in the locator and in the dependency line |

I confirmed with `roadmaps list` that these heads are current: #934 `f7ed2fe`, #792 `2ca91be`, #1005 `cd70693`, #869 `ebadda3`.

The diff also deduplicates four dependency lines. In each case the set of cited sections is unchanged, and each section exists at its owner:

- §1.4 (README:1124): `ModularSymbolsPadicLFunctions` §1.1, at #968 `1c1215a` README:1324.
- §1.6 (README:1165): §2.5, at README:1763.
- §2a.3 (README:1413): `AdicSpacesPartIII` §R2.6 was cited twice and is covered by §§R2.6–R2.7. These are on main at README:5714 and :6026, and §R2.4 is at :4986.
- §2.2 (README:1787): `LocallyAnalyticDistributions` §4.1, at #854 `473fb50` README:2130.

### Lean form

- `lake env lean TauCetiRoadmap/PadicFamilies/Suggested.lean` gives exactly three warnings, `declaration uses sorry`, at lines 57, 93 and 119, and no error.
- The new module form (`module`, `public import Mathlib`, `@[expose] public section`, closing `end`) is used by five `Suggested.lean` files on main. It exposes the bodies of the three real-bodied predicates, and the theorem statements depend on those bodies.
- `#check @` for all six declarations, in one scratch file: the elaborated types are identical to `signatures.md` and to the previous round, so no binder changed. The flagged "dropped" binders are `HasDerivedCategory` in `CompleteFlatComplex` and `IsLocalRing` in `HasFiniteProjectiveModel`. Neither predicate's body uses them. Each statement agrees with its README section: §0a.19, §0a.22, §0a.0.2, §0a.17 and §0a.25.
- One-tactic probe on scratch copies: `simp` leaves unsolved goals at all three theorems (probe lines 70, 113, 140). `rfl` and `infer_instance` fail at lines 71, 114 and 141. There is no padding.
- The headlines are unchanged: §0a.22, §0a.17 and §0a.25 are stated. The module docstring (lines 17–35) names the arithmetic headlines that are not statable at the pins, and §0a.18.

### Seeded source sample in the changed passages

I read Skinner–Wiles through the sources service, from the Numdam open-access scan (`sw`, 123 pages; printed page = PDF page + 3).

| Target | Locator checked | Result |
|---|---|---|
| 5.3 `T_∞(U, 𝒪)` (carrier sentence and dependency line changed) | sw lines 956–1037, printed pp. 32–34 | All as stated:<br>• `T_∞ = lim T₂(U_a)` (line 960) and `𝒪[[G(U)]] → T_∞` (981).<br>• `G(U) ≅ (𝒪_F⊗ℤ_p)^× × Z(U)` (988) and the `Λ′` structure via `X_i ↦ S_{x_i}−1` (998–999).<br>• `D` unramified at every finite place, ramified at every infinite place, `[F:ℚ]` even, a maximal order and fixed local isomorphisms (1004–1009).<br>• `X(U) = D^×\G^D(𝔸_f)/U` finite (1012, 1022).<br>• `T₂(U_a,𝒪) = eT(U_a,𝒪)`, the image in `End(eH⁰)` (1034–1037).<br>The changed name `Cl(U) = D^×\D_f^×/U` is SW's `X(U)` under the identification of §5.2. |
| 5.1 weight algebra (cited by §5.3) | sw lines 989–999, printed p. 33 | The `x_i` are reciprocity images, the `y_j^{(i)}` generate the free part of the local units, and `Λ′` has `δ_F + d` variables. As stated. |
| 5.6 hypothesis (changed) | sw lines 1090–1093 (Proposition 3.3, p. 35) and 1118–1127 (Lemma 3.5, p. 36) | The source's hypothesis is that every element of `U/U∩F^×` acts without fixed points on `D^×\G^D(𝔸_f)`. The action is right multiplication: the proof of Lemma 3.5 writes `δx = xu`. The new wording matches. |
| 5.7 finiteness (uses §5.6) | sw lines 1110–1127 (Corollary 3.4, Lemma 3.5, p. 36) | The auxiliary level is `V = U∩U(ℓ)` with `ℓ ∤ 6` unramified. `M_∞(U) → M_∞(V)` is used with `M_∞(V)` free, giving finite torsion-free and semilocal complete. As stated. |
| 5.8 control (uses §5.3) | sw lines 1157–1168, 1171 (Proposition 3.7, p. 37) | `λ|_{Z(U)} = ψε^μ`, `μ ≥ 0`, `ψ` and `φ` of finite order, weight `(μ+2)·t`, `T(ℓ)` and `S(ℓ)` eigenvalues at `ℓ ∤ p` with `U_ℓ` maximal, `ε` through reciprocity, `[F:ℚ]` even. As stated. |

The other seeded targets lie in passages this diff leaves unchanged and that cite none of the changed passages: 0.6, 1.2, 2.6, 2.7, 2.8, 3.0, 3.1, 3.10, 4.5, 4.7 and 5.13 (which cites DKV and §§5.10–5.12). §1.2 is named by the dependency lines of §§1.4 and 1.6, but the edits there only remove a duplicated external citation. The README flags no locator as unverified.

### Adversarial pass

"new" rows are computed for every statement this diff changes. "prev." rows are carried forward with their values from the previous report (`PRREVIEW-PadicFamilies~3`, *Adversarial pass*), for statements this diff leaves untouched. Every other row of `PRREVIEW-PadicFamilies~2` that the previous report carried is carried again unchanged.

| Statement | Instance | Left / constructed | Right / competing | Result |
|---|---|---|---|---|
| new: README:97, :2686, refinement fibres from QuaternionicModularForms §0.3 | `G₀ = S₃`, `Γ = ⟨(01)⟩`, `U = S₃`, `U′ = ⟨(12)⟩` | `(01)` swaps `U′ ↔ (01)U′` and fixes `(02)U′`, since `(01)(02) = (0 2 1) ∈ (02)U′`: 2 orbits | `[U:U′] = 3`; one class at `U` | The fibre is the orbit set `Γ_x\U/U′`, with count 2 = Σ over the single class. The product formula `3·1` correctly needs `Γ_x` inside the normal core, which here is trivial. |
| new: README:97, "for every open `U`" (QuaternionicModularForms §0.3 over AdelicAlgebraicGroups §5.3) | Hamilton's algebra over `ℚ`: `U = D_fˣ` (open, not compact) and `U = {1}` (compact, not open) | `U = D_fˣ`: `Cl(U)` has 1 point | `U = {1}`: `D^×\D_fˣ` is an uncountable group modulo a countable one, so infinite (AdelicAlgebraicGroups README:5520) | Openness is the right hypothesis; compactness is not needed after the reduction in §0.3. |
| new: README:97, §5.2, trivial-coefficient level forms `M(U,R)` = functions on `Cl(U)` with pullback and trace (QuaternionicModularForms §2.1) | Hurwitz level `U`, `U′ = U∩U₁(3)`, `R = ℤ` with trivial action | `M(U,ℤ) ≅ ℤ^{Γ_1} = ℤ`; `#Cl(U′) = 1`, so `M(U′,ℤ) = ℤ` and `res = id` | `(tr res f)(x) = Σ_{u∈U/U′} f(xu) = 8f(x)` | `tr∘res = [U:U′] = 8` while `#Cl(U′) = 1`. Restriction is injective. With trivial action, `A^{Γ_i} = A` gives `R^{#Cl(U)}`, as line 97 says. |
| new: §5.2 fibre bound "at most `[U_a:U_b]`" under the new citation | `F = ℚ(√5)`, `p = 3` inert, icosian maximal order (class number 1), `U = GL₂(Ô_F)`, `U_1 = U∩U(3)` | `𝒪_D^× = O_F^×·2I`. `φ⁴ = −1` in `𝔽₉`, so the image of `O_F^×` has order 8. Reduction is injective on `2I` (`e = 1 < 3−1`). The image `H` has order `120·8/2 = 480` | `#X(U_1) = #GL₂(𝔽₉)/480 = 5760/480 = 12 ≤ 5760 = [U:U_1]` | The bound holds and is strict, and the fibre points are the classes `xu`. |
| new: §5.6 freeness on `D^×\D_f^×` by right multiplication | `F = ℚ(√5)`, icosian order, `U = GL₂(Ô_F)` versus `V = U∩U(7)` (7 inert, `ℓ ∤ 6`) | At `U` the single class has stabiliser `𝒪_D^×/O_F^× ≅ 2I/{±1}`, of order 60, so the action is not free | At `V`, `εg ≡ 1 mod 7` with `g ∈ 2I` forces `g` scalar mod 7. Since `2I ↪ GL₂(𝔽₄₉)` with scalars `{±1}`, `δ ∈ F^×`: free. `φ⁸ = −1` in `𝔽₄₉`, so `|H| = 120·16/2 = 960` and `#X(V) = 5,644,800/960 = 5880` | The hypothesis is genuine and is met at the auxiliary level of Lemma 3.5. The action of `U∩F^×` is trivial on `D^×\D_f^×` because `F^× ⊂ D^×` is central, so the quotient acts. |
| new: §4.4 `H¹` versus the classical Selmer kernel (SelmerIwasawaCohomology §2.22) | `F = ℚ`, `S = {p,∞}`, `T = 𝔽_p` trivial, `p` odd, strict conditions | ordinary `H⁰` arrow `k → k⊕k` (diagonal), `J = k`, `dim J = 1` | the classical strict kernel misses `J` | `H¹(RΓ_f) ≠ Sel_L`, as §4.4 says ("`H¹` need not equal the classical compact Selmer kernel"). The `H⁰` term is now owned through §2.22. |
| new: §§5.2–5.5, maximal order and splittings, HilbertModularVarietiesAndShimuraCurves §R18.5.16a items 1–3 | `F = ℚ(√5)` versus `F = ℚ` | ramified set `{∞₁, ∞₂}`, even, so `D` exists. Maximal ⇒ Eichler of level 1 ⇒ `j_v(R_v) = M₂(O_v)` and `j_v(R_vˣ) = GL₂(O_v)` at every finite `v` | over `ℚ` the ramified set `{∞}` is odd, so there is no such `D` | The "even degree" hypothesis is present at lines 2682, 2717, 2743, 2761 and 2773. |
| new: `Suggested.lean` module form | elaborated types before and after | 6 declarations, `#check @` output | identical to `signatures.md` and to the previous round | The statements did not change. Three `sorry` warnings and no other output. |
| prev.: Lean §0a.17 `perfect_complex_ordinary_projector` (`e.asHom`) | `C = ℤ₅²[0]`, `t = U = (1 1; 0 5)` | `U^m → (1, −1/4; 0, 0) = e` for `m = n!`, and `e² = e` | `D = ℤ₅[0]`, `π = (1, −1/4)`, `ι = (1,0)ᵀ`: `π ≫ ι = e.asHom` and `ι ≫ π = 1` | Retain. |
| prev.: 0a.19 local finiteness (Lean def) | `I = 0`, `M = 𝔽₂[X]`, `T = ×X` versus `T = 1` | the orbit of 1 spans `{1, X, X², …}`, not finitely generated | `T = 1`: span `{1}` | Retain. |
| prev.: 0a.22 locally finite projector (Lean) | completed `⊕ℤ₃eᵢ`, `T eᵢ = 3ⁱeᵢ` | `T^{n!}e₀ = e₀`; `T^{n!}eᵢ` has valuation `i·n!` | `e` = projection to `ℤ₃e₀`; no `N` with `T^{N!} = e` | Retain the pointwise limit. |
| prev.: 0a.25 derived independence (Lean) | `C₀ = ℤ₃[0]`, `C₁ = ℤ₃[0] ⊕ (ℤ₃ —1→ ℤ₃)`, `T₁ = (1, 3)` | `e₁ = (1, 0)`, `D₁ = ℤ₃[0]` | `Q(ι₀) α Q(π₁) = id` | Retain. |
| prev.: 0.15 components | `Λ × Λ` | idempotents `(1,0)`, `(0,1)` | product 0, sum 1 | Retain. |
| prev.: 1.4 trivialisations | `θ′ = 2θ` over `ℤ₅` | basis `e/2` | measure `×2` | Retain opposite rules. |
| prev.: 1.7 congruence module | `A = {(a,b): a ≡ b mod pⁿ}`; `O[[t]]/(ϖ²t)` | `Ψ = ℤ/pⁿ`; `Ψ = O/ϖ` | IKM `Ψ_A(M) = 0` | Retain finite length. |
| prev.: 2.7a cuspidal comparison | `full = M ⊕ boundary` | full: `M` | cuspidal: `M` | Retain localisation. |
| prev.: 3.6 `Θ_k` | `k = 1` | `Θ_1(δ₀)(z²) = 2! = 2`; the kernel of `d²` on degree `≤ 1` has dimension 2 | the source's `k`-th derivative gives dimension 1 | Retain the `(k+1)`-st derivative. |
| prev.: 4.5 Euler system | `C₂`, `P(X) = 1 − aσ + bσ²`, `a = 1`, `b = 0` | `P(σ) = ((1,−1),(−1,1))` | the scalar replacement fails | Retain geometric Frobenius. |
| prev.: 4.8 divisibility | `v_𝔭(P_τ) = 2`, `k = 3` | defect 6 | bound `n` false | Retain. |
| prev.: 5.2 projector level | `U(pᵃ)`, `a ≥ 1`; `a = 0` | eigenvalue `N𝔭`, `(N𝔭)^{n!} → 0` | `N𝔭 + 1` is a unit | Retain positive level. |
| prev.: 5.8 control | `Sym¹`, `U = diag(1,5)` | kernel `5ⁿY ≠ 0` | zero ordinary factor mod `5^m` | Retain. |
| prev.: 5.9 density | `ζ_{pⁿ} − 1`; `ε² = 0` | infinitely many kernels | `ε` invisible | Retain. |

Every changed Check and worked example agrees with its section. The S₃, Hurwitz and icosian instances agree with the Checks of the supplier sections now cited (QuaternionicModularForms README:372–381, :654–656).

## Not verifiable

- The seeded targets in unchanged passages are 0.6, 1.2, 2.6, 2.7, 2.8, 3.0, 3.1, 3.10, 4.5, 4.7 and 5.13. This incremental round did not re-read their sources, because neither their text nor the passages they cite changed since `511de39`. The *Not verifiable* items of the earlier reports still stand: Dasgupta–Darmon–Pollack Definition 3.1 and Proposition 3.2; Bellaïche's 2011 author version; Diamond; Wiles 1995; the Hida primaries; Kisin Proposition 8.7; Coleman–Mazur; and the Skinner–Wiles `+` superscripts lost in the Numdam OCR.

## Source issues

- none
