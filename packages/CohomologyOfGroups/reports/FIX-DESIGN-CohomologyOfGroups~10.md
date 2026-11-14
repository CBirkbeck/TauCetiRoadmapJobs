# FIX-DESIGN-CohomologyOfGroups~10

Review settled: `REV-DESIGN-CohomologyOfGroups~9`. It has four findings: two P2 and two P3. Files
edited: `packages/CohomologyOfGroups/design/README.md` and `packages/CohomologyOfGroups/design/plan.json`.
`packages/CohomologyOfGroups/sources.toml` is unchanged, because no new literature is cited (only
roadmap sections and pinned declarations). The design package has no `Suggested.lean`, so there was
nothing to elaborate and no `#check @name` audit to run.

The two new suppliers, ArithmeticGaloisDuality and InductionRestrictionPartII, are open
new-roadmap pull requests. Neither is among the 236 whose files the brief lists, so both were read
at their heads with `roadmaps show`.

## F01 (P2) — applied

Verified at ArithmeticGaloisDuality's head, §D7.2 *Finite groups and products*. Its statement on
finite-group universal coefficients and Sylow detection gives, for finite `G`:
- the integral sequence `0 → Hₙ(G,ℤ)⊗A → Hₙ(G,A) → Tor₁(Hₙ₋₁(G,ℤ),A) → 0`;
- `H^{n+1}(G,ℤ) ≅ Ext¹(Hₙ(G,ℤ),ℤ)`;
- evaluation duality over a finite field;
- homological corestriction from a Sylow subgroup onto the `ℓ`-primary part.

That roadmap is line 61 of `merge-order/ORDER.txt` and never names this roadmap.

Changes (old → new): Scope gains an ArithmeticGaloisDuality bullet saying 5.2 and 7.2 extend §D7.2.
There is a new contract section. 5.2 gains a comparison bullet (with `Hom(Hₘ(G,ℤ),ℤ) = 0` via
`transfer_comp_map_subtype_id`) and the Check `G = ℤ`. 7.2 gains a comparison bullet. *Needs:*,
Layer 5/7 Dependencies and the plan (supplier, prerequisites, `uct_finite_comparison`,
`uct_hom_term_infinite`, `stable_AGD_comparison`) change to match.

Pattern: §D7.2's continuous Künneth formula and the Hochschild–Serre sequence of Layer R02.2 are
statements about continuous cohomology. The Scope bullet says they are not used here.

## F02 (P2) — applied

Verified at InductionRestrictionPartII's head, RS.6.8:
- `multiplier_prod_abelian` holds for all abelian `A, B : Type`, not only finite ones. It sends
  `[(a,1)|(1,b)] − [(1,b)|(a,1)]` to `a ⊗ b`.
- `abelian_multiplier_exteriorSquare` holds for finite `A` and sends `a ∧ b` to the class of
  `[a|b] − [b|a]`.

That roadmap is line 64 of the merge order and never names this roadmap.

Changes: the Scope bullet covers RS.6.8, which 5.1 and 5.4 extend. New contract section. 5.4's
route: "Künneth for finitely generated `A`" → "RS.6.8 for finite `A`, then 5.1's degree-two case with
the torsion-free case". 5.4 gains `ψ(a∧b) = [a|b] − [b|a] = ⟨a,b⟩` and a `ℤ/3²` orientation Check;
5.1 gains a comparison bullet. *Needs:*, Dependencies and the plan match.

Pattern, same roadmap:
- RS.0.1: Scope now says how 6.7's homological five-term sequence extends it.
- RS.0.3 (Hall coinvariants) is, for a normal Sylow subgroup, the degree-two integral case of 7.2's
  homological clause. It is now in Scope and the contract, and 7.2 gains a comparison bullet and a
  Check on `(ℤ/3)² ⋊ ℤ/2`.

## F03 (P3) — applied differently

Verified at the Tau Ceti pin:
- `Algebra/Homology/Monoidal/Cup.lean:69, 86, 278`. `tensorCochain` (`Tensor/Cochain.lean:133`)
  adds no sign.
- `Monoidal/Cap.lean:74, 88, 271`.
- `Kronecker.lean:106`.
- `GroupCohomology/CoinvariantsTensor.lean:91, 167`.
- `GroupHomology/ChangeOfGroups.lean:217` and `GroupCohomology/ChangeOfGroups.lean:265`.
- `Rep k G` has `MonoidalLinear` and `MonoidalPreadditive` (Mathlib `Rep/Basic.lean:730, 736`).

