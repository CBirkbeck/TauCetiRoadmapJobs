# FIX-PKG-IgusaVarietiesAndTorsionConcentrationPartII~10

Findings of `REV-PKG-IgusaVarietiesAndTorsionConcentrationPartII~9` (two, both P3). Files changed: `packages/IgusaVarietiesAndTorsionConcentrationPartII/README.md` and `packages/IgusaVarietiesAndTorsionConcentrationPartII/sources.toml`. `Suggested.lean`, `metadata.toml` and `design/plan.json` are unchanged (no gap is added or changed).

## F01 (P3) — applied

New contract bullets: parent §§5.1, 5.2 and EndoscopicTransferAndUnitaryTraceComparison §5.1. The PELModuli bullet now states what §§M0.9 and M0.17 provide, and the AG2.0 bullet is narrowed to the Hecke-polynomial/`ε̄` normalization. §M0.9 and §M0.17 → §8.1 `*Needs:*` and Layer 8 Dependencies. AG2.0 → §§8.4, 8.5 `*Needs:*`. Five library names → Layer 8 Dependencies.

## F02 (P3) — applied

`sources.toml`, `CS17` `cited_for`: `"Exact supplier contracts: gap unitary-discrete-local-comparison"` → `"Scope and ownership", "Exact supplier contracts"`. Nothing else in the entry changed.

## How F01 and F02 were verified

F01. A script parsed every `*Needs:*` line, every Layer Dependencies paragraph and every supplier-contract bullet, then compared them per supplier and per layer. Before the edits it found exactly the nine mismatches the review lists, all in Layers 8–9; Layers 10–11 had none. After the edits it finds no mismatch in any layer or contract. The contract ids left over in its output are all noise: this roadmap's own section numbers, source theorem numbers, or cross-references to another supplier inside a bullet. So the same pattern occurs nowhere else.

- Parent §5.1 and §5.2 were read at the parent's head ("### 5.1 Dual Hecke ideals and their Galois systems", "### 5.2 Hecke-equivariant Poincaré duality"). The new bullets state what is consumed. From §5.1: the rank-`2n` involution `ι`, the dual ideal `𝔪^∨`, the dual eigenvalues `q_v^{2n−1}α⁻¹`, and its rank-`m` genericity lemma, which §8.5 uses at `m = n`. From §5.2: the Igusa duality for `ℓ ≠ p`, whose argument §8.6(2) repeats.
- EndoscopicTransferAndUnitaryTraceComparison §5.1 was read at its head. The bullet gives the residual blocks `ρ ⊠ b` with `ab = m` and `ω_ρ^b = ω`, and the existence, uniqueness and multiplicity one that section takes from AutomorphicSpectralTheory §4.14a (checked at its head). These are the blocks of the discrete `Π_M` of §9.3.
- PELModuli: §M0.9 provides `ker¹(ℚ, G)` and its finiteness (its item (3)). §M0.17 provides the equality of the PEL and Shimura reflex fields for connected `G` under SV3. §8.1 indexes its pieces by `ker¹(ℚ, G)` and invokes §M4.3 over `E`, and §M4.3 itself needs §M0.17. The §8.1 prose now names both sections.
- AG2.0 was read at its head: «Automorphic specialization of the integral Hecke polynomial» uses geometric Frobenius, and «The `l`-adic character …» gives `r(‖·‖) = ε` with uniformizers sent to geometric Frobenius. The old "algebraic weights" clause was used nowhere in this roadmap. Besides §8.4 (as the review asked), AG2.0 is added to the `*Needs:*` line of §8.5, since §8.5(3)–(4) use `ε̄(Frob_geo) = q_v⁻¹`.
- Library names confirmed at the pins: `NumberField.maximalRealSubfield` (`TotallyRealComplex.lean:126`), `Ideal.inertia` (`Ideal/Defs.lean:154`), `Ideal.primesOver` and `Ideal.LiesOver` (`Ideal/Over.lean:379`, `:128`), and Tau Ceti `HeckeAntiInvolution.onHeckeCoset` (`HeckeRing/Commutativity.lean:165`).

F02. Each `[CS17]` and `CS17 line` occurrence was mapped to its heading. CS17 is cited in Scope and ownership (three times) and in four contract subsections: the parent, EndoscopicTransfer, AutomorphicGaloisRepresentationsPartII and BunGAndNewtonStrata. The other four entries already match their sections: `Shin-BCU` (10.4 and its gap), `Shin11` (its gap and 10.2), `Shin09` (contracts, 8.9, 10.2, 11.4) and `Shin12` (10.1). The edited TOML parses.

## Adversarial pass on the added or changed statements

