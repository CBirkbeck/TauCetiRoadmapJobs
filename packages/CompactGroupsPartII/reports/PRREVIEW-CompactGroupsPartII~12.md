# Review of CompactGroupsPartII (pull request #1047 at fc50ce5)
Folder: `TauCetiRoadmap/RepresentationTheory/CompactGroupsPartII/`
**Verdict:** needs changes

:robot: Independent AI incremental re-review of 4 changed lines since `bc17800`. Two previous P3 findings remain; no P1 or P2 findings. The corrected library locator repairs previous R03. No mathematical statement, Lean declaration, library pin or family-index passage changed. Unchanged mathematical checks below are explicitly carried from [review r11](PRREVIEW-CompactGroupsPartII~11.md).

Unless otherwise specified, README locations mean `TauCetiRoadmap/RepresentationTheory/CompactGroupsPartII/README.md`; Lean locations mean its `Suggested.lean`.

## R01 (P3) — Correct the family index's scope and supplier description

**Location.** `TauCetiRoadmap/RepresentationTheory/README.md:52–53`: “global forms and representation rings, and unitary SU(2) actions”; lines 100–102: “the Lie-groups roadmap's maximal tori and coverings and the highest-weight roadmap's dominant integral classification”.

**Claim.** The family index assigns representation rings and a highest-weight roadmap dependency to Part II. Both descriptions still contradict the roadmap at this head.

**Witness.** README:60–65 assigns representation rings to TopologicalKTheory T6 and excludes their construction here. README:394–397 consumes pinned highest-weight declarations. The family index has no diff since `bc17800`.

**Repair.** Replace “global forms and representation rings” with “global forms and their formal characters”; include unitary equivalence from characters in the summary. State the actual suppliers: LieGroups Layers 0, 2–5, 5A, 6 and 7; ConvexityToric T1; the pinned highest-weight modules; and BanachSpaceTheory B5 for countability. These replacements agree with README:377–400 and TopologicalKTheory T6, README:1233–1248, on main. The family index is expressly part of this nested pull request.

## R02 (P3) — Refresh the generated `roadmap-summary` block

**Location.** Pull request description, generated `roadmap-summary` block: “the representation ring of a compact connected group with its restriction to a maximal torus”. Its supplier sentence says: “The global forms use the Lie-groups roadmap's maximal tori and coverings and the highest-weight roadmap's dominant integral classification.”

**Claim.** This block still describes the superseded scope and supplier arrangement; the author-written description below it describes the actual head.

**Witness.** README:60–65 excludes representation-ring construction; README:394–400 uses pinned highest-weight modules and BanachSpaceTheory B5. `Suggested.lean:53` and `:86` state the energy identity and unitary equivalence absent from the generated summary.

**Repair.** Regenerate this named block from the head: describe the formal-character basis of the Weyl invariants, continuous-kernel energy, unitary equivalence from equal characters and the U(n)-conjugacy classification of SU(2) actions. Use the actual suppliers listed in R01. Checked against the same scope and supplier passages: these replacements remove both contradictions without changing the mathematics.

## Previous findings

- R01 — not repaired: the family index still says “representation rings” (line 53) and cites “the highest-weight roadmap's dominant integral classification” (lines 101–102).
- R02 — not repaired: the generated `roadmap-summary` still claims the representation ring and the highest-weight roadmap dependency; the accurate author-written paragraphs do not replace that block.
- R03 — repaired: README:300–302 gives `TauCeti/Analysis/Fourier/AddCircle.lean` and the correct multiplicative group-isomorphism type for `TauCeti.fourierPontryaginDualEquiv`.

## Verified sound

**Scope of this round.** Verified the four-line diff, all three previous findings, and the corrected citation's uses in §4.1 and its neighboring Fourier/Peter–Weyl convention. No files changed outside the folder since `bc17800`. Against `origin/main`, the only extra file is the authorized family index. The worktree remained unchanged. The repository-root README's writing checklist and CONTRIBUTING were read; the supplied parent-relative paths do not exist in this checkout.

**Gate and elaboration.** The supplied head-specific worker gate passes all checks, including targeted build, statement hygiene and dependency order. The requested general gate rerun reports precisely:

```text
depcheck: NOT IN ORDER: CompactGroupsPartII (insert it after its last supplier)
outside-folder: TauCetiRoadmap/RepresentationTheory/README.md
```

These are configuration false positives under this brief: absence from the default order is expressly not a finding, and the family index is expressly this pull request's own. All other scanners pass. The independent check using the supplied candidate order prints:

