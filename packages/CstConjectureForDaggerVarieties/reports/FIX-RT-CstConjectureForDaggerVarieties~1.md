# FIX-RT-CstConjectureForDaggerVarieties~1

Two red-team passes, ten findings: pass a F01–F04 (cited here as a.F01–a.F04) and pass b F01–F06 (b.F01–b.F06). They do not overlap, except that a.F01 and b.F01 both touch the supplier-contract section. Every finding was checked against CN25, GK04, BKV22 and the newly fetched CN1, against the supplier READMEs at their current heads (LocallyAnalyticDistributions, VectorBundlesAndIsocrystals, CrystallineCohomology and CohomologyComparisons, read through `roadmaps show`), and against the Mathlib pin.

## F01 (P2) — applied differently

Pass a finding F01 (cited elsewhere in this report as a.F01).

The vague `compact-extension-duality` contract (LocallyAnalyticDistributions) is replaced by `de-rham-quotient-splitting` (CohomologyComparisons §4.9a). The new contract states the sequence 0→H_q→E_q→Q_q→0 for the Čech–de Rham model of RΓ_dR(X/B_dR⁺) on every finite affinoid covering, together with its topologies, and asks for a continuous B_dR⁺-linear retraction whose kernel maps homeomorphically onto Q_q (CN25 lines 2439–2444).

Why the repair differs from the one proposed: the statement concerns dagger B_dR⁺-complexes, which LocallyAnalyticDistributions does not own, so the supplier moves to the owner of those complexes. Requiring the statement for every covering removes the need for a separate invariance clause. The §2.9 proof route, its Needs line, the Layer 2 Dependencies, the Scope paragraph and the Suggested.lean docstring ("continuous-splitting obligation") are updated to match. A computed Check was added: on the dagger disc at q=0, f↦f(0) is the retraction; for a point, Q₀=0.

## F02 (P3) — applied

Pass a finding F02 (cited elsewhere in this report as a.F02).

All 42 flagged bullets were handled:

- **Deleted outright (8).** These restated their own section: 0.2, 0.8, 1.1, 1.2, 1.3, 2.3, 2.8 and 3.1.
- **Moved into the definition or theorem prose (4).** These are 0.1 (no Galois action), 0.3 (sign of t_H(D′)≤t_N(D′)), 0.5 (natural VS maps) and 2.1 (Fil lattice, not A). Matching sentences were also added to 2.4 (the role of the preceding failure term) and 2.9 (Layers 3–5 do not depend on the decomposition).
- **Replaced by computed instances.** These are §§0.7, 0.8, 1.4, 2.4–2.7, 2.9, 3.2, 3.3, 3.6, 4.3–4.7 and 5.1–5.6, using the values in the table below. For §0.7 the reviewer's three-instance text was used after recomputation.
- **Additional computed Checks** in §§0.6, 0.9 and 2.2.

The twelve duplicated second `**Checks.**` headers are gone.

## F03 (P1) — applied

Pass a finding F03 (cited elsewhere in this report as a.F03).

The witness holds. Take X=⨿_m Aᵐ: each X_n is quasi-compact with nonnegative slopes, and Hⁿ_dR(X_n) contains the class dT₁/T₁∧…∧dT_n/T_n, so amplitudes are unbounded. LocallyAnalyticDistributions §0.0 builds the strict derived category from bounded complexes only, while CN25 works with left-bounded complexes (CN25 lines 348–354).

What changed:

- `gap:strict-countable-derived-limits` (README and plan) now asks for the bounded-below strict derived category with its left t-structure, towers with a common lower bound, and τ_≤i Rlim C_n≅τ_≤i Rlim τ_≤i C_n.
- The Conventions definition of LH(C_Q_p) now names the bounded-below category.
- The LocallyAnalyticDistributions paragraph explains the gap; the §1.1 Needs line and the Layer 1 Dependencies line cite the contract.
- The §4.1 Needs line cites the truncation compatibility, and the witness is added as a §4.1 Check.

## F04 (P1) — applied

Pass a finding F04 (cited elsewhere in this report as a.F04).

The witness holds. VectorBundlesAndIsocrystals VB0 fixes a local field with residue field F̄_q ("Finite isocrystals over the completed maximal unramified coefficient field"), whereas k=F_p(z)^perf is an allowed residue field. CrystallineCohomology §CR.4.7, "Slope decomposition on the existing isocrystal carrier", covers every perfect k and gives the block classification over k̄. It is line 21 of the merge order, so it is a legal supplier.

What changed:

- A new supplier block "From TauCetiRoadmap.CrystallineCohomology" identifies F̂ⁿʳ with W(k̄)[1/p] and states VB0's narrower range.
- The Needs lines of §0.6 and §2.8, the Layer 0 Dependencies, the Scope paragraph and the VectorBundlesAndIsocrystals paragraph are repointed. VB0 is no longer consumed anywhere.

