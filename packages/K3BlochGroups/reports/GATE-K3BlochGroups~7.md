## H01 (CBirkbeck) — answered

The shared-carrier conflict remains unresolved: ColemanIntegration §L2.Fb (`TauCetiRoadmap/ColemanIntegration/README.md:1458`, head ae078af) independently constructs the same integral quotient and boundary, PolylogarithmFunctions' downstream contract (`TauCetiRoadmap/PolylogarithmFunctions/README.md:1069`, head 860558b) assigns those constructions to ColemanIntegration, and PadicHodgeRegulators mixes those carriers with K3BlochGroups' maps (`TauCetiRoadmap/PadicHodgeRegulators/README.md:59` and §3.3, head 1a3728e). K3BlochGroups already supplies the required symbol-preserving equivalence and natural boundary/kernel transports in §§3.4–3.5 (`TauCetiRoadmap/K3BlochGroups/README.md:692`, `:733`, `:2282`); the remaining repair is to make ColemanIntegration import Layer 3 through aliases or those transports, correct PolylogarithmFunctions' ownership attribution, and make PadicHodgeRegulators import the algebraic carriers here and evaluation from ColemanIntegration, but all three consumer files are outside this job's permitted edits, so this finding must stay open.

## H02 (CBirkbeck) — applied

“Appendix II.1.A” → “Chapter II, §1.A” in `TauCetiRoadmap/K3BlochGroups/README.md:2300`, with the section's shorter locator made explicit at `:1997`; the chapter heading, subsection heading and printed page numbers are verified at zagier line 971, line 1023 and line 1063. The Rogers formulas and Lean statements are unchanged; the same old label in `packages/K3BlochGroups/sources.toml` is outside the permitted edits and remains for the worker to reconcile.

### Ownership, citations and signatures

Commit: 5b6774f, `K3BlochGroups: review repairs (correct Zagier chapter locator)`; only the two README locators changed, and nothing was pushed.

K3BlochGroups remains the owner of the shared algebraic interface: it precedes ColemanIntegration and PadicHodgeRegulators in the supplied merge order (positions 110, 151 and 209), and its Layer 3 constructs the carriers required by its Suslin map. Moving their ownership to either consumer would reverse supply. PolylogarithmFunctions precedes this roadmap and supplies only its analytic functions and cross-ratio inputs. No ownership moved in this repair.

The ownership search covered objects in main at 7bd35ba, the board packages, and the indexed open roadmap heads; the three conflicting consumer contracts were read directly, including PadicHodgeRegulators §§3.3 and 5.6. The main branch has neither ColemanIntegration nor PolylogarithmFunctions, so their new-roadmap heads, rather than a revision of an existing roadmap, are the relevant contracts. At the verified Mathlib pin 6b7abb3 and Tau Ceti pin a91d3aa, no shared pre-Bloch/Bloch carrier was found: `TauCeti/LinearAlgebra/TensorProduct/Symmetric.lean:126` defines the negative eigenspace of tensor flip, whereas this roadmap needs the cokernel; on ℤ these give 0 and ℤ/2 respectively. The reduced and unreduced presentations agree by killing the free generator [1], as specified in weibel, VI.5.1, chapter VI p.23, but independent quotient constructions still require an explicit equivalence.

The cross-roadmap resolver reported no missing roadmap citations; its absence of pinned-library checks was supplemented by reads at the actual pins and re-elaboration. In particular `uce.source_superperfect` is the planned supplier API in StableHomotopyKTheory §3.29, not a claim about an existing pinned declaration. The cited supplier sections were inspected at their new-roadmap heads, with AlgebraicTopology, AlgebraicCurves, GlobalNumberFields and completed UniversalCovers read on main. Existing waived source keys remain settled; no new source or missing-text request was introduced.

A scratch file containing `#check @name` for every one of the 13 declarations elaborated successfully. Every elaborated type was compared with its README statement and with the supplied pre-edit signatures: all 13 are unchanged, with no dropped hypothesis and no needed binder repair. In particular infinitude and the identity coefficient morphism remain in general-linear stability; the cyclic modulus is nonzero and j≥1; finite SL₂ retains primality and characteristic; finite Bloch order retains q≥4; exact order six retains `IsFormallyReal`. `Suggested.lean` is unchanged.

### Computed adversarial checks

No mathematical statement was added or changed. The table records computations for the shared interface implicated by H01, the normalization cited by H02, and every acceptance declaration; it does not claim a new independent proof of the roadmap's admitted theorems.

