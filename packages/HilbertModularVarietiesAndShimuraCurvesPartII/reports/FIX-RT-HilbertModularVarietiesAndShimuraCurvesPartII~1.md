# FIX-RT-HilbertModularVarietiesAndShimuraCurvesPartII~1

Two red-team reviews were merged: pass a (findings F01–F07, listed first) and pass b (finding F01, listed last). No findings overlapped. All eight were checked against the cached sources and the supplier roadmaps; all eight hold.

## F01 (P1) — applied

Checked against DL21 lines 3164–3167 and 3200–3228. In the indefinite case, the auxiliary-level patched modules are duals of the Galois multiplicity spaces `Hom_{T[G]}(r(K), S)`, not of full H¹. BHHMS23 line 5443 records a choice of basis of the universal deformation; with that basis the evaluation isomorphism of §0.3 gives Ĥ¹ ≅ `Ĉ^{⊕2}`.

Changes:
- §1.6: the single-copy statement "C ≅ dual of Ĥ¹" is replaced by "C ≅ dual of Ĉ (indefinite) / of Ŝ (definite), and dual of Ĥ¹ ≅ `C^{⊕2}` after the basis choice". The API and proof route now say this, and a Check gives σ-multiplicity r versus 2r (2 versus 4 at r=2).
- §5.6 defines Ĉ and adds the bullet Ĥ¹ ≅ Ĉ ⊗ ρ_T̂ ≅ `Ĉ^{⊕2}`.
- §5.7's statement is unchanged, since faithful flatness of `C^{⊕2}` is equivalent to that of C. Its proof now applies faithfulness to `C^{⊕2}` (resp. C), and a Check verifies the C ↔ `C^{⊕2}` transfer.

## F02 (P2) — applied

BHHMS23 lines 5074–5076 replace r̄_v^∨ by r̄_v^∨(1).
- §1.2 API, old: "twisting identifies `R∞^{λ,τ}` with `R∞^{λ+(1,1),τ}"`. New: twisting identifies the (λ,τ)-quotient of `R∞(r̄_v^∨;εψ_v⁻¹)` with the (λ+(1,1),τ)-quotient of `R∞(r̄_v^∨(1);ε³ψ_v⁻¹)`. Inside the original residual problem that quotient is zero.
- The same notation is now used in the §1.2 proof route, the §4.8 route, the §4.8 multi-type ring `R_{r̄_v^∨(1)}^{≤(3,0),σ_v}`, and the Conventions Check.
- New Check at p=29, ω(g)=2: both sides have residual determinant 4·det r̄_v^∨(g), and the untwisted demand gives an empty functor.

## F03 (P1) — applied

The witness holds:
- GK14 Lemma 5.4.3(1) (line 1490) rests on Lemma 5.3.6 (line 1400), which rests on the global lifting Lemma 5.2.5 (line 1253).
- PL.1 is local.
- The node A=k[[x,y]]/(xy) with M=A/(x) has depth 1 = dim A but e(M)=1 < e(A)=2.

Changes:
- New supplier gap `gap:quaternionic-component-realization` on PotentialAutomorphyInfrastructurePartII PL.5, with full hypotheses and conclusion. It appears in the README supplier contracts and in the plan's `gaps` list.
- The §0.6 route now goes: component lift, then quaternionic transfer (AutomorphicGaloisRepresentations §4.4, GL2AutomorphicRepresentationsAndTransfer §§R17.3.1, R17.3.10), then full component support (Lemma 5.4.3(1)–(2)), then the multiplicity identity.
- The node is added as a Check, and the Needs and Dependencies lines are updated.

Ownership: no earlier roadmap states this lift.
- SerreWeightAndLevelOptimisation §6.11 works only after base change, with Khare–Wintenberger A/B/C data.
- ModularityAndLanglandsExtensions §2.15 is CM-polarized and ordinary.
- OrdinaryAutomorphicFormsAndModularityLifting §2.11 says explicitly that away-from-p components need a separate global lifting theorem.

## F04 (P3) — applied

The Conventions Check, old: "O --p→ O dualizes with −p; cokernel O/p". New: C⁻¹=C⁰=O, d⁻¹=p, with d(f)=d_O∘f−(−1)^(deg f)f∘d_C. The dual sits in degrees 0,1 and sends 1 to −p, which differs from +p. The cokernel O/p is kept only as a separate observation that cannot detect the sign. Recomputed: f in degree 0 gives −f∘d = −p.

## F05 (P2) — applied

Recomputed the witness: conjugating 1+pE₁₂ by 1+pE₂₁ gives 1+pE₁₂+p²(E₂₂−E₁₁)−p³E₂₁. Every element of V is ≡1+apE₁₂ mod p³, so V is not normal.

Change to the §5.5 lower bound:
- Form the tower representation Π.
- The original space is `Π^{∏V_w}`, by §0.4 applied to a normal core.
- Π≠0 implies `Π^{∏K₁,w}≠0`, which embeds in `Π^{∏V_w}`; then apply §0.6 and §5.1 at the enlarged levels.

The non-normal V is added as a Check. The theorem keeps arbitrary open V_w.

## F06 (P2) — applied

ModpRepresentationsOfGL2OverLocalFields MP.8/projective-lattice (its design README, interface `projectiveLattice.partial`) already constructs `R′_{2,j}`, every L_j, the recursion and `L_{f−1}≅R`.
- The scope line now imports these.
- §4.1 states them as the MP.8 lattices specialized to σ_v. It owns `T′_{2,j}`, Y_j and N_j and their comparisons.
- The API bullets are marked as supplied, and the construction step is removed from the proof route.
- The rank Checks (d, 4d, 7d) are unchanged.

## F07 (P3) — applied

The §5.6 Check "1↦1, 𝔪↦0" accepts the non-local 𝔽×𝔽. It is replaced by the computed localization: e₂ becomes 0, e₁ becomes 1, and T_𝔪≅𝔽. It is merged with the semilocality bullet, which is deleted as a separate item.

## F01 (P3) — applied

At the open head of CompletedCohomologyPartII, §8.3 ("Hilbert finite-level coefficient input") carries the quaternionic Shimura-curve input, and §8.4 consumes it. The citation "§8.4" is changed to "§§8.3–8.4" at:
- the supplier contract;
- the §0.5 route;
- the §0.5 Needs line;
- the Layer 0 Dependencies.

The scope range "8.4–8.15" becomes "8.3–8.15".

## Checks

- `lake env lean packages/HilbertModularVarietiesAndShimuraCurvesPartII/Suggested.lean`: exit 0, no output. `Suggested.lean` is unchanged. It has no declarations, so the `#check @name` signature audit had nothing to elaborate, and no Lean name changed.
- Dependency check output:

