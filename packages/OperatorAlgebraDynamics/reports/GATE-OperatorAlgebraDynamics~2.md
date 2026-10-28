# GATE-OperatorAlgebraDynamics~2: reply to human review

One review, from roed-math (2026-10-20), on commit `b8740e6`. It has one required point. Its section "Mathematics and interfaces checked without finding another blocker" and its dependency notes ask for nothing, so they are not numbered as findings. The PR head `0096307` already carries the repair for H01, made in that commit after the review was posted. This round checked that repair against the review's request and against the mathematics, and changed no file. There is no new commit.

## H01 (roed-math) — applied

The review offered two repairs, and option 1 is the one applied: D8 owns the Fock constructions, and QuantumFoundations QF4 is no longer cited anywhere. `grep -n 'QF\|QuantumFoundations\|RQFT'` over `TauCetiRoadmap/OperatorAlgebraDynamics/README.md` returns nothing. The three changes:

- **Scope paragraph, line 12.** Old: "QuantumFoundations QF4 owns the generic Fock/second-quantization API and proves the normalization adapter … on its specified invariant domain". New: D8 owns the antisymmetric and symmetric Hilbert Fock representations, namely
  - the carriers and vacuum, and the creation and annihilation operators;
  - the bosonic finite-particle domain;
  - the Segal field `Φ₀(f)=(a(f)+a†(f))/√2`, its essential self-adjointness, and the identification of its closure with the Stone generator `Φ(f)`.

  Unitary implementability of Bogoliubov automorphisms is stated not to be a target.
- **CAR Bogoliubov paragraph, line 621.** Old: "QF consumes this universal CAR automorphism and owns its Fock/domain comparison". New: "D8 owns this universal CAR automorphism only; a criterion for its unitary implementation in the antisymmetric Fock representation is not a target here". This keeps the separation the review asked to keep.
- **Fock paragraphs, lines 599–611 and 647–675.** Each element of the requested contract is now stated in D8:
  - `F_a(h)` and `F_s(h)` are Hilbert direct sums of the closed (anti)symmetric subspaces of the completed tensor powers of FreeProbability F3, with vacuum `Ω=1`.
  - `a†(f)ψ=√(n+1)·P(f⊗ψ)` is linear in f. `a(f)` is antilinear in f, with `a(f)Ω=0` and `a(f)(g⊗ⁿ)=√n⟨f,g⟩g⊗⁽ⁿ⁻¹⁾`.
  - `D_fin` is the algebraic direct sum of the `Symⁿ(h)`, and `a(f)`, `a†(f)` preserve it.
  - The bounds are `‖a(f)ψ‖≤√n‖f‖‖ψ‖` and `‖a†(f)ψ‖≤√(n+1)‖f‖‖ψ‖`.
  - For analyticity, `‖Φ₀(f)ᵏψ‖≤(√2‖f‖)ᵏ√((n+k)!/n!)‖ψ‖`, and Nelson's criterion gives essential self-adjointness on `D_fin`.
  - `W_F(f)=exp(i·closure Φ₀(f))` is a regular Weyl representation, and `Φ(f)=closure(Φ₀(f))`, so `π_F(W(tf))=exp(it·closure Φ₀(f))`.

  Both carriers live in the single F3 full Fock space, so there is only one Fock model and no intertwining unitary is needed.

Ownership was checked by object against main and the open heads:
- FreeProbability F3 on main builds the full Fock space, at its README line 328.
- AffineLieAlgebras C7 builds an algebraic Heisenberg/oscillator Fock module, not the Hilbert one.
- Subfactors consumes "the CAR Fock space … from Dynamics D8", which is consistent with this change.
- Nelson's criterion is also planned as UnboundedOperators UO-E03. That roadmap comes in the `OperatorTheory` open pull request, which sits after this roadmap in the merge order (line 257 against line 252), so D8 has to state it itself. The reverse edit, making UO-E03 consume D8, belongs to that roadmap.