## F01 (P2) — applied

Pass b finding F01 (cited elsewhere in this report as b.F01).

**`analytic-syntomic-descent`** is split into four contracts (plus the a.F01 splitting contract), each with CN25 locators:

| New contract | Consumers |
|---|---|
| `dagger-analytic-complexes` (CN25 lines 1954, 2231, 2405) | §§1.1, 1.2, 1.3, 1.4, 2.6, 2.8, 3.2, 3.6, 3.7, 5.2, AdicSpacesPartIV paragraph |
| `stable-range-period-map` (lines 1954, 960, 2647) | §§1.1, 1.3, 2.2, 2.4 |
| `stein-affinoid-syntomic-diagram` (line 2098) | §1.5 |
| `analytic-exhaustion-descent` (lines 2601, 2664) | §§4.1, 4.5 |

**`bc-countable-inverse-limits`** (VB3; CN25 Remark 3.15, line 764) is split out of `qbc-pairs` and consumed by §§4.1 and 4.3.

**`geometric-log-periods`** is split into three: `algebraic-comparison-over-c` and `analytic-hk-gaga` (§3.3; lines 2491, 2493), and `proper-log-period-sequence` (§§3.4–3.5; lines 2507–2525).

**Related fix (same pattern).** §2.8 used the slope bound without citing any contract; it now cites `dagger-analytic-complexes`.

All Dependencies lines are updated. The README and the plan list the same 22 slugs, with matching supplier and `needs` text (checked by script).

## F02 (P3) — applied

Pass b finding F02 (cited elsewhere in this report as b.F02).

GK04 line 500 defines U_i={|f_i|≥ε}; Proposition 3.7 removes the open polydisc tube. The §3.7 proof route now covers the closed tube's complement as follows:

- It is the union of U_ε′ over ε′∈|K̄×| with ε<ε′<ε₀, taken along a sequence decreasing to ε.
- The transition maps are quasi-isomorphisms, so R¹lim vanishes and the limit is a quasi-isomorphism.

**Corrections to the reviewer's text:**

- I used |K̄×|, which is GK04's Γ* (GK04 line 55), rather than |K×|: |K×| is discrete, so the interval (ε,ε₀) can be empty in it.
- Finite dimensionality is not needed for the limit step.
- The reviewer's P¹ check described "closed annuli". The pieces are actually closed discs {|T|≤1/ε′}, and the check now says so.

The Needs line now derives smallness from §3.4 by transport. §3.6 is unaffected because it removes the open tube, so U stays quasi-compact.

## F03 (P3) — applied

Pass b finding F03 (cited elsewhere in this report as b.F03).

The locator "(difference-map convention)" is replaced by "CN25 lines 2117–2128 and 2185, whose plus sign is replaced here by the difference map, so that v∘u=0". CN25 line 2127 shows the plus sign.

## F04 (P3) — applied

Pass b finding F04 (cited elsewhere in this report as b.F04).

At the pin, Isocrystal.lean line 112 is `-/` and the class is declared at line 113, so `:112` became `:113`. The §0.3 heading now reads "over C".

## F05 (P3) — applied differently

Pass b finding F05 (cited elsewhere in this report as b.F05).

CN1 (arXiv 2104.13448v3) was fetched through the sources service; it is recorded as certified, open-repository. The source defines a naive interior only for a smooth dagger affinoid (CN1 line 1163, p.26).

The reviewer's extension to quasi-compact spaces is not in any source, so it was not adopted. §1.2 now defines the affinoid notion with the disc example and a non-example, the contract's second class reads "naive interiors of smooth dagger affinoids (defined in §1.2)", and CN1 is listed in References and in `sources.toml`.

## F06 (P3) — applied

Pass b finding F06 (cited elsewhere in this report as b.F06).

The process sentence was deleted from the Suggested.lean docstring.

