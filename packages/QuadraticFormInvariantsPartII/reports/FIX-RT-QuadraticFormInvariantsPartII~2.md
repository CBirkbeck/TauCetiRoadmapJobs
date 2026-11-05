# FIX-RT-QuadraticFormInvariantsPartII~2: red-team round 2 repaired

Two reviews (RT-QuadraticFormInvariantsPartII~2a, five findings; RT-QuadraticFormInvariantsPartII~2b,
three findings). The pair a/F01 and b/F02 raise the same defect and are settled once. Every
finding was verified against the pins (Mathlib `f6090c7`, Tau Ceti `358314d4`), the cited supplier
heads, and the source cache before any edit. Files changed: `packages/QuadraticFormInvariantsPartII/README.md`
and `packages/QuadraticFormInvariantsPartII/Suggested.lean`; `metadata.toml`, `sources.toml` and
`design/plan.json` are unchanged.

## RT-QuadraticFormInvariantsPartII~2a/F01, RT-QuadraticFormInvariantsPartII~2b/F02 (P1, P3) — applied

Verified: at the pin, `TauCeti/LinearAlgebra/QuadraticForm/Witt/Round.lean` lines 44 and 61 declare
`oneFoldPfister_smul_equivalent_iff` and `twoFoldPfister_smul_equivalent_iff` over any `CommRing R`,
as equivalences `(c • ⟨1, −a⟩).Equivalent ⟨1, −a⟩ ↔ c ∈ unitValueSet ⟨1, −a⟩` (and the two-fold
analogue); a repository grep finds no `_of_mem_unitValueSet` name. Old → new: the supplier
contract (From Tau Ceti, `Witt/Round.lean` bullet) and 1.4 now cite the `_iff` names, say the
statements are equivalences over every commutative ring and that roundness is the direction from
membership to similarity, and 1.4 says the comparison with the diagonal presentation
(`[1, a₀] ≅ ⟨1, −(1 − 4a₀)⟩`, `⟨1, −a₁, −(1 − 4a₀), a₁(1 − 4a₀)⟩`) is where `2` invertible enters.
No other occurrence of the wrong names existed (grep of README and Lean).

## RT-QuadraticFormInvariantsPartII~2a/F02 (P2) — applied differently

