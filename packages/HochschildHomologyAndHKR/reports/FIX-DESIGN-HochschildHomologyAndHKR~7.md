# Repair report: HochschildHomologyAndHKR, design round 7

Review resolved: `REV-DESIGN-HochschildHomologyAndHKR~6`. It has two findings, F01 and F02, both
P3. Files edited:

- `packages/HochschildHomologyAndHKR/design/README.md`
- `packages/HochschildHomologyAndHKR/design/plan.json`

`packages/HochschildHomologyAndHKR/sources.toml` is unchanged. No new work is cited, and no
`needs-references.toml` was written. There is no `Suggested.lean` at the design stage. So nothing
was elaborated, and there was no `#check` binder audit to run.

Every library claim was checked at the pins: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`
and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. These are the revisions of
`.lake/packages/*` in the content checkout, and they agree with the plan's `baseline`.

## REV-DESIGN-HochschildHomologyAndHKR~6/F01 (P3) — applied

The README and plan now account for the pinned normalised cochains.

- **Scope, variants list (README line 146).** A new bullet says how §2.2 differs from
  `TauCeti.normalizedHochschildCochains`, `TauCeti.normalizedHochschildCochainComplex` and
  `TauCeti.normalizedHochschildCochainComplexι`:
  - it allows any bimodule of coefficients;
  - it proves the homotopy equivalence with the full complex;
  - the pinned objects are its dual-bimodule case, under `TauCeti.multilinearCurryFirstEquiv`;
  - NoncommutativeGeometry N1.Cyclic keeps its own case `k = N = ℂ`.
- **Tau Ceti contract (lines 426, 438).** Two new bullets give the pinned complex, the normalised
  submodule, subcomplex and inclusion, the dual-bimodule instances and the currying comparison.
  Each states its hypotheses and what the pin lacks.
- **§2.2.** The Needs line names the nine declarations. A new API bullet (line 848) states the
  comparison, and a new Check (line 868) tests it.
- **Layer 2 Dependencies (line 886).** The new declarations are named there.
- **Plan target 2.2.** It gains nine `tauceti:` prerequisites, the API entry
  `normalizedCochainComplex_isoTauCeti` and the test `normalized_cochains_pinned_comparison`.

The finding is correct. Evidence, read at the pin:

- **The normalised submodule.** `TauCeti/RingTheory/CyclicCohomology/Normalized/Basic.lean:41`
  defines it as the cochains `φ` with `φ a = 0` whenever `a i = 1` for some `i ≠ 0`. Line 59 shows
  degree zero carries no condition.
- **The complex and its inclusion.** Line 278 is the complex and line 300 its inclusion into
  `hochschildCochainComplex` (`TauCeti/RingTheory/HochschildCohomology/Complex.lean:137`). The
  degree-`n` term of that complex is `MultilinearMap R (fun _ : Fin (n + 1) ↦ A) M`.
- **Currying.** `TauCeti/LinearAlgebra/Multilinear/Curry.lean:62` gives
  `multilinearCurryFirstEquiv f m x = f (Fin.cons x m)`.
  `TauCeti/RingTheory/HochschildCohomology/Dual.lean:65, 70` give the actions
  `(x • f) y = f (y * x)` and `(op x • f) y = f (x * y)`, and line 138 is the coboundary comparison.
- **Why the comparison restricts.** The pinned slots `i ≠ 0` are the slots `j.succ`, which are
  exactly the arguments `a₁,…,a_n` after currying. So `φ` is normalised exactly when
  `multilinearCurryFirstEquiv φ` lies in `N^n`.
- **Nothing on the pin already proves the homotopy equivalence.** No result in Tau Ceti says the
  pinned inclusion is a homotopy equivalence or a quasi-isomorphism. `grep` found only the
  definition and `normalizedHochschildCochainComplexι_f`. The `cochainEquiv` of `Normalized/Chains.lean:123`
  is a duality, not a comparison.

The review's repair test was recomputed, together with a cocycle check:

- `φ(a₀,a₁) = (a₀∂a₁)(0)` gives `bφ(a₀,a₁,a₂) = (a₀a₁∂a₂ − a₀a₁∂a₂ − a₀a₂∂a₁ + a₂a₀∂a₁)(0) = 0`.
- `ψ(1) = 0`.
- `ψ(ab)(y) = (ya∂b)(0) + (yb∂a)(0) = (a·ψ(b))(y) + (ψ(a)·b)(y)`, so `ψ` is a derivation.
- With the wrong slot, `ψ′(1)(x) = 1`.

The same pattern elsewhere: the other pinned objects near this roadmap's targets were read again.

- **`TauCeti.normalizedHochschildChains.cochainEquiv`.** It is the `k`-dual of the normalised
  chains with coefficients in `A`. §7.1 is an `R`-linear, unnormalised isomorphism for commutative
  `R`, so it is not a variant of this object.
- **`TauCeti.hochschildCohomology`.** It is already described in the scope (line 137) as
  `HH^n(A, Hom_k(A,M))`. The new §2.2 bullet makes that description a stated isomorphism of
  complexes.

## REV-DESIGN-HochschildHomologyAndHKR~6/F02 (P3) — applied

The §4.2 Check (README line 1115) changes from "In degree two, `(h b′ + b′ h)(a₁ ⊗ a₂) = …`" to
"On `B₀(A) = A ⊗ A`, `(h μ + b′ h)(a₁ ⊗ a₂) = …`". It now cites Ginz05 lines 774–782 with the
remark that the source counts tensor factors. It also adds the `B₁(A)` computation, where `h b′`
is the right term.

In plan 4.2, the test `bar_degree_two` becomes `bar_degree_zero` with the same content. The API
entry now reads "`b′∘h + h∘b′ = id` on `B_n(A)` for `n ≥ 1`, `b′∘h + h∘μ = id` on `B₀(A)`, `μ∘h = id`
on `A`".

The finding is correct:

- §4.2 sets `B_n(A) = A ⊗ A^{⊗n} ⊗ A`, so `a₁ ⊗ a₂ ∈ B₀(A)`.
- The README's own API bullet, unchanged, states `b′∘h + h∘μ = id` on `B₀(A)`.
- Ginz05 line 762 indexes `B_i A = A ⊗ A^{⊗i} ⊗ A`, as the README does. But line 774 calls the
  two-factor piece `A^{⊗2}` "degree 2", and in lines 775–776 its `b` on that piece is the
  multiplication `μ`.

The same pattern elsewhere: every bar-complex degree label in the README and plan was searched.
That covers `B₀`, `B₁`, `B₂`, "degree two", `h b′`, `b′ h` and `h ∘ μ`. The §8.3 Checks (`j = 1, 2`,
`m = 0`) and the Layer 4 Examples already use the README's indexing. README line 1508 ("needed in
degree two") concerns `HH₂` in §7.2 and is unrelated. No other occurrence.

## Adversarial pass on the changed statements

`∂ = ∂_x`; `E_ij` are matrix units.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Contract: pinned `b` formula | `n = 0`, `φ : A → N` | `bφ(a₀,a₁) = φ(a₀a₁) − φ(a₁a₀)`: face `0` with sign `+`, last face `(a₁a₀)` with sign `(−1)^1` (`Cochain.lean:233, 571`) | agrees with the pin | none |
| Contract and §2.2: dual-bimodule convention | `A = Mat₂(k)`, `k` nonzero, `n = 0`, `f = (E₁₁-entry)`, `a = E₁₂`, `x = E₂₁` | `δf(a)(x) = (a·f − f·a)(x) = f(xa) − f(ax) = f(E₂₂) − f(E₁₁) = −1`; pinned `bφ(x,a) = φ(xa) − φ(ax) = −1`. The swapped convention `(a·g)(x) = g(ax)` gives `+1` | stated convention correct; swapped one excluded | none |
| §2.2 API: currying restricts | `n = 0` | pinned degree-zero condition empty (`Normalized/Basic.lean:59`); `N⁰(A, A →ₗ N) = A →ₗ N` | both everything | none |
| same | `n = 1`, `A = k[x]`, `N = k`, `φ(a₀,a₁) = (a₀∂a₁)(0)` | `φ(a₀,1) = 0`; `ψ(1) = 0`; wrong slot `ψ′(1)(x) = 1` | holds; wrong slot fails | Check added |
| same | `A = k`, `n ≥ 1` | pinned: `φ(a₀,c,…) = c·φ(a₀,1,…) = 0`, so the pinned module is `0`; ours `N^n(k, k →ₗ N) = 0` (§2.2 Check `A = k`) | consistent | none |
| same | `k = 0` | every module is `0` on both sides | holds | none |
| §2.2 API: commutes with differentials | `n = 1`, `φ` above | `bφ = 0`; `δψ(a,b) = aψ(b) − ψ(ab) + ψ(a)b = 0` by the computed Leibniz identity, as `curry(bφ) = δ(curry φ)` predicts | consistent | none |
| §2.2 Check (new) | as stated | `bφ(a₀,a₁,a₂) = (a₀a₁∂a₂ − a₀a₁∂a₂ − a₀a₂∂a₁ + a₂a₀∂a₁)(0) = 0`; `ψ(ab)(y) = (ya∂b)(0) + (yb∂a)(0)`; `(a·ψ(b))(y) = ψ(b)(ya) = (ya∂b)(0)`; `(ψ(a)·b)(y) = ψ(a)(by) = (by∂a)(0)` | holds | added |
| Scope: NoncommutativeGeometry N1.Cyclic case | `k = N = ℂ`, unital `A` | NoncommutativeGeometry README lines 609–612, 670: comparison of normalised and full scalar cochains "on cohomology"; pinned complex at `R = M = ℂ` | special case of §2.2 via the new bullet | clause added |
| §4.2 Check, `B₀` | general `a₁,a₂`; `A = k`, `a₁ = a₂ = 1` | `hμ(a₁⊗a₂) = 1⊗a₁a₂`; `b′h(a₁⊗a₂) = b′(1⊗a₁⊗a₂) = a₁⊗a₂ − 1⊗a₁a₂`; sum `a₁⊗a₂`. For `A = k`: `hμ(1) = 1`, `b′h(1) = 1 − 1 = 0`, sum `1` | holds | relabelled |
| §4.2 Check, `B₁` | general; `A = k` | `b′h(a₀⊗a₁⊗a₂) = a₀⊗a₁⊗a₂ − 1⊗a₀a₁⊗a₂ + 1⊗a₀⊗a₁a₂`; `hb′(a₀⊗a₁⊗a₂) = 1⊗a₀a₁⊗a₂ − 1⊗a₀⊗a₁a₂`; sum `a₀⊗a₁⊗a₂`. For `A = k`: `b′₂ = 1 − 1 + 1 = 1`, `b′₁ = 0`, sum `1` | holds | added |
| §4.2 wrong label | "degree two" read as `B₂(A)` | `B₂(A) = A^{⊗4}` does not contain `a₁ ⊗ a₂`, and `h b′` on `B₀` has no `b′ : B₀ → B₋₁` | old label excluded | fixed |
| Plan 4.2 API entry | `n = 0, 1` | the same values as the two rows above | holds | reworded |

## Checks

Dependency check (after all edits):

```text
candidate: HochschildHomologyAndHKR is not in the merge order yet; checked as if placed after RefinedTraceMethods (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2233 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line.

- **Citation resolver.** No cross-roadmap citation and no Lean name was found nowhere. The tool
  says it did not check names outside TauCetiRoadmap ("no pinned Lake packages on this host"). So
  every new Tau Ceti name was checked by hand at the pin:
  - `hochschildCochainComplex`: `Complex.lean:137`.
  - `normalizedHochschildCochains`, `normalizedHochschildCochains_zero`,
    `normalizedHochschildCochainComplex`, `normalizedHochschildCochainComplexι`:
    `Normalized/Basic.lean:41, 59, 278, 300`.
  - `multilinearCurryFirstEquiv`: `Curry.lean:37`.
  - `DualBimodule.instModule`, `DualBimodule.instModuleOp`,
    `multilinearCurryFirstEquiv_hochschildCoboundary`: `Dual.lean:75, 84, 138`.
- **`plan.json`.** It parses, and its formatting is unchanged (indent 1, non-ASCII kept).
- **Hygiene.** The README has no LaTeX delimiters and no machine paths.

## Notes for the maintainer

- **Ownership.** I searched for the objects across main and the open pull request heads:
  `normalizedHochschildCochain`, `multilinearCurryFirstEquiv`, `DualBimodule`. Only
  NoncommutativeGeometry (on main) mentions them.
  - Its N1.Cyclic plans the comparison of normalised and full scalar cochains on cohomology for
    `k = ℂ`, inside its cyclic theory.
  - This roadmap owns the general statement: any commutative `k`, any bimodule, a homotopy
    equivalence. The scope now says that NoncommutativeGeometry keeps its own case.
  - No supplier edge is added; NoncommutativeGeometry is on main and is not consumed.
- **Changed names.** The plan test `bar_degree_two` is now `bar_degree_zero`. No roadmap cites it,
  and no other roadmap cites any id of this one, since this roadmap has no downstream consumers.
- **Suspicious text.** None in the review.