```text
depcheck: 56 roadmaps, 654 edges, 0 problem(s)
```

  No UPWARD, CYCLE or moved line. The new citation, PotentialAutomorphyInfrastructurePartII, is earlier in the merge order.
- `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere.
- `design/plan.json`: only the top-level `gaps` list changed, with one entry added. It parses as JSON. The README and plan have the same five gap slugs.
- No new sources. DL21, GK14, BHHMS23 and STACKS are already in `sources.toml`. No `needs-references.toml` was written.
- Ownership against open pull requests was checked through `roadmaps grep` and the supplied checkouts, including the CompletedCohomologyPartII head.

## Adversarial pass on changed statements

| Statement | Instances | Computed values | Result |
|---|---|---|---|
| §1.6 C vs full Ĥ¹ dual | indefinite, r=1,2; definite | σ-mult in C: r=1,2; in r̄⊗π: 2,4; `C^{⊕2}`: 2,4; definite: r both | consistent |
| §5.7 faithful flatness via `C^{⊕2}` | O[[t]] acting on C=O[[t]], C² | kernels 0 and 0; N⊗C²=(N⊗C)² | consistent |
| §1.2 twist | p=29, ω(g)=2 | det multiplier ω²=4 on both residual rep and ε³ψ⁻¹ vs εψ⁻¹; untwisted: 1 vs 4 | consistent |
| §0.6 component support | node k[[x,y]]/(xy), M=A/(x) | depth 1=dim 1; e(M)=1, e(A)=2 | MCM insufficient; gap needed |
| Conventions dual differential | C⁻¹=C⁰=O, d=p | dual d⁰(1)=−p; precomposition +p; coker O/p both | sign pinned |
| §5.5 non-normal level | V=⟨1+pE₁₂,K₃⟩ | conjugate ≡1+pE₁₂+p²(E₂₂−E₁₁) mod p³ ∉ V | not normal; tower argument applies |
| §5.6 locality | T=𝔽×𝔽, 𝔪=0×𝔽 | e₂↦0, e₁↦1, T_𝔪=𝔽 | excludes the unlocalized algebra |
| §4.1 imported L_j | f=1,2 | ranks d,4d / d,4d,7d match MP.8 `rational_rank` (1+3f)d | consistent |

## For the maintainer

- PotentialAutomorphyInfrastructurePartII receives a new request, `gap:quaternionic-component-realization`, at PL.5.
- ModpRepresentationsOfGL2OverLocalFields MP.8/projective-lattice is now the cited owner of L_j.
- No Lean names changed. No other roadmap cites a name of this one that was altered.
- No suspicious instructions were found in either review.

## Gate repairs

- Report headings: the finding sections now use the bare review identifiers (`## F01 (P1) — applied`, …), pass a's F01–F07 first and pass b's F01 last, in place of the prefixed `a.F01`/`b.F01` form.
- LaTeX-like text in the README's "Scope and ownership" bullet on smooth categories and local lattices: the formulas with brace subscripts (`L_j = L_{j−1} ×_P R′_{2,j}`, `L_{f−1} = R`, `T′_{2,j}`) and the lattice names `R`, `L_j`, `Y_j`, `N_j` are now inside code spans. Wording unchanged.
- Dependency check rerun after these edits: `depcheck: 56 roadmaps, 654 edges, 0 problem(s)`.
- Dependency check rerun after the code-span edits: `depcheck: 56 roadmaps, 654 edges, 0 problem(s)`.
- LaTeX-like text (14 occurrences of brace superscripts or subscripts outside code spans in the README): the Conventions dual-differential Check (`d(f) = d_O∘f − (−1)^(deg f) f∘d_C`), the §1.2 twist Check (`ε³ψ_v^{−1}`, `εψ_v^{−1}`), the §1.6 statement, Check and proof (`C^{⊕2}`, `Ĉ^{⊕2}`), the §5.5 proof (`∏_{w∈S_p∖{v}}`) and Check (`p³M₂(O_{F_w})`), and the §5.6/§5.7 proofs and Check (`Ĉ^{⊕2}`, `C^{⊕2}`) now put each such formula inside a code span. Wording and mathematics unchanged. The same pattern in this report's own text was put in code spans too.
