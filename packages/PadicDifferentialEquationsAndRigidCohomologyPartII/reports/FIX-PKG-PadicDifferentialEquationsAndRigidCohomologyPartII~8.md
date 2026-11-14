# FIX-PKG-PadicDifferentialEquationsAndRigidCohomologyPartII~8

Findings of REV-PKG-PadicDifferentialEquationsAndRigidCohomologyPartII~7 (one review, one finding).

## F01 (P3) — applied

`Suggested.lean`, MS.2.2/2.3/2.6/2.7/2.9 bullet: "lack the weak and the `p`-adic completions of a lifted affine curve, its completed generic field and its local fields with their embeddings" → "lack the completed generic field of a curve and its local fields with their Frobenius lifts, derivations and embeddings". This is the reviewer's text, plus the structures that are actually missing (see the pattern repair below).

**Verification.** The pinned Tau Ceti `2fd255d9` has
`TauCeti/RingTheory/Dagger/WeakCompletion/Basic.lean:79` `piAdicCompletion` (an abbreviation for
Mathlib's `AdicCompletion (Ideal.span {algebraMap O S π}) S`), :190 `weakCompletion` (binder
`[Algebra.FiniteType O S]`) and :229 `weakCompletion.of`. A scratch file elaborated all three, plus
both specialisations to `O = ℤ_[2]`, `π = 2`, `S = Polynomial ℤ_[2]`. A smooth lift `A_C` is finitely
presented, hence of finite type. The finding is right. The five headlines are still not statable,
because each needs `E_α`, `E†_α` and the embeddings `E_η → E_α`, `Â_(C,K) → K_α[[x_α]]₀` and
`A†_(C,K) → E†_α`, or the isocrystal categories, and none of these is at the pins.

**Pattern repair (same inaccurate account of the pins, other places).**

- `Suggested.lean` opening paragraph: the inventory of Tau Ceti rings now also lists
  `TauCeti.Dagger.piAdicCompletion` and `TauCeti.Dagger.weakCompletion`, "as rings only", with no
  Frobenius lift. `grep -i frobenius` over `TauCeti/RingTheory/Dagger`, `PowerSeries/Bounded.lean`
  and `PowerSeries/OpenDisc` finds nothing.
- `Suggested.lean` opening paragraph: "neither has the Amice field, …" → Mathlib's `AdicCompletion`
  and localisations give the underlying rings of the Amice field and of `E_η`; what is missing is
  these fields with a Frobenius lift and derivation. Verified at the Mathlib pin:
  `Mathlib/RingTheory/AdicCompletion/Basic.lean:172` (`CommRing` at `Algebra.lean:97`),
  `Localization.Away` at `Mathlib/GroupTheory/MonoidLocalization/Away.lean:140`, and
  `Localization.AtPrime` at `Mathlib/RingTheory/Localization/AtPrime/Basic.lean:55`. The local-theorems
  bullet already used this qualified form. The MS.2.5/MS.4.2 bullet now reads "the completed generic
  field of a curve with its Frobenius lift and derivation".
- README, Scope "Already in the library": adds Tau Ceti's `π`-adic and weak completions as the rings
  `Â_C`, `A†_C` of MS.0.1. It also drops "derivations" from the list of what the library lacks. That
  claim was inaccurate: Tau Ceti has `PowerSeries.OnOpenDisc.derivative`
  (`TauCeti/RingTheory/PowerSeries/OpenDisc/Basic.lean:342`, so the derivative preserves the open-disc
  ring) and `TauCeti.Dagger.Omega.d` (`Omega/Basic.lean:114`, a universal derivation for every algebra).
- README, Scope "Imported": "weak completions, Frobenius lifts and étale lifting" → "smooth lifts,
  Frobenius lifts on weak completions and étale lifting". The parent's RD.0.42 is stated on Tau
  Ceti's `weakCompletion`, and the parent's own library list says so.
- README, `From Tau Ceti`: a new bullet for `TauCeti.Dagger.piAdicCompletion`, `weakCompletion` and
  `weakCompletion.of`, with their exact binders. The closing paragraph now says "these rings" and that
  a Frobenius lift on `A†_C` is the parent's §RD.0.42. The parent contract bullet for
  §§RD.0.39/RD.0.42/… now reads "Frobenius lifts on the weak completions of Tau Ceti above".
- README MS.0.1: `Â_C` was used without a definition. It is now defined as
  `TauCeti.Dagger.piAdicCompletion π A_C`, and `A†_C` as `TauCeti.Dagger.weakCompletion π A_C ⊆ Â_C`.
  Both names are added to the MS.0.1 *Needs:* line and to the Layer MS.0 Dependencies.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result / change |