Verified: the carriers (`ValuationSubring`, `IsLocalRing.ResidueField`, `IsLocalRing.residue`,
`HenselianLocalRing`, `RingHom`) exist at the pin, so the coefficient-field statement is statable
and it is a result §6.1 says this roadmap proves. Added to `Suggested.lean`, Layer 6:
`exists_residueSection_of_charZero` (henselian `O` of arbitrary rank, `CharZero κ` ⇒ a ring-hom
section `σ : κ →+* O` of the residue map) and `quadraticPfister_equivalent_residueSection` (for any
section `σ`, units `ε`, `a₀` with `1 − 4a₀` a unit, `quadraticPfister ε a₀ ≅ quadraticPfister
(σ ∘ res ε) (σ (res a₀))`). Differently: relative algebraic closedness of the image stays a README
target of 6.1 (a few lines from Hensel's lemma and integrality, not a headline), and the transport is
stated for every section in every characteristic rather than only residue characteristic zero,
because the proof supports it (see the adversarial table: in characteristic two the terminal block
moves by Artin–Schreier Hensel and the outer slots by the principal-unit criterion and 0.5; a
section forces `char K = char κ`, so there is no mixed case). README 6.1 names both theorems and
carries the proofs and six new or revised Checks; the module docstring lists them under Layer 6.

## RT-QuadraticFormInvariantsPartII~2a/F03 (P1) — applied

Verified: `HermitianKTheoryOfPoincareCategories` at its open head (#1266, read with `roadmaps show`)
has §3.5 "Strictly metabolic 1-quadratic forms are hyperbolic" (`(P, q) ≃ hyp(L)` on finitely
generated projectives, with the Check that it recovers the classical fact for quadratic forms);
merge order places it at line 78, before this roadmap (315). Old → new: 0.5 no longer proves
"strictly metabolic nonsingular quadratic forms over a field are hyperbolic"; it imports §3.5
specialized to finite-dimensional vector spaces, identifies the hyperbolic object on `L` with
`dim L` coordinate hyperbolic planes of 0.1, and uses cancellation (0.3) to identify the monoid
quotient of §3.4 with the Grothendieck group modulo `ℍ`. The supplier contract now lists §3.5 and
drops the former "Assumed: strictly metabolic = hyperbolic" clause (which contradicted the "Prove"
in 0.5); the 0.5 *Needs* line and the Layer 0 Dependencies name §3.5. Tensor action, filtration and
the comparison with `TauCeti.fundamentalIdeal` stay here.

## RT-QuadraticFormInvariantsPartII~2a/F04 (P3) — applied

Verified: at the open head supplied for `GeometryOfNumbersAndQuadraticArithmeticPartII`
(`rev/1691`), README line 93 is "### 0.1 Integral Witt comparison" (full polar map
`σ : Wq(R) → Ws(R)`, inverse `b ↦ x ↦ b(x,x)/2` when two is a unit); there is no §DA.0 at that head.
The board's design README of the same roadmap still numbers it `DA.0/integral-comparison`; the
brief says to cite the open head, so the README now cites "§0.1 (Integral Witt comparison)", says
the comparison is through the full polar form, and that it does not enter the diagonal comparison
of 0.5. The maintainer may want to know that the two copies of that supplier are numbered
differently.

## RT-QuadraticFormInvariantsPartII~2a/F05 (P2) — applied

Verified: the Conventions say valuations outside Layer 7 are multiplicative (`O = {v ≤ 1}`), so
"algebraic over `E` has value zero" was wrong (`v(2) = 1` for `E = ℚ` in `ℚ((t))`; only `0` has value
`0`). Old → new (6.1): every nonzero `x` algebraic over `E` has value `1`, since `x` and `x⁻¹` are
integral over `E ⊆ O` and `O` is integrally closed in `K`; its minimal polynomial reduces to an
irreducible polynomial over `Ē = κ` with the root `x̄`, hence has degree one, so `x ∈ E`; `0 ∈ E`.
This is simpler than the reviewer's Hensel route and needs no simple-root uniqueness. Check added
with `v(2) = 1`, `v(0) = 0`, `v(t) < 1`. No other "value zero" in the valuation sense occurs in the
README (line 120 is about values of quadratic forms).

## RT-QuadraticFormInvariantsPartII~2b/F01 (P2) — applied

Verified: ekm lines 5176–5181 (printed p. 94) say the quotient field of `S•(V*)/(ψ)` is purely
transcendental of degree one over `F(ψ)`, and Theorem 22.5 (ekm 5198–5205) is as the README
states; hyperbolicity ascends to every field containing that quotient field and descends from it
to `F(ψ)` because the anisotropic part of the nonsingular `q_{F(ψ)}` stays anisotropic over
`F(ψ)(x)` (2.1), so "`q` hyperbolic over every `L` receiving `K[T]` with kernel exactly `(ψ(T))`"
is equivalent to "`q_{F(ψ)}` hyperbolic". Added `isRepresentedBy_smul_of_forall_equivalent_dualProd`
to Layer 2 of `Suggested.lean` (hypotheses: `q`, `ψ` anisotropic, `ψ(T)` irreducible, the universal
hyperbolicity clause, `a ≠ 0` represented by `q`, `b ≠ 0` by `ψ`; conclusion `((a*b) • ψ).IsRepresentedBy q`);
removed the subform bullet from the not-statable list and added it to "Stated here"; README 2.10
now says "State …", explains the device and its two directions, and gains a Check that
one-dimensional and zero-dimensional `ψ` are excluded by irreducibility and that the zero `q` is
vacuous.

## RT-QuadraticFormInvariantsPartII~2b/F03 (P3) — applied

Verified: ekm line 2360 heads "Proposition 7.13" (printed p. 42). Old → new: 2.2 cites "EKM,
Proposition 7.13, p. 42"; the References entry reads "Lemmas 7.12 and 7.15, Proposition 7.13".

## Checks run

Elaboration, from the content checkout:

```text
lake env lean packages/QuadraticFormInvariantsPartII/Suggested.lean
18 × "warning: declaration uses `sorry`" (the 15 previous theorems and the 3 new ones); no errors; exit 0
```

Repair of the worker's check: the worker's `lake build` logged the warning that the file imports
`Mathlib`, which is designed for the module system, without `module`. The file now starts with
`module`, its five imports are `public import` lines (Mathlib and the same four Tau Ceti modules),
and `@[expose] public section` opens before the namespace, the form of `CoboundaryExpansion` on main.
No declaration, docstring, binder or README line changed. Re-elaborated after the change with the
same command: the same 18 `sorry` warnings, no other warning, no error, exit 0.

Binder audit: a scratch copy of `Suggested.lean` with `#check @name` for every declaration (24: 6
definitions, 18 theorems) elaborated with exit 0; every elaborated type was compared with its README
statement. The three new types carry all their binders explicitly (`Field K`, `ValuationSubring K`,
`HenselianLocalRing O`, `CharZero (ResidueField O)` for the existence theorem; the section equation,
`IsUnit (1 − 4a₀)` for the transport; both anisotropy hypotheses, irreducibility, the universal
hyperbolicity clause and the four value hypotheses for the subform theorem). Nothing was lost: the
file has no `variable` block. Changed since the start of the round: the transport theorem lost the
residue-characteristic hypothesis it briefly carried in this round (see the table), nothing else.

Dependency check:

```text
depcheck: 236 roadmaps, 2159 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. `roadmaps resolve` on the README: no cross-roadmap citation and
no Lean name found nowhere (the two wrong Tau Ceti names and the lead on `IsCi.exists_common_zero`
are gone).

No gate failure was listed in the brief. No source was fetched or requested; `kato82`, `arason75`,
`milnor70` stay settled uncertified. Ownership of the two new coefficient-field statements and of
the subform theorem was checked by object with `roadmaps grep` (coefficient field / residue section
/ subform) across main and the indexed open heads: no other roadmap states them; pull requests
outside the index were not searched.

## Adversarial pass on the new and changed statements

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| `isRepresentedBy_smul_of_forall_equivalent_dualProd` | `ψ = [1,1]`, `q = [1,1] ⊥ t[1,1]` over `𝔽₂(t)`; `q = ℍ`; `m = 0`; `m = 1`, `ψ = ⟨c⟩`; `n = 0` | `ψ(T) = X² + XY + Y²` irreducible; every `L` with kernel `(ψ(T))` contains `𝔽₄(t)(x)`, where `[1,1] ≅ ℍ`, so `q_L ≅ 2ℍ`, `k = 2`; conclusion `ψ ⊆ q` with `a = b = 1`, true. `q = ℍ`: `hq` false. `m = 0`: `ψ(T) = 0`, `Irreducible 0` false. `⟨c⟩`: `cX²` reducible. `n = 0`: `q` represents no `a ≠ 0`, vacuous | true; matches EKM 22.5 with "nonzero `q`" encoded by `a ≠ 0` | added |
| Universal-field device for `F(ψ)` | `Frac(K[T]/(ψ))`; a field `L ⊇ F(ψ)(x)` | `Frac(K[T]/(ψ)) = F(ψ)(x)` (ekm 5178–5179); `q_{F(ψ)}` hyperbolic ⇒ `q_L` hyperbolic; `q_{F(ψ)(x)}` hyperbolic ⇒ anisotropic part of `q_{F(ψ)}` is anisotropic over `F(ψ)(x)` (2.1) hence zero | both directions hold | README 2.10 explains both |
| `exists_residueSection_of_charZero` | `ℚ((t))`; `O = ⊤` on a field of characteristic 0; `ℚ₂`; `𝔽₂((t))`; `ℚ(s)((t))` | `σ = ` constant inclusion; `σ = ` inverse of `O ≅ κ`; `CharZero 𝔽₂` false (no section: `σ(2) = 2 ≠ 0`); `CharZero 𝔽₂` false although the constant inclusion is a section (hypothesis sufficient, not necessary, as the README's existence claim is stated); two sections `s ↦ s`, `s ↦ s + t` | true | added |
| `quadraticPfister_equivalent_residueSection`, residue char `≠ 2` | `ℚ((t))`, `ε = 1 + t`, `η = 1`; `m = 0`, `a₀ = t`, `b₀ = 0`; `a₀ = (1 − t)/4`; `𝔽₃((t))`, `ε = 1 + t` | `(1 + t)/1` principal unit, square; `[1, t] ≅ ⟨1, −(1 − 4t)⟩ ≅ ⟨1, −1⟩ ≅ [1, 0]`; `1 − 4a₀ = t` nonunit: `[1, a₀] ≅ ⟨1, −t⟩` nonsingular, `[1, 1/4]` singular, not isometric, `ha₀` false; `1 + t` a square in `𝔽₃((t))` (binomial denominators are powers of 2) | true; `ha₀` needed | `h2` removed after the next row |
| same, residue char `2` | `𝔽₂((t))`, `σ` constant, `ε = 1 + t`, `η = 1`, `a₀ = 1`; `m = 0`, `a₀ = t`, `b₀ = 0` | `⟨1, 1 + t⟩_b ≇ ⟨1, 1⟩_b` (`1 + t` not a square), but `[1,1] ⊥ (1+t)[1,1]` is hyperbolic since `1 + t = N(z + ω)` with `z² + z = t`, `z = t + t² + t⁴ + ⋯`, as is `[1,1] ⊥ [1,1]`; `[1, t] ≅ [1, 0]` by the same `z` | true; my first draft's "excluded in characteristic two" was false (it contradicted 4.2) | hypothesis `2 ≠ 0` in `κ` deleted; char-2 proof added to 6.1 and the docstring; Check corrected |
| same, section hypothesis | `ℚ(s)((t))`, `σ′(s) = 2s` (not a section), `m = 0`, `a₀ = s` | `[1, s] ≅ ⟨1, −(1 − 4s)⟩` vs `[1, 2s] ≅ ⟨1, −(1 − 8s)⟩`; `(1 − 4s)/(1 − 8s)` not a square in `ℚ(s)`, hence not in `ℚ(s)((t))` (a square there has a square residue) | `hσ` needed | Check added |
| 6.1 algebraic elements | `E = ℚ ⊂ ℚ((t))`: `x = 2`; `x = 0`; `x = t` | `v(2) = 1`, `2 ∈ E`; `v(0) = 0`, `0 ∈ E`; `t` transcendental, `v(t) < 1`, not covered | true in the multiplicative convention | text and Check replaced |
| 0.5 import of Hermitian §3.5 | `xy` over `𝔽₂`; `⟨1,1⟩_b` as a quadratic form `(x + y)²` | first coordinate line is a strict Lagrangian, `hyp(L) = ℍ`; `(x + y)²` is singular, not a Poincaré object, so no claim | import matches §3.5's hypotheses (1-quadratic, projective) | applied; cancellation retained for the Grothendieck-group identification |
| 1.4 low-fold citation | `⟨1,1⟩ = ⟨1, −(−1)⟩` over `ℚ`, which is `quadraticPfister` with `m = 0`, `a₀ = 1/2` (`1 − 4a₀ = −1`); `c = 2` | `⟨1,1⟩(1,1) = 2`, so `2 ∈ unitValueSet ⟨1, 1⟩`; the reverse implication of `oneFoldPfister_smul_equivalent_iff (−1) 2` gives `2⟨1,1⟩ ≅ ⟨1,1⟩`; the forward implication is the converse 1.4 also states | the cited direction is the one used | names replaced |
| 2.2 locator | ekm 2360 | heading "Proposition 7.13" | misprint confirmed | corrected in two places |
| §0.1 locator | rev/1691 README 93 | "### 0.1 Integral Witt comparison"; design README 28–37 says DA.0 | open head wins per brief | corrected |

## For the maintainer

- New Lean names: `isRepresentedBy_smul_of_forall_equivalent_dualProd` (Layer 2),
  `exists_residueSection_of_charZero` and `quadraticPfister_equivalent_residueSection` (Layer 6). No
  name was deleted or renamed, so `LogicAndDefinabilityInNumberTheoryPartII` and
  `RealSurfacePeriodIndex`, which cite 1.1, 3.8–3.9, Layer 4, Layer 5, 5.6, 6.5 and 7.2, are unaffected.
- The transport theorem is now stated for every residue characteristic; Dittmann–Pop only use the
  residue-characteristic-zero case, which is what 6.5 consumes.
- `GeometryOfNumbersAndQuadraticArithmeticPartII` is numbered §0.1 at its open head (#1691) and
  §DA.0 in the board's design README; this roadmap follows the open head.
- `HermitianKTheoryOfPoincareCategories` is not on main; its §3.5 was read at the head of #1266.
- No suspicious instruction was found in any text read.