## Adversarial pass on new and changed statements

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| de-rham-quotient-splitting | point q=0; disc q=0; q<0 | (H,E,Q)=(B⁺,B⁺,0); retraction f↦f(0), kernel ≅ O(D)⊗̂B⁺/B⁺; all zero | holds |
| strict-countable-derived-limits truncation | constant Q_p in degree 0; ⨿Aᵐ | (H⁰,H¹)=(Q_p,0) both sides; Hⁱ(Rlim) uses only R¹lim Hⁱ⁻¹ and lim Hⁱ, so τ_≤i agrees | holds; needs R^q lim=0 for q≥2 (included) |
| CR.4.7 over F̂ⁿʳ | k=F_p; k=F_p(z)^perf; slope-one line at r=0 | W(F̄_p)[1/p], W(k̄)[1/p]: both covered; X_st⁰=(B_cris⁺)^(φ=p⁻¹)=0 | VB0 fails on case 2; CR.4.7 covers both |
| slope bound [0,min(i,dim X)] | point i=0; annulus i=1; P¹ i=2 | 0≤0; 1≤1; 1≤min(2,1)=1 | holds |
| bc-countable-inverse-limits | decreasing sub-BC chain | dimension constant from N on, height bounded ⇒ chain stationary ⇒ Mittag–Leffler | holds |
| §3.7 limit route | discrete \|K×\|, ε=\|π\|², ε₀=\|π\| | no element of \|K×\| in between; \|π\|^(3/2)∈\|K̄×\| | uses \|K̄×\| |
| §3.7 P¹ check | Z=∞, f=S, ε=\|π\| | complement {\|T\|<\|π\|⁻¹}; U_ε′={\|T\|≤1/ε′}; de Rham (K,0) on all | holds (my first draft had the inclusion reversed; fixed) |
| naive interior | closed disc | open disc: Stein, complement {\|T\|=1} affinoid ✓; closed disc: not partially proper ✗ | holds |
| §0.7 Checks | trivial r=0; M=0; trivial r=1 | rank 1, image of e is 1; 0; Hom(U₁,B_dR)≅Hom(Q_p t,B_dR)=B_dR | agree with theorem |
| §0.8 Checks | L=B⁺e,r=1; L=t⁻¹B⁺e; slope-1 line | V=Q_p t, rank 1; V=U₁, rank 1; X¹=Q_p e↪C e, V=0, Hom 0 | acyclicity necessary |
| §0.9 Check | trivial, r=1, k=2 | multiplication by t on B⁺/t²: kernel tB⁺/t² (killed by t), cokernel C (killed by t) | within bounds; not an isomorphism |
| §1.4 Checks | point i=0, r=0→1 | U₁/Q_p t≅C=B⁰/tB⁰; kernel of x−f is diagonal Q_p | holds |
| §2.2/2.4 Checks | point i=0,r=1; disc i=r=1 | U₁∩tB⁺=Q_p t; θ onto; disc kernels 0 | holds |
| §2.5–2.7 Checks | point; disc; O(−1) in degree 2 | 1=1+0+0; 0=0+0+0; 1−1=0≠1 | holds; negative control fails as intended |
| §3.2 Check | D×D, TS | ∂²(TS)/∂T∂S=1 versus 0 for f(T)+g(S) | pro-étale Künneth fails, de Rham (1,0,0) holds |
| §3.3 Checks | A¹; G_m | H¹_ét(A¹)=0 but H¹_proét=O/C; G_m degree 1−1=0 | holds |
| §4.4–4.7 Checks | P¹×T; ⨿ points | Hⁱ(T)⊕Hⁱ⁻²(T)(−1); H²(S_n)=0; degree-0 square exact with ∏B_dR⁺ not finite free | holds |
| §5.3 Checks | point; P¹ i=2; disc | F^nr, K; F^nr t⁻¹ with φ=p⁻¹ and jump −1; 0 | contravariance pinned |
| §5.4–5.6 Checks | point; disc; good vs Tate elliptic | B_st, B_dR; 0 (torsion Pair); rank 2 both, N rank 0 vs 1 | holds |

## Checks run

- **Elaboration:** `lake env lean packages/CstConjectureForDaggerVarieties/Suggested.lean`, run from the content checkout, exited 0 with no output. The file declares nothing, so there were no `#check @name` signatures to compare. No elaborated type changed.
- **Dependency check:** the `gate --depcheck … --movable` command printed `depcheck: 56 roadmaps, 648 edges, 0 problem(s)` and no UPWARD, CYCLE or moved line. The roadmap is line 205 of the merge order, after all its suppliers.
- **New supplier:** CrystallineCohomology is earlier in the merge order (line 21).
- **Citations:** `roadmaps resolve` found no unresolved cross-roadmap citations and no unresolved Lean names.

## For the maintainer

- **Slug changes.** Gap slugs were renamed or split; no other roadmap cites them.
  - Removed: `analytic-syntomic-descent`, `compact-extension-duality`, `geometric-log-periods`.
  - Added: `dagger-analytic-complexes`, `stable-range-period-map`, `stein-affinoid-syntomic-diagram`, `analytic-exhaustion-descent`, `de-rham-quotient-splitting`, `bc-countable-inverse-limits`, `algebraic-comparison-over-c`, `analytic-hk-gaga`, `proper-log-period-sequence`.
- **Supplier changes.** LocallyAnalyticDistributions now carries one gap instead of two. CohomologyComparisons carries nine gaps. CrystallineCohomology becomes a supplier, and VectorBundlesAndIsocrystals VB0 is no longer consumed.
- **Ownership:** no new construction was introduced here. Every repair either repoints to an existing owner or restates a contract with an existing supplier.
- **Sources:** `sources.toml` gains CN1. No text is missing, and no `needs-references.toml` was written.
- **Untrusted text:** nothing suspicious was found in either review.