| Statement | Instances tried | Values computed | Result; change |
|---|---|---|---|
| Parent §5.1 bullet: dual eigenvalues `q_v^{2n−1}α⁻¹` | `2n = 2`, eigenvalues `{α, β}` | `{q_v/α, q_v/β}`; agrees with the parent's own Check | holds; none |
| Parent §5.1 bullet: genericity lemma for `(q^{m−1}α_i⁻¹)` | `m = 2`, `q = 7` in `𝔽_11`, `α = (1, 2)`; `α = (1, 7)`; `m = 1` | `β = (7, 9)`, ratio sets `{2, 6}` on both sides, neither meets `{1, 7}`; `β = (7, 1)`, both ratio sets `{7, 8}` meet `q = 7` on both sides; `m = 1` gives `β = α⁻¹` and no pairs | preserved and reflected (the map is an involution); entries must be units, which the bullet states (`k^×`); none |
| Parent §5.2 bullet: duality | `d_b = 0` (finite étale `Ig`) | `RΓ_c = RΓ` = functions, no shift or twist; the transpose of `[KgK]` is `[Kg⁻¹K]`, so the `𝔪^∨`-part is dual to the `𝔪`-part | holds; none |
| EndoscopicTransfer §5.1 bullet | `b = 1`; `m = 1`; `ρ = 1`, `b = 2` | `ρ ⊠ 1 = ρ`; a unitary Hecke character; central character `ρ² = 1`, local unramified quotient trivial (supplier Check) | holds; central-character condition `ω_ρ^b = ω` added to the bullet |
| AG2.0 bullet: Hecke polynomial and `ε̄` | `n = 1`; `q_v = 7` | `P_v = X − t_{v,1}`, eigenvalue of `r(Frob_geo)` is `χ(ϖ_v)` under uniformizer ↦ geometric Frobenius; `ε(Frob_geo) = ‖ϖ_v‖ = 1/7`, `ε(Frob_arith) = 7` | holds, agrees with the Conventions and the §8.5 Checks (`ε̄^{−1}(Frob_geo) = 7`); none |
| PELModuli §M0.9 bullet: finiteness | `G = GL_n`; type (A) `G` | `H¹(ℚ, GL_n) = 1`, so `ker¹` is trivial; for unitary similitude groups `ker¹` can be nontrivial, and the bullet claims only finiteness | holds; none |
| PELModuli §M0.17 bullet | Siegel datum; Picard `(n−1, 1)` over imaginary quadratic `K` | both reflex fields are `ℚ`; both are `K` (supplier Checks) | holds; hypothesis "connected `G` and SV3" matches the supplier's M0.12 standing hypothesis |
| §8.1: `E` is the reflex field of `(G, X)` under SV3 | wholly definite datum, `n = 2` | SV3 fails, so the clause is not invoked; `n = 1`: SV3 holds vacuously and `G` is a torus, so the reflex field is that of the CM-type cocharacter | holds; first wording ("reflex field of `(G^{(a)}, X)`") narrowed to `(G, X)`, which is what §M0.17 states; §M4.3 handles the inner forms |

No theorem, definition or Check of the roadmap changed, so no worked example needed recomputing.

## Checks

- `lake env lean packages/IgusaVarietiesAndTorsionConcentrationPartII/Suggested.lean`, run from the content checkout: exit 0. Its only output is `declaration uses 'sorry'` at lines 79 and 91.
- `#check @name` for all four declarations (`IsStrongGenericAt`, `IsCompletelySplitStrongGenericPrime`, `infinite_setOf_isCompletelySplitStrongGenericPrime`, `infinite_setOf_isStrongGenericAt_degree_one`), run in one scratch file. Each keeps `[Field F] [NumberField F] [Field L] [NumberField L] [Algebra F L] [IsGalois F L] [Field k] [Finite k] {n : ℕ}` and `r`. Both theorems keep their existential hypothesis. Each agrees with README §§8.7–8.8. Nothing changed.
- Dependency check, complete output:

```text
depcheck: 240 roadmaps, 2268 edges, 0 problem(s)
```

  No UPWARD, CYCLE or moved line. No supplier was added.
- `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere. The earlier lead `LocallySymmetric.FrankeInput` no longer appears. It is ArithmeticLocallySymmetricSpaces' name, cited as that roadmap's hypothesis, and is not a pinned declaration.

## Notes for the maintainer

- No gate failure was listed for this round.
- Ownership: no new construction or target is stated. The edits only make the contracts, `*Needs:*` lines and Dependencies agree, so no ownership question arises. Every newly cited section was read at the supplier's head: the parent §§5.1–5.2, EndoscopicTransferAndUnitaryTraceComparison §5.1, PELModuli §§M0.9, M0.17, M4.3, AutomorphicGaloisRepresentationsPartII Layer AG2.0 and AutomorphicSpectralTheory §4.14a.
- No name that other roadmaps cite changed. No source was fetched, and `needs-references.toml` was not written.
- No suspicious instruction was found in the review text.