| --- | --- | --- | --- |
| Tau Ceti has `piAdicCompletion`, `weakCompletion` (rings only) | `O = ℤ_[2]`, `π = 2`, `S = ℤ_[2][X]`; `π = 0`; `π` a unit | Both elaborate; `weakCompletion` keeps `[Algebra.FiniteType O S]`. `π = 0`: `S† = S^∧ = S`. Unit `π`: completion is the zero ring. A uniformiser is neither 0 nor a unit, so the convention avoids both degenerate cases. Frobenius grep: 0 hits | Docstring and README inventory corrected |
| `Â_C`, `A†_C` of MS.0.1 equal Tau Ceti's objects for `π` versus `p` | `e = 1` (`ℤ_p`, `π = p`); `e = 2` (`ℤ_p[√p]`, `p = π²`) | `(p) = (π^e)`, so the adic topologies, and hence the completions, agree. Weak sets: `Σ p^m Q_m` with `deg Q_m ≤ c(m+1)` becomes index `j = em` with `deg ≤ c(j+1)`. Conversely, grouping `j = em + r` gives `deg ≤ ce(m+1)` | Same rings; README states the agreement |
| Weak versus `π`-adic completion (`C = A¹`, `A_C = O_K[x]`) | `Σ π^n x^n`; `Σ π^n x^(n²)` | First: `P_j = X^j`, `deg j ≤ 1·(j+1)`, so it lies in both. Second: coefficients tend to 0, so it lies in `Â_C`, but `deg n²` is not `≤ c(n+1)` for any `c`, so it is not in `A†_C` | Distinguishes the two carriers; agrees with the MS.2.2 Check on `Σ p^n x^(p^n)` (degree `p^n`, not in `A†`) |
| Amice field and `E_η` have native underlying rings | `O_E = (O_K⟦t⟧[1/t])^∧_π`, element `Σ_(n≥0) p^n t^(−n)`; `E_η` for `A_C = O_K[x]`, `P = (π)` | Partial sums mod `p^m` are Laurent polynomials, so the element lies in `O_E`. `O_K[x]/(π) = k[x]` is a domain, so the `[P.IsPrime]` binder of `Localization.AtPrime` holds. For general `A_C`, `k[C]` is integral because `C` is smooth and connected | Claim holds as a statement about rings; the fields with `φ`, `d` stay missing |
| Five MS.2 headlines remain not statable | MS.2.2(1): `Â_(C,K) = ⋂_α (E_η ∩ K_α[[x_α]]₀)` inside `E_α` | `Â_(C,K)` is native; `K_α[[x_α]]₀` is native as a ring; `E_α` with `E_η → E_α` and `Â → K_α[[x_α]]₀` is not native. MS.2.3/2.6/2.7/2.9 need isocrystals | Still listed as not statable |
| "derivations not in the library" (README Scope) | open-disc ring; weak completion | `OnOpenDisc.derivative` at :342 elaborates; `Omega.d` exists for every algebra | Inaccurate claim removed |

## Checks

- `lake env lean packages/PadicDifferentialEquationsAndRigidCohomologyPartII/Suggested.lean`
  (from the content checkout): exit 0, no output. The file has 0 declarations, 0 `sorry`, 0
  `set_option` and a single `import Mathlib`. The `#check @name` inventory of package declarations is
  empty. A separate scratch file elaborated `#check` for every newly cited library name
  (`TauCeti.Dagger.piAdicCompletion`, `TauCeti.Dagger.weakCompletion`,
  `TauCeti.Dagger.weakCompletion.of`, `PowerSeries.OnOpenDisc.derivative`, `AdicCompletion`,
  `Localization.Away`, `Localization.AtPrime`) and both `ℤ_[2][X]` specialisations, with exit 0. The
  types match the README contract.
- Dependency check, exact output:

  ```text
  depcheck: 240 roadmaps, 2170 edges, 0 problem(s)
  ```

  It shows no UPWARD, CYCLE or moved line.
- `roadmaps resolve` on the README found no cross-roadmap citation and no Lean name it could not
  locate.

## Gate failures

None were listed.

## Notes for the maintainer

- No new targets, no Lean declarations and no supplier gaps; `design/plan.json`, `sources.toml` and
  `metadata.toml` are unchanged. No source was fetched.
- No name that other roadmaps cite was changed or removed. The parent
  (PadicDifferentialEquationsAndRigidCohomology) already cites `TauCeti.Dagger.weakCompletion` in its
  RD.0.42 and in its library list, so the README now agrees with its supplier.
- Ownership: no construction was added. The new references are to pinned Tau Ceti and Mathlib
  declarations, so no open pull request can own them.