Items (i), (iii) and (iv) are applied as asked: cup in 4.4, Kronecker and the coinvariants–Hom
isomorphism in 4.6 and 5.2.

Item (ii) is applied differently, because the suggested wording is wrong in two ways:
- The pinned homology-level `cap` computes homology inside `Rep k G`, which is not group homology.
- `capChain` evaluates the cochain on the **front** face, while 4.6's laws force the **back** face.

On `ℤ²` the front-face product gives `−[e₁]` against 4.6's `[e₁]`. So 4.6 now has a chain-level
bullet: the cap is `(−1)^{q(n−q)}` times `capChain` along `Δ` composed with the Koszul symmetry,
then coinvariants. A face Check pins this.

Item (iv) is cited in 2.1 and 6.4, not in 4.4 and 6.3. Neither 4.4's statement nor 6.3's route
changes groups. The edge-map route of 6.4 and the functoriality of 2.1 do.

## F04 (P3) — applied

Verified at IntegralIwasawaTheoryPartII's head, §0.7: for any `k`, `G` and `S ◁ G`, `H_q(S,M) = 0`
for `M` flat over `k[S]`, and `isIso_coinfNatTrans_app_of_isZero_groupHomology_res`.

Changes: the Scope bullet gains both statements (the edge isomorphism is 6.3's one-row case with
6.4's coinflation edge, not restated). The §0.7 contract is widened. 6.4's *Needs:* gains "§0.7 for
the comparison", and a Check covers `ℤ² ⊃ 0×ℤ`, `M = k[N]` (both sides `k, k, 0, …`) with the
negative control `M = k`, `k ≠ 0`. The plan gains the prerequisite, `edge_spiess` and supplier text.

## Adversarial pass (added or changed statements)

| Statement | Instances tried | Values computed | Result / change |
| --- | --- | --- | --- |
| Scope: 6.7 vs RS.0.1 | `A = 2ℤ/4 ⊂ E = ℤ/4`, `G = ℤ/2` | `H₂(ℤ/4)=0 → H₂(ℤ/2)=0 → H₁(A)_G = ℤ/2 → ℤ/4 → ℤ/2 → 0`; `H₁(A)_G = A` since `A` is central | Same terms as RS.0.1; `d²` left uncompared (sign not fixed there) |
| 5.1 degree-two integral | `ℤ/2×ℤ/2`; `ℤ×ℤ`; `A₅×A₅`; `S₃×S₃`; `H = 1` | `0⊕ℤ/2⊕0 = ℤ/2`; `0⊕ℤ⊕0 = ℤ`; `ℤ/2⊕0⊕ℤ/2`; `0⊕ℤ/2⊕0 = ℤ/2`; `H₂(G)`; `Tor₁(H₀ = ℤ, −) = 0` | Holds; cross product = inverse of RS.6.8's `e` on all three summands |
| 5.2 comparison | `C_m`, `n = 0, 1`; `G = 1`; `k` a field | `H¹ = 0 = Ext¹(ℤ,ℤ)`; `H² = ℤ/m = Ext¹(ℤ/m,ℤ)`; `0 = 0`; `Ext = 0` | Holds; `Hom(Hₘ,ℤ) = 0` from `cor∘tr = |G|` through `Hₘ(1) = 0` |
| 5.2, junk `n = 0` | `Hₙ₋₁ = H₀` in ℕ | `Tor₁^k(k, A) = 0`, `Ext¹_k(k, A) = 0` | Junk value is harmless; no change |
| 5.2 Check `G = ℤ` | `k = A = ℤ`, `n = 1` | `Ext¹(ℤ,ℤ) = 0`, `H¹(ℤ,ℤ) = Hom(ℤ,ℤ) = ℤ`; finite `G`: `H¹ = 0` | `Hom` term needed; added as a Check |
| 5.4 `ψ(a∧b)` | cycle check; `ℤ/3×ℤ/3`; `ℤ/2×ℤ/2`; `ℤ/n`; `A = 0` | `d([a|b]−[b|a]) = [ba]−[ab] = 0`; generator of `ℤ/3`, `−⟨a,b⟩ ≠ ⟨a,b⟩`; `−1 = 1` mod 2; `0`; `0` | Orientation Check uses `ℤ/3²`, since mod 2 cannot detect it |
| 5.4 route, f.g. `A` | `ℤ × ℤ/2`; `ℤ²`; `ℚ` | `Λ² = 0⊕ℤ/2⊕0 = H₂(ℤ)⊕(ℤ⊗ℤ/2)⊕H₂(ℤ/2)`; `ℤ`; `0` | Holds; `ℤ²`, `ℚ` lie outside RS.6.8 |
| 4.4 = pinned `cup` | `G = 1`, `P = k`; sign | unitor; pinned Leibniz `(−1)^p` = 4.1's; `tensorCochain` without sign | Holds |
| 4.6 chain-level form | `ℤ²`, `y = e₂^*`, `z = [e₁|e₂]−[e₂|e₁]`; `q = 0`; `q = n`; `q > n` | back face `y(g₂)[g₁]`: `[e₁]`; front face `y(g₁)[g₂]`: `−[e₁]`, ratio `(−1)^{1·1}`; sign `+1`; `+1`; both `0` | Adjunction `⟨x, y∩z⟩ = 1 = ⟨x∪y, z⟩` only with back face; Check added |
| 4.6 Kronecker form | pinned formula; `ℤ/2`, `𝔽₂` | `φ ↦ ([m⊗x] ↦ φ(x)(m))` (`Rep/CoinvariantsTensor.lean:205`); perfect `𝔽₂ × 𝔽₂ → 𝔽₂` | Agrees with 4.6's inhomogeneous formula; stated for the bar resolution only |
| 6.4 Check vs §0.7 | `ℤ² ⊃ 0×ℤ`, `M = k[N]`; `M = k`; `k = 0`; `S = 1`; `S = G` | `Hₙ(ℤ², Ind k) = Hₙ(ℤ, k) = k,k,0`; `k → 0`; all `0`; identity; both `0` for `n > 0` | Holds; `k ≠ 0` added to the negative control |
| 7.2 vs §D7.2 | `S₃`, `p = 3`, `n = 3`; `n = 0` | `H₃(S₃,ℤ)(3) = ℤ/3`, the corestriction of the stable `H₃(A₃,ℤ) = ℤ/3`; `n = 0` excluded | Holds for `n ≥ 1` |
| 7.2 vs RS.0.3 | `(ℤ/3)²⋊ℤ/2`; `S₃ ⊃ A₃`; `P = 1` | invariants = coinvariants = `ℤ/3` (inversion acts by `(−1)² = 1`), wrong model `−1` gives `0`; `0 = 0`; `0 = 0` | Holds; invariants ≅ coinvariants as `|G/P|` is invertible; Check added |
| Contract: `Rep k G` monoidal | pin | `MonoidalPreadditive`, `MonoidalLinear k` instances; `groupCohomologyIso : … ≅ (P.complex.linearYonedaObj k A).homology n` | The pinned cup applies in `Rep k G` |

## Checks run

Dependency check (after the final edit):

```text
candidate: CohomologyOfGroups is not in the merge order yet; checked as if placed after IntegralIwasawaTheoryPartII (the intake inserts it when its design is accepted)
depcheck: 242 roadmaps, 2200 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The two new edges, to ArithmeticGaloisDuality (line 61) and
InductionRestrictionPartII (line 64), point to earlier roadmaps.

- Citation resolver (`roadmaps resolve`): no cross-roadmap citation or Lean name was found missing.
- The resolver does not check names outside TauCetiRoadmap on this host, so every new Tau Ceti and
  Mathlib name was checked by hand at the pins, with the files and lines above.
- `roadmaps overlaps` for both new suppliers: no other open pull request changes them, and no id is
  dropped.
- `plan.json` parses: 41 targets, 147 tests.

## For the maintainer

- This package now consumes ArithmeticGaloisDuality §D7.2 and InductionRestrictionPartII RS.0.3
  and RS.6.8. Both are open new-roadmap pull requests, earlier in the merge order, and must merge
  first. Those section ids must stay as they are at the heads.
- The IntegralIwasawaTheoryPartII §0.7 citation is widened; that dependency already existed.
- No id that other roadmaps cite was renamed or dropped. The new comparison bullets and Checks do
  not remove any statement.
- Ownership was checked by object against these suppliers and against IntegralIwasawaTheoryPartII,
  using `roadmaps show` at their heads.
- The finding's item (ii) asked to cite `TauCeti.ChainComplex.cap` "where its hypotheses apply".
  Applied literally, it would have given 4.6 the front-face convention, a sign of
  `(−1)^{q(n−q)}` off 4.6's adjunction law. The README now fixes this sign with a witness.
