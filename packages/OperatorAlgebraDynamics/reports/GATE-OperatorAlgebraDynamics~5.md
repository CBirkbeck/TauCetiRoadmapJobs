# GATE-OperatorAlgebraDynamics~5: answers to the review of f3a756d

The review (CBirkbeck, 2026-11-05T08:14:04Z, of `f3a756d`) has eleven distinct points: F01 makes four
(H01–H04), F02 one (H05), F03 one (H06), F04 five (H07–H11). Most were repaired in `5c8e27e`; this round
verified each at that head and repaired two residual defects in commit `c933c6c`. Line numbers below
are `TauCetiRoadmap/OperatorAlgebraDynamics/README.md` at `c933c6c` unless stated.

## H01 (CBirkbeck) — applied

D1.Modules no longer plans HilbertModules H3: the Gram positivity, induced Hilbert space `X⊗_ρH`,
`Ind_Xρ` with its intertwiners, direct sums, `B⊗_ρH≅H` and two-inner-product imprimitivity bimodules
with completion are consumed as the declared gap `What HilbertModules must provide
(gap:hilbert-module-induction)` (lines 188–203), and D1.Modules (line 368, retitled "Module
conventions and the stage lemma for explicit pairings") keeps only the module conventions and the
stage lemma for an explicit pairing `X⊙Y→Z`, which H3 does not state; every consuming target cites the slug.

## H02 (CBirkbeck) — applied

The dual Haar measure, Plancherel unitary, Fourier inversion, rescaling law and Pontryagin duality are
now `gap:lca-fourier-plancherel` under VonNeumannAlgebras V11 (lines 205–216). D4.Harmonic (line 1554)
keeps only the Fourier transform on `L¹(G)`, the isomorphism `C*(G)≅C₀(Ĝ)` of the full group
C*-algebra, the full/reduced agreement, and `C*(Ĝ)≅C₀(G)` as a consequence of the gap.
`pontryagin_duality` and `exists_dualHaar_plancherel_inversion` are gone from `Suggested.lean`; its
docstring keeps the `C*(G)≅C₀(Ĝ)` entry as not statable (no group C*-algebra).

## H03 (CBirkbeck) — applied

Measurable fields, the decomposable-operator criterion, fibrewise unitarity, change of measure and zero
extension are `gap:measurable-hilbert-fields` (V4.0.Fields, lines 218–231), and the reduction over a
given diagonal with the transport theorem is `gap:diagonal-reduction` (V4.0.Decomposition, lines
233–245). D5.Fields (line 1888) now only proves that SA-B85's standard-fibre model, with fundamental
sections `x↦1_(n∈N(x))e_n`, is a measurable field in the gap's sense, and identifies its operator
fields with Borel matrix fields.

## H04 (CBirkbeck) — applied

The sentence assigning the weak-operator closure of the regular representation of `A⋊_rG` to V8/V11
is cut (Scope, line 54 onward now names only `M⋊̄G` and the regular–normal bridge); nothing in the
roadmap consumed it, and `grep -i "weak.operator closure"` finds no remaining occurrence.

## H05 (CBirkbeck) — applied

`lcaWeyl_classification` is stated in `Suggested.lean` (D4.LCAWeyl section, line 255) in the reviewer's
form, with the Hilbert space renamed `E : Type u`, and named at README line 1699; the docstring no
longer lists LCA Weyl as not statable. Covariance phase recomputed on the Schrödinger pair:
`(U_sV_χU_s*ξ)(t)=χ(s⁻¹t)ξ(t)=conj(χ(s))χ(t)ξ(t)`, matching `hcov`.

## H06 (CBirkbeck) — applied

"using D3's translation model" and the D3 item of D2.BoundedSequenceTranslation's `*Needs:*` are
deleted; the target's `*Needs:*` (line 1381) lists D1, D2, CStarAlgebras C2/C8 and Mathlib `lp` only,
and D3's Check (line 1516) now points down to D2's `c₀(ℤ)⋊ℤ=K(ℓ²(ℤ))`. No D2 `*Needs:*` line names D3.

## H07 (CBirkbeck) — applied

CCR and type I are defined at first use (lines 1266–1268: CCR when every irreducible image is `K(H)`,
type I when every irreducible image contains `K(H)`), and the CStarAlgebras C2 item (line 1382) reads
"irreducible representations, primitive ideals" without "type I and CCR".

## H08 (CBirkbeck) — applied

Factor states are defined where they are used (line 2401–2404: a state whose GNS representation
generates a von Neumann algebra, Mathlib's `VonNeumannAlgebra`, with trivial centre); C2 is cited
only for states and their GNS representations (lines 2383, 2471).

## H09 (CBirkbeck) — applied

The "C1 (universal C*-algebras from generators and relations)" item is replaced by "CStarAlgebras C5
(inductive limits, and C5.4's universal unitary algebra as the model of a universal norm)" (line
2276–2277).

## H10 (CBirkbeck) — applied differently

The two consumption claims ("remain NoncompactQuantumSymmetry M2's targets, with these fiber
identifications as inputs" and "that section consumes it") are deleted, and this round also rewrote the
remaining generic one at lines 1086–1089 ("are consumers of these two sections" → "are
NoncompactQuantumSymmetry M2's, built there from its own extension `E_ω`; nothing in D1 depends on
them"). The witness that NoncompactQuantumSymmetry "builds no all-weight decomposition" is not right:
at head `777a2fe` its README line 1551, the paragraph after M2.FixedTwistTypeI, proves
`C*(E_ω)≅⊕_(k∈ℤ)^{c₀}J_k(E_ω)` with `J_k(E_ω)≅C*(G,ω^k)` and the all-central-weights type-I criterion.
So the Scope attribution stays, made precise (line 42–43: "NoncompactQuantumSymmetry M2 (the
all-central-weights criterion after M2.FixedTwistTypeI)").

## H11 (CBirkbeck) — applied differently

"that later roadmap" was removed in `5c8e27e`, but the replacement "is made in that roadmap" was itself
false and contradicted Scope line 40 ("the comparison … is made in neither"): MetaplecticAutomorphicForms
(on main, §1.2 Unitary Stone–von Neumann) never mentions OperatorAlgebraDynamics or a locally compact
abelian Weyl theorem. Line 1717 now reads "the comparison of the two statements is made in neither
roadmap", in agreement with Scope.

## Signatures

`#check @name` for all 17 declarations (scratch `SignatureCheck.lean`, elaborated once): each type agrees
with its README statement. The five flagged declarations (`IsCovariant`, `convolution`,
`CentralCocycle`, `CentralCovariantPair`, `transitive_commutant_scalar`) drop only topology and measure
instances their types do not use (an algebraic identity, a Bochner integral, structures that keep
`[TopologicalSpace G]` for their continuity fields, and a bare transitive `G`-set as README states).
`Suggested.lean` is unchanged this round.

## Adversarial pass on changed statements

| Statement | Instance tried | Values | Result | Change |
|---|---|---|---|---|
| Scope: NQS M2 owns all-weight decomposition | NQS `777a2fe` line 1551 | `C*(E_ω)≅⊕_k J_k`, `J_k≅C*(G,ω^k)` proved there; M2.FixedTwistTypeI (line 1545) assumes only `J_1(M)` type I | attribution true only for M2's following paragraph | named precisely |
| D1 dependency sentence | D1.TwistedBorel Check, G=ℤ/2, ω(a,a)=−1 | weight 1: `u²=−1`, `ℂ⊕ℂ`; weight 2: `u²=1`, `ℂ⊕ℂ`; no NQS input used | D1 needs nothing from NQS | consumption claim removed |
| Stone–von Neumann comparison | MAF README §1.2, Scope line 40 | MAF: 0 hits for "OperatorAlgebraDynamics"; Scope: "made in neither" vs line 1717 "made in that roadmap" | contradiction | line 1717 → "neither roadmap" |
| `lcaWeyl_classification` covariance | Schrödinger pair on `L²(K)`; K=ℤ/2, s=a, χ nontrivial | `U_aV_χU_a*=diag(−1,1)=−V_χ=conj(χ(a))V_χ` | consistent | none |

## Ownership and sources

No new construction is stated; the gaps cite HilbertModules H3 and VonNeumannAlgebras V4.0.Fields,
V4.0.Decomposition and V11 as owners. No new source was needed; no `needs-references.toml` entry.
No suspicious instruction was found in the review text.

## Build and gate

`lake build TauCetiRoadmap.OperatorAlgebraDynamics.Suggested`: `Build completed successfully (8957 jobs)`,
only `declaration uses sorry` warnings.

Gate: `gate OperatorAlgebraDynamics: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`

Depcheck (`--movable`): `depcheck: 232 roadmaps, 2133 edges, 0 problem(s)` — no UPWARD, CYCLE or `moved:` line.

Commit: `c933c6c` "OperatorAlgebraDynamics: review repairs (NoncompactQuantumSymmetry M2 attribution; Stone–von Neumann comparison made in neither roadmap)". Not pushed.