## Adversarial pass on the H01 statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `[a(f),a†(g)]=⟨f,g⟩` on `D_fin` (antilinear in first slot) | ψ=Ω | `a(f)a†(g)Ω=a(f)g=⟨f,g⟩Ω`; `a†(g)a(f)Ω=0` | holds | none |
| `⟨a†(f)φ,ψ⟩=⟨φ,a(f)ψ⟩` | φ=g∈Sym¹, ψ=g⊗g | LHS `√2·(⟨f,g⟩‖g‖²+‖g‖²⟨f,g⟩)/2=√2⟨f,g⟩‖g‖²`; RHS `⟨g,√2⟨f,g⟩g⟩=√2⟨f,g⟩‖g‖²` | holds | none |
| `[Φ₀(f),Φ₀(g)]=i·Im⟨f,g⟩` | general f,g | `½(⟨f,g⟩−⟨g,f⟩)=½·2i·Im⟨f,g⟩` | holds | none |
| Weyl sign `W(f)W(g)=e^{−iσ/2}W(f+g)` with `W=e^{iΦ}` | BCH with `[A,B]=iσ` | `e^{iA}e^{iB}=e^{i(A+B)}e^{−[A,B]/2}=e^{−iσ/2}e^{i(A+B)}` | matches | none |
| Vacuum function `exp(−‖f‖²/4)` | `⟨Ω,Φ₀(f)²Ω⟩` | `½⟨Ω,a(f)a†(f)Ω⟩=‖f‖²/2`; Gaussian `e^{−½·‖f‖²/2}` | holds | none |
| Wrong model `a+a†` (unnormalized) | same two computations | commutator `2i·Im⟨f,g⟩`; vacuum function `e^{−‖f‖²/2}` | excluded by both, as the README says | none |
| Analytic bound | ψ∈Symⁿ, k steps | step m: `(√m+√(m+1))/√2‖f‖≤√2√(m+1)‖f‖`; product over m=n..n+k−1 gives `(√2‖f‖)ᵏ√((n+k)!/n!)`; `Σ tᵏ/k!·` that converges for all t | holds | none |
| Regularity `t↦W_F(tf)` | real t | `Φ₀(tf)=tΦ₀(f)` (a antilinear, a† linear, t real), so `W_F(tf)=e^{it·closure Φ₀(f)}`, strongly continuous by Stone | holds | none |
| CAR Fock rep, degenerate h=0 | h=0 | `F_a=ℂΩ`, `CAR(0)=ℂ`, π_F faithful | holds | none |
| CAR vacuum = quasi-free S=0 | two-point | `⟨Ω,a†(f)a(g)Ω⟩=0=⟨g,0·f⟩` | holds | none |

## Lean

`TauCetiRoadmap/OperatorAlgebraDynamics/Suggested.lean` is unchanged. I compared the elaborated signatures of all 10 declarations against the README.
- `IsCovariant` elaborates without `[TopologicalSpace G] [IsTopologicalGroup G]`. `scalarIntegrated` and `scalarIntegrated_apply` elaborate without `[CompleteSpace H]`.
- In each case the dropped instance is not needed by the body: `ContRepresentation` needs no topology on G, and `integratedOperatorL1` needs no completeness. The definitions are therefore more general than the section suggests, not wrong.
- No README statement imposes the dropped hypotheses.

## Build and gate

- `lake build TauCetiRoadmap.OperatorAlgebraDynamics.Suggested`: Build completed successfully (8983 jobs). Four `declaration uses 'sorry'` warnings (lines 28, 41, 109, 116), nothing else.
- Gate: `gate OperatorAlgebraDynamics: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK`
- Depcheck (`--movable`):

```
depcheck: 153 roadmaps, 1037 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. Ownership against open pull requests was checked with `roadmaps grep` over every open head and main. No source was fetched in this round, and `needs-references.toml` was not written.