| Statement | Instances tried | Values computed on the two sides | Result | Change |
|---|---|---|---|---|
| `antisymSquare` (§3.1) | A=0, ℤ, ℤ/2, ℤ/3 | coker(2) is respectively 0, ℤ/2, ℤ/2, 0; exterior square is 0 in each cyclic case | Diagonal torsion retained; eigenspace over ℤ would be 0 | None |
| `antisymSquare_diagonal_exact` (§3.1) | A=0, ℤ, ℤ² | Kernel sizes 1, 2, 4 equal those of A/2A; for ℤ², p(a,b,c)=c and p(e₁∧e₂)=1 | Both directions of the diagonal equality agree: a∧a=b∧b iff a−b is even | None |
| `preBlochRawSymbol` (§3.3) | ℚ at 0,1,2 | 0, e₁, e₂; coefficient of the corresponding nonzero basis element is 1 | Raw [1] remains nonzero; zero raw map excluded | None |
| Admissibility and five-term expression (§3.3) | ℚ at (2,3), (4,2), (2,2), (2,1) | Arguments (2,3,3/2,3/4,1/2) and (4,2,1/2,3/2,3); diagonal rejected; y=1 makes 1−y⁻¹=0 | Every admitted denominator is nonzero; diagonal/zero-denominator inputs excluded | None |
| `preBloch` (§3.4) | 𝔽₂, 𝔽₃, 𝔽₄, 𝔽₅ | Reduced and unreduced presentations both give 0, ℤ, ℤ/5, ℤ/6; numbers of admissible pairs 0,0,2,6 | Integer relation minors give the same free ranks and invariant factors | None |
| `preBlochSymbol` (§3.4) | 𝔽₅ at 0,1,2,3,4 | In ℤ/6 on [3]: 0,0,2,1,0 | Symbols at 2 and 3 have orders 3 and 6; zero symbol map fails | None |
| Reduced/unreduced equivalence (§3.4) | 𝔽₄, with ω²+ω+1=0 | Relations 3a−2b and 3b−2a have determinant 5; a=1,b=4 modulo 5; both composites fix 1 and 4 | A symbol-preserving equivalence exists; equality of quotient types is not supplied by these values | None; consumer gap retained |
| Boundary and its commuting square (§3.5) | 𝔽₅ | In either presentation ∂[2]=0, ∂[3]=1 in ℤ/2; kernel {0,2,4}⊂ℤ/6 has order 3 | Ordinary exterior square would give boundary 0 and kernel order 6 | None |
| Boundary order convention (§3.5) | ℚ at [3] and [2] | v₂(3)v₃(−2)−v₃(3)v₂(−2)=−1; sign/valuation pairing on 2∧(−1) is −1=1 modulo 2 | Reversing [3]'s factors gives +1; killing [2] fails the boundary square | None |
| Field-map transport (§§3.4–3.5) | 𝔽₄ Frobenius and its square | [ω]↦[ω²]=4[ω]; second Frobenius gives 4²=16=1 modulo 5; Qₛ(C₃)=0 throughout | Identity and composition agree; zero transport fails on [ω] | None |
| `generalLinearStabilization` (§4.8) | n=0; n=1, g=(2) over ℚ | Empty matrix↦(1); diag(2,1)diag(1/2,1)=I₂ and determinant 2 | Trailing block 1 preserves invertibility | None |
| `generalLinear_homology_stable` (§4.8) | n=i=0; n=i=1 over ℚ; excluded n=0,i=1 | H₀ map sends 1↦1; determinant sends 2↦2 on H₁; outside range 0→ℚˣ misses 2 | Range and identity coefficients survive elaboration | None |
| `cyclicHomology_power_map` (§4.15) | m=1; m=7,a=2,j=1,2; a=0,j=2 | Trivial group's H₁,H₃ are 0; multipliers 2 and 4 modulo 7; zero power gives 0 | Weight two differs from weight one; j=0 and m=0 are excluded | None |
| `symmetricGroup_homology_stable` (§4.15) | n=i=0; n=2,i=1; n=3,i=1 | H₀: ℤ→ℤ,1↦1; H₁(Σ₂)→H₁(S₃)→H₁(Σ₄) sends 1↦1 in ℤ/2 | Includes a nonabelian group; excluded Σ₁→Σ₂ on H₁ is 0→ℤ/2 | None |
| `finite_sl2_localized_homology` (§5.2) | q=2,3,4,5,7,8,9,27 | q²−1 gives 3,8,15,24,48,63,80,728; each is −1 modulo p | Matches the cyclic prime-to-characteristic orders in hutchinson2013 line 704 | None |
| `finite_sl2_integral_homology` (§5.2) | Same q; negative controls q=16,25 | Integral orders 6,24,30,120,48,126,240,2184; nonexceptional orders 255,624 | Exceptional extra factors are 2,3,2,5,1,2,3,3, as in hutchinson2013 line 861 | None |
| `finiteBloch_order` (§5.5) | q=4,5,7; excluded q=2,3 | Orders 5,3,4; directly P(𝔽₂)=B(𝔽₂)=0 and B(𝔽₃)=2ℤ≅ℤ | Formula matches hutchinson2013 line 1675 and line 1679 in its q≥4 range | None |
| Rogers interval convention (§5.8) | x=0,1/2,1 | L values 0,π²/12,π²/6; midpoint reflection gives 2·π²/12=π²/6 | Matches zagier line 1025 and line 1064 | Locator only |
| Three detector branches (§5.8) | x=1/2,2,−1 | In units of π²: 1/12−1/6=−1/12; 1/6−1/12=1/12; 1/12−1/3=−1/4 | All three formulas use the same interval normalization | Locator only |
| `blochC_order_six` (§5.8) | F=ℚ; formally real extensions via transfer | ρ(c)=1/12−1/4=−1/6; 2ρ(c)=−1/3≠0, 3ρ(c)=−1/2≠0, 6ρ(c)=−1=0 modulo 1 | Exact order 6; period π²/2 would give order 3; 𝔽₅ has c of order 3 and is excluded | None |

### Build and gate

`lake build TauCetiRoadmap.K3BlochGroups.Suggested` exited 0, with eight expected admitted-theorem warnings and no errors. Exact completion line:

```text
Build completed successfully (8976 jobs).
```

The signature elaboration exited 0. The initial pre-commit gate failed only because the permitted README edit was uncommitted (`dirty=1`); the post-commit gate exited 0. Exact dependency-check output (no UPWARD or CYCLE):

```text
depcheck: 47 roadmaps, 537 edges, 0 problem(s)
```

Exact post-commit gate summary:

```text
gate K3BlochGroups: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