```text
depcheck: 235 roadmaps, 2133 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. Independently ran the authorized targeted `lake build TauCetiRoadmap.RepresentationTheory.CompactGroupsPartII.Suggested`: exit 0. Its artifact phase also emits a module-system recommendation for the required `import Mathlib`; this is not an elaboration failure. Direct `lake env lean` on `Suggested.lean` exits 0 with exactly 15 `sorry` warnings and no other diagnostics.

**Signatures and headlines.** Elaborated a scratch copy containing `#check @name` for all 18 declarations: three definitions and fifteen theorems. Compared the emitted types with the supplied signature inventory and README. The flagged omission of compactness, Hausdorffness and topological-group assumptions from `compactCharacter` is harmless: it only coerces an existing continuous character to ℂ. Theorems retain the hypotheses their statements need. No signatures changed. The unchanged r11 one-tactic probe remains applicable because both `Suggested.lean` and the pins are byte-for-byte unchanged; its fifteen theorem goals remained open.

The unchanged headline inventory is: §0.2 continuous-kernel energy; §1.2 scalar metrics; §1.4 unitary equivalence; §2.1 Banach G-finite density; §3.1 countability/separability equivalences; §4.1 finite-coordinate factorization, product duality and torus characters; §5.1 irreducible/character correspondence, uniform density and the Fourier Hilbert basis; §6.9 U(2) character recognition; §7.1 multiplicities, realization and faithfulness. The docstring still identifies the unstatable §1.3 multiplicity-space comparison and §§6.5–6.7 cocharacter-lattice equality, highest-weight classification and formal-character basis with their missing carriers. This repair changes none of that inventory.

**Pinned declarations opened for the repair.** Mathlib remains at `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`; Tau Ceti at `2fd255d997f47c0b5d834ee416c7015d55444ce5`.

- `TauCeti/Analysis/Fourier/AddCircle.lean:160–170,191,364–388`: the character is `x ↦ toCircle (n • x)`; the equivalence has the exact newly cited type and assumes `[Fact (0 < T)]`. Its use at README:965–969 fixes `T=2π`, satisfying this assumption. The new clause does not assert a theorem for zero period.
- `Mathlib/Analysis/Fourier/AddCircle.lean:123–143`: `fourier n x = exp(2πinx/T)`. `Mathlib/Analysis/SpecialFunctions/Complex/Circle.lean:435–442`: `homeomorphCircle` agrees with `toCircle`. Thus at period 2π the transported character is `z ↦ z^n`, with positive n, as §4.1 requires.
- `TauCeti/RepresentationTheory/Compact/FourierPeterWeyl.lean:123–148`: the coefficient-index equivalence sends the representation index n to −n. Moving the single-circle declaration to its own bullet preserves this distinct coefficient convention.
- `TauCeti/Algebra/Lie/HighestWeight/FiniteDimensional.lean:136` and `Existence.lean:234`: the finite-dimensional dominant-integral quotient and highest-weight classification are pinned inputs, corroborating the repair requested for the summaries.

**Supplier and ownership checks.** The changed clause cites an existing library object, introducing no new construction or supplier edge. The required roadmap search finds the same object consumed by `TauCetiRoadmap/BanachAlgebras/README.md:1803–1806` on main; I read that passage, which likewise uses period 2π and the transported formula `z ↦ z^n`. No new ownership claim is made here. The prior round's broader ownership audit is carried forward. The supplied overlap inventory has no conflicting head, dropped cited id or revision-only id. Citation resolution was rerun against main and the indexed open heads: no unresolved roadmap citations. That tool explicitly does not inspect the local pinned libraries; the declaration verification above does.

Reopened the contracts needed to verify R01/R02 on main: `TauCetiRoadmap/TopologicalKTheory/README.md:1233–1248` owns R(G); `TauCetiRoadmap/BanachSpaceTheory/README.md:841–848` supplies the Hilbert-basis separability criterion; `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/README.md:218–228` supplies the period dictionary. The cited headings and compact-root/integration targets in `TauCetiRoadmap/RepresentationTheory/LieGroups/README.md:252,356,446,463,518,641,750,883` resolve. No supplier was added, removed or redirected by the diff.

**Seeded sample and sources.** Only §4.1's single-circle input intersects this repair. It is verified directly at the pinned declarations above, including the positive-period hypothesis and sign. No scholarly locator changed and no new unverified locator was introduced. The remaining seeded targets (§§0.1, 1.1, 1.2, 1.4, 2.1, 5.1, 6.2–6.8 and 7.1), source checks and unchanged headline mathematics retain the previous report's assessment; they were not subjected to a new full review. Conway's settled status is recorded below.

**Adversarial table.** The following 24 unchanged rows carry forward r11's computed values, each citing that report. The final fresh row tests the corrected declaration and its dependent §4.1 use; two further rows record the scope witnesses for the remaining findings. No Lean theorem was changed.

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| `exists_kernelOperator_hilbertSchmidtEnergy` | two points of mass ½: k=1; k(1,2)=i; μ=0; Dieudonné measure on [0,ω₁] | projection of rank 1, energy 1 = 4·¼; entry i/2, energy ¼ = 1·¼; `Lp`=0, 0=0; `A_k`=k(ω₁,ω₁) on constants, both sides `|k(ω₁,ω₁)|²` | true, without regularity | carried from [r11](PRREVIEW-CompactGroupsPartII~11.md) |
| §0.2 operator bound | Cauchy–Schwarz twice | `|A f(x)| ≤ sup|k|·μ(X)^½‖f‖₂`, so `‖A‖ ≤ μ(X) sup|k|` | as stated | carried from [r11](PRREVIEW-CompactGroupsPartII~11.md) |
| §0.2 convolution bullet | pinned formula | `∫ k(xy⁻¹)f(y)` = kernel `f(xy⁻¹)`; on S₃ the other order `f(y⁻¹x)` differs | matches the pin | carried from [r11](PRREVIEW-CompactGroupsPartII~11.md) |
| `positive_selfIntertwiner_existsUnique_scalar` | ℂ, T=2I; trivial ℂ², diag(1,2); V=0 | c=2 (c=1 gives 2≠1); reducible, hypothesis fails; excluded by `IsSimpleOrder` | true | carried from [r11](PRREVIEW-CompactGroupsPartII~11.md) |
| `exists_linearIsometryEquiv_of_character_eq` | SU(2): g and ḡ; ℤ: diag(1,(−1)ⁿ) and Sⁿ; unipotent ℤ-action | J g J⁻¹=ḡ with traces a+ā; B=[[1,1],[1,−1]], B†B=2I, B/√2 unitary; character 2 but `‖(1,1)‖=√2`, not unitary | true; unitarity needed | carried from [r11](PRREVIEW-CompactGroupsPartII~11.md) |
| §1.3 base change | U=diag(1,i), A=[[1,1],[1,2]] | UAU†=[[1,−i],[i,2]]; U†AU=[[1,i],[−i,2]] | direction fixed | carried from [r11](PRREVIEW-CompactGroupsPartII~11.md) |
| `IsGFinite`, `gFiniteSubmodule_dense` | 0; trivial action over 𝔽₂; modes 0 and 1 on C(S¹); ℤ on ℓ²(ℤ); E=0 | orbit-span dimensions 0, 1, 2, ∞; `‖R_θ−I‖=2` yet orbits continuous; dense trivially | true without norm continuity | carried from [r11](PRREVIEW-CompactGroupsPartII~11.md) |
| §2.1 covariance Check | S₃, h=(12), t=(23) | ht: 1→2→3→1 = (123); th = (132) | as stated | carried from [r11](PRREVIEW-CompactGroupsPartII~11.md) |
| `secondCountable_iff_countable_irrepClass`, `separable_L2_iff_countable_irrepClass` | trivial group; C₃; Circle^ℕ; Circle^J, J uncountable | 1 class; 3 classes; dual `ℕ →₀ ℤ` countable; `‖χ_j−χ_k‖₂²=2`, uncountably many separated vectors, not metrizable | both sides agree | carried from [r11](PRREVIEW-CompactGroupsPartII~11.md) |
| `character_finite_coordinates` | J=∅; S₃×C₃, sign·ω | F=∅, value 1; value −ω at ((12),g); tail subgroup lies in the arc, so is killed | true for non-abelian factors | carried from [r11](PRREVIEW-CompactGroupsPartII~11.md) |
| `exists_productDualEquiv`, `circleProduct_character` | Circle², n=(1,−1) at (i,−1); coordinate characters on Circle^ℕ at the constant −1 | i·(−1)⁻¹=−i; each value −1, so no convergence to 1: discrete, not the subspace topology | as stated | carried from [r11](PRREVIEW-CompactGroupsPartII~11.md) |
| `exists_irrepClass_characterEquiv`, `exists_characterBasis` | Circle at i; C₃; f=c_χ+2c_ψ | coefficient ⟪i·1,1⟫=−i, trace i, so c_χ is the block of χ⁻¹; (1+ω+ω²)/3=0; Parseval 1+4=5 | true | carried from [r11](PRREVIEW-CompactGroupsPartII~11.md) |
| `compactCharacter_span_dense` | trivial group; C₃ | span = ℂ = C(G); 3 characters span ℂ³ | true | carried from [r11](PRREVIEW-CompactGroupsPartII~11.md) |
| §6.2 | z⁻¹ at θ=π/2; functional ½ | exp(−iπ/2)=−i (not exp(−π/2)); exp(iπ)=−1 at the period 2π | as stated | carried from [r11](PRREVIEW-CompactGroupsPartII~11.md) |
| §6.3 | rotation plane, v=e₁−ie₂ | R_θv=e^{iθ}v, weight +1; c(v)=e₁+ie₂, weight −1; c(iv)=−ic(v) | as stated | carried from [r11](PRREVIEW-CompactGroupsPartII~11.md) |
| §6.4 | SU(3), s₁=(12), s₂=(23) | `n_σ⁻¹tn_σ e_j=t_{σ(j)}e_j`, so σ·e_i=e_{σ(i)}; (s₁s₂)·e₁=e₂, (s₂s₁)·e₁=e₃; orbit of (1,1,0) has 3 elements | left action, matches the pinned `permutationUnitary` | carried from [r11](PRREVIEW-CompactGroupsPartII~11.md) |
| §6.5 | SU(2), SO(3), U(2) | exp(2πH_R)=I, exp(πH_R)=−I: Y=ℤH_R=Q∨; SO(3): Y=½ℤH_R; `λ_χ(H_α)=(iℓ_χ)(−iα_ℝ∨)=ℓ_χ(α_ℝ∨)`; kernel scalar (−1)^{q−a}: (1,1) descends, (0,1) does not | as stated | carried from [r11](PRREVIEW-CompactGroupsPartII~11.md) |
| §6.6 | U(2), (1,0) and (2,1) | derived coordinate 1 both; central z and z³: i and −i at z=i; q−a = 0 and 2 | central exponent separates | carried from [r11](PRREVIEW-CompactGroupsPartII~11.md) |
| §6.7 | SU(2) | χ₂=t²+1+t⁻²=m₂+m₀; t²+t⁻²=χ₂−χ₀ | unitriangular; positivity not implied | carried from [r11](PRREVIEW-CompactGroupsPartII~11.md) |
| §6.8 | U(3), λ=(2,1,−1); (1,0) with q=0; general n | q=2, a=(1,2), 1+2·2=5≡2 mod 3; ζ⁰·ζ⁻¹≠1; `Σ i a_i = q − nλ_n ≡ q` | congruence correct | carried from [r11](PRREVIEW-CompactGroupsPartII~11.md) |
| `u2_weight_character_iff` | {(2,0):1,(1,1):2,(0,2):1}; {(1,−1),(−1,1)}; {(−1,−1)}; f=0 | m(2,0)=1, m(1,1)=2−1=1, dimension 3+1=4; f(0,0)=0<1 fails; trace at diag(i,−1) is 1/(−i)=i; n=0 | both directions; `m(a,b)=f(a,b)−f(a+1,b−1)` telescopes | carried from [r11](PRREVIEW-CompactGroupsPartII~11.md) |
| `su2_multiplicities_and_faithfulness` | n=0; Sym²; Sym¹⊕Sym¹; Sym⁰⊕Sym¹ | not injective, no odd d; −I acts by (−1)²=1; kernel {I}, 2·2=4; injective, n=3 | iff agrees | carried from [r11](PRREVIEW-CompactGroupsPartII~11.md) |
| `exists_su2_of_multiplicities`, §7.1 count | m=δ₂; n=2, 3, 4 | dimension 3; p(n)−p_odd(n) = 2−1, 3−2, 5−2 = 1, 1, 3 | true | carried from [r11](PRREVIEW-CompactGroupsPartII~11.md) |
| Layer 0 Examples | Weyl integration of 1 | (1/(2π))·4·(π/2)=1, the pinned normalisation | as stated | carried from [r11](PRREVIEW-CompactGroupsPartII~11.md) |
| Corrected single-circle supplier, README:300–302; §4.1 | T=2π, n=0,1,−1; x=π/2; Circle² with (1,−1) at (i,−1) | exp(0)=1=z⁰; exp(iπ/2)=i=z; exp(−iπ/2)=−i=z⁻¹; i·(−1)⁻¹=−i on both sides; 2π>0 | exact pinned type, period and sign agree | R03 repaired; no new defect |
| Family index scope and suppliers | Compare named owners and pinned inputs | Representation-ring owner: TopologicalKTheory T6, not this folder; highest-weight source: 2 opened pinned declarations, not a roadmap contract | summaries disagree with head | R01 remains |
| Generated summary | Compare claims and headline inventory | 1 excluded ring construction claimed; 1 wrong highest-weight supplier; energy and unitary-equivalence headlines occur at Lean:53,86 | generated block disagrees with head | R02 remains |

## Not verifiable

- Conway1990, *A Course in Functional Analysis*, VII.9, Exercises 8–11, cited in §§4.1 and 5.1. The previous report and source status settle this as uncertified/paywalled. No new fetch or access request was made. Exercise numbering is not independently certified; the changed single-circle input was checked in the pinned code instead.

## Source issues

- none
