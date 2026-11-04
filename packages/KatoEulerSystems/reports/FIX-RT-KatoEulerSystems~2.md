# FIX-RT-KatoEulerSystems~2: red-team round 2 repaired

Files edited: `packages/KatoEulerSystems/README.md`, `packages/KatoEulerSystems/sources.toml`
(Kato locator extended by Propositions 8.7 and 8.10). `Suggested.lean`, `metadata.toml` and
`design/plan.json` are unchanged: no finding touches a Lean statement, and no supplier gap is
declared or needed.

## RT-KatoEulerSystems~2a/F01 (P2) — applied

Verified: with `t = q^(a/N)ζ_N^b` the phase carries `q^(a(c−c²)/(2N))` and the unreduced
`γ(q,t^c)` carries the q-powers of its factors `1 − q^(n−ca/N)`, `0 < n < ca/N`; together with
`q^((c²−1)/12)` they give exactly `c²B₂(a/N)/2 − B₂(⟨ca/N⟩)/2` (identity checked symbolically
for non-integral and integral `ca/N`). Old: "the phase changes no cusp order" → new: the phase
contributes when `a ≠ 0`, the full factor is retained before reduction, only the residual root
of unity has order zero. The `N = 7`, `a = 0` Check is qualified; the `N = 4`, `c = 5` and
`c = 7` negative controls (`2 − 5 + 2 = −1`, `4 − 21/2 + 9/2 = −2`) are added, agreeing with 0.1.

## RT-KatoEulerSystems~2a/F02 (P1) — applied

Verified against Nakamura2023 lines 1903–1932: `c-δ_(N,n)` is defined at level N for every
`n ≥ 1` with `(c,6Nnp) = 1`, with `σ_c` in both factors, and (16) is a push-forward
compatibility for `M, n | N`. Old: "`c-δ_(N,n)(k,v)` as its push-forward to level M" → new: the
displayed level-N definition, push-forward stated as a compatibility for M and n both dividing
N, and (15) with `M, n | N` and the source/target levels named. Check added at `N = 3`,
`n = 5`, `c = 11`, `p = 7` (`(11,630) = 1`).

## RT-KatoEulerSystems~2a/F03, RT-KatoEulerSystems~2b/F03 (P2) — applied

Verified: Nakamura2023 lines 3708–3717 define `exp*_(m,r)` with the twist by r first, and
Theorem A.1 (line 3754) uses `exp*_(m,1)`. Old: "the dual exponential of the m-th
specialization lies in `S(f) ⊗ ℚ(ζ_(np^m))`" → new: the image under `exp*_(m,1)` (twist `φ_1`,
specialization, localization, `exp*`, landing in `F¹D_dR = S(f)`; the case `r = k − 1` of 5.3
at `n = 1`), with the remark that the untwisted map lands in the two-dimensional `F⁰D_dR` at
`k = 2`. The 5.1 Check and the 5.4 text and Check carry the same twist.

## RT-KatoEulerSystems~2a/F04 (P2) — applied

Verified: SelmerIwasawaCohomology Conventions and §3.7 at its head define rational Iwasawa
cohomology as the integral one tensored with `ℚ_p`, with bounded denominators. Old: the
displayed equality with `lim_m H¹(…, V_E(f))` → new: `H¹_Iw(T) ⊗_O E` for a stable lattice T,
independent of T, mapping to the unrestricted inverse limit with a uniform denominator bound
and not asserted equal to it. Check added: the group-ring family `e_m = p^(−m)∑[g]` is
projection-compatible with coefficient valuations `−m`, outside `ℤ_p[[Γ]] ⊗ ℚ_p`.

## RT-KatoEulerSystems~2a/F05 (P2) — applied

Verified the internal cycle 5.1 → 5.5 → 5.3 → 5.1. Old: 5.1 proved uniqueness "through the
injectivity of the dual exponential (as in 5.5)" → new: 5.1 keeps uniqueness from the
prescribed generator values only; 5.3 no longer claims a characterization by specializations;
5.5 proves injectivity from the conductor-n interpolation of 5.1 and 4.2 (its *Needs* now
lists 5.1) and states, as a consequence, the uniqueness of katoZetaMapConductor and katoZetaMap
by their interpolation values (Nakamura, proof of Theorem A.1 through Lemma 3.4(2)). The order
is construction → interpolation → injectivity → specialization uniqueness.

## RT-KatoEulerSystems~2a/F06 (P1) — applied

Verified at PadicHodgeRegulators §9.35 (rev/1498, README lines 2653–2679): the chart identity
holds for η primitive of conductor `p^n`, `n > m(Δ)`, on the charts `B(η^(−1),N(D))` of §9.33,
on `U_D`; §9.31 says the trivial character is not supplied. Old: "for θ of conductor `p^n`" in
the supplier contract and 6.1 → new: imported only for θ in `U_D`, conductor `p^n` with
`n > m(Δ)`, inside the charts; below the threshold, at the trivial character and in (ii) the
values of `ℒ_η` are those of the big-exponential construction, no chart map applied. The
rank-one Check now carries the threshold and the `n = 0` instance (`𝔐_z(1) = d`, no chart
value).

## RT-KatoEulerSystems~2a/F07 (P2) — applied

Verified: Kato2004 line 5862 (Theorem 16.2 assumes `ord_p(α) < k − 1`) and 6.1's growth
clause (slope `< h` gives `ℋ_(h,L)`, so slope `k − 1` gives `h ≥ k`). Old: "both sides have
growth of order exactly `k − 1`" → new: neither side is placed in `ℋ_(k−1,L)` by the stated
results, the nonzero pairing of 6.2 is not established at critical slope, and interpolation
alone cannot separate a candidate from its sum with the logarithmic product of 6.5.

## RT-KatoEulerSystems~2a/F08 (P3) — applied

Verified: `id^*1 = 1` and `f^*(1^(−1)) = (f^*1)^(−1)`, so the constant-one evaluation passes
both laws. Old: "a constant-one torsion evaluation fails the first" → new: the two laws test
the pullback operation; the nonzero cusp order of the second Check rejects the constant
(order 0 against `−4`).

## RT-KatoEulerSystems~2a/F09 (P2) — applied

Verified at AutomorphicGaloisRepresentations §6.1 and §1.5 (open head, merge order 151): the
λ-factor of `V_ℓ(A_f)` is the arithmetic representation, polynomial `X² − a_ℓX + ε(ℓ)ℓ`,
preserving the `K_f`-action; in this README's convention that is `V_λ(f*)(1) ≅ Hom_E(V_λ(f),E)`.
Old: "sum of the `V_λ(f)(1)`" → new: sum of the arithmetic representations, identified as
`V_λ(f*)(1)`, equal to `V_λ(f)(1)` only for real coefficients; part (2) of blochKatoSelmer_finite
is applied to `f*` with `L(f*,χ,1)`, a factor of `L(A,χ,1)`. The cubic-twist Check (level 11,
`θ(2) = ζ₃`, `p = 5`: determinants `2ζ₃²` against `2ζ₃`) is added; the EllipticCurveModularity
contract notes `f = f*` there.

## RT-KatoEulerSystems~2b/F01 (P3) — applied

Verified at AdelicImagesAndModularCurves rev/1727 lines 407 and 1217 (Layer 4 plans the
theorem over number fields; not in the merge order). Scope bullet reworded to "the case over
ℚ ... as a corollary of 4.1 and modularity ... the theorem over number fields with its
Lie-algebra proof is not planned here"; Downstream consumers names that roadmap's Layer 4 with
`K = ℚ` being 4.7. No Lean change; depcheck remains clean.

## RT-KatoEulerSystems~2b/F02 (P2) — applied

Verified the witness: for the weight-three CM form g of level 7, `p = 3` inert gives
`a_3 = 0`, `χ_(−7)(3) = −1`, so the removed factor is `1 − 3^(2−2s)`, zero at `s = 1`. Old:
"for `k ≥ 3` and χ ramified at p the value at `r = 1` is nonzero" → new: the claim for `p ∤ N`
and χ of conductor `p^a` (`f* ⊗ χ` new at p with `a_p = 0`, `L_({p}) = L(f* ⊗ χ,1)`, functional
equation to `L(f ⊗ χ^(−1),k−1)` with `k − 1 ≥ (k+1)/2`), and no claim when `p | N`; the
level-63 example is a negative-control Check. No target consumed the old sentence.

## RT-KatoEulerSystems~2b/F04 (P3) — applied

Verified at Nakamura2023 lines 3814–3817 and 3840–3852. Old: text with `(2πi)^(1−k)γ` against a
Check with `γ^±` → new: γ′ is the image of `γ ∈ V′_F` under the Betti form of `V′(1−k) ≃ V(f*)`
(coordinates multiplied by `(2πi)^(1−k)` relative to the untwisted comparison), Nakamura's
`γ^±` is `γ′^±`, and the edge value is written once as `L_({p},n)(f,χ,k−1)·γ′^±`, in the text
and in the Check (which now says `2πi ≠ 0`).

## RT-KatoEulerSystems~2b/F05 (P3) — applied

Verified: PadicFamilies §4.0.1 at its head names the new-prime norm factor and the repeated
p-level identity only; Kato2004 lines 2715–2724 (Proposition 8.12, `S′ = S`) cover a repeated
prime `ℓ ≠ p`, through 8.10 and 8.7. Old: "this is `modularZeta_norm` and `modularZeta_trace`"
→ new: `modularZeta_norm` for `ℓ ∤ m`; for `ℓ | m` the identity transfer of 1.1 carried through
the moment, with `modularZeta_trace` for `ℓ = p`; both Kato 8.12. "1.1" added to the *Needs*
of 2.1; the `m = 45`, `ℓ = 5`, `p = 3` instance added as a Check; Kato 8.7 and 8.10 locators
added to References and `sources.toml`.

## RT-KatoEulerSystems~2b/F06 (P3) — applied differently

The definition now has three new Checks: the exponent exchange (`c³` against c at `k = 4`,
`j = 1`, invariant only at `j = k/2`), the identity push-forward at `N = M`, `n = 1` with
`c-δ_(N,1) = c-δ_N`, and the scalar `(c² − c^(k−j))(c² − c^j) = 400` on a level-one pullback at
`k = 2`, `c = 5`, agreeing with the factor 20 of 3.3 against `24²`. The proposed complex-conjugation
Check `ι^*δ = −δ` was not added: Kato 2.7 (Kato2004 lines 471–475) defines δ and 2.6 uses
`δ^− = ½(δ − ι^*δ)`, which shows `ι^*δ ≠ δ` but fixes no sign, and the cached text states none;
a Check pinning a sign the sources do not state would be a new unsourced claim.

## Checks run

- Worker's check on the first submission: two warnings that `Suggested.lean` imports `Mathlib`
  from a package designed for the module system, suggesting `module` at the start of the file.
  Repaired in place: the file now begins with `module`, and its four imports (`Mathlib` and the
  three `TauCeti.*` modules) are `public import` lines, the form the gate's import rule accepts
  and that a roadmap on main (CoboundaryExpansion) already uses. The four declarations, their
  docstrings and the module docstring are untouched; the three Tau Ceti modules imported are
  themselves module-system files at the pin, so the public imports resolve.
- `lake env lean …/packages/KatoEulerSystems/Suggested.lean` from the content checkout, after
  the header change: exit 0, three `declaration uses 'sorry'` warnings (lines 49, 66, 90), no
  errors and no module-system warning; the three Tau Ceti object files were present at the pin.
- Signature check, rerun after the header change: a scratch copy of the file with
  `#check @name` for each of the four declarations elaborated (exit 0); the elaborated types
  are unchanged and carry every binder of the source
  (`W`, `[W.IsElliptic]`, `[DecidableEq (AlgebraicClosure ℚ)]`, `hW`; `m`, `1 ≤ m`; `K` with
  `Field`, `DecidableEq`, `Algebra ℚ K`; `NeZero m`, `IsCyclotomicExtension {m} ℚ K`, `χ`, `F`,
  `hF`, `hcont`, `hne`) and agree with the README statements of 4.7 and 7.9, which this round
  did not change.
- Dependency check, verbatim, rerun after the header change:
  `depcheck: 207 roadmaps, 1699 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line.
- No gate failures beyond the two module-system warnings were listed for this round.

## Adversarial pass on the new and changed text

| Statement | Instances tried | Values computed | Result / change |
|---|---|---|---|
| 0.3 phase and γ-factor exponent identity | `N=4,a=2,c=5`; `c=7`; `N=7,a=0,c=5`; general `x=ca/N` integral and not | `2−5+2=−1` vs `25(−1/24)+1/24=−1`; `4−21/2+9/2=−2`; `a=0`: phase `ζ₇⁴`, exponent `2=25/12−1/12`; symbolic identity holds in both cases | text corrected, Checks added |
| 0.3 "dropping the phase" | `N=4` vs `N=7` | orders 16 vs −4 at `N=4`; unchanged at `N=7` | qualified to `a=0` |
| 0.1 pullback Checks vs constant one | `e(P)=1` | `id^*1=1`, `(f^*1)^(−1)=1`; order 0 vs −4 | Check reworded |
| 2.1 repeated prime `ℓ≠p` | `m=45,ℓ=5,p=3`; `ℓ=2` new | `prime(225)={3,5}`: identity; `ℓ=2`: `P_2(σ_2^(−1))` | attributed to 1.1 + moment; 8.12 with `S′=S` |
| 3.4 `c-δ_(N,n)` | `n=1`; `N=M,n=1`; `N=3,n=5,c=11,p=7`; `k=2,j=1` exchange; `k=4,j=1` exchange; level-one class `k=2,c=5`; zero class | `σ_c=1` gives `c-δ_N`; identity push-forward; `(11,630)=1`, `5∤3`; `k−j=j=1` invariant; `c³` vs c; `(25−5)²=400` vs `24²=576`; 0 | definition at level N; four Checks |
| 3.4 (15) levels | `M,n∣N` | source N, target M; `n∤N` excluded | hypotheses stated |
| 4.2 `r=1` claim | `g` level 7 wt 3, `p=3`, `ψ` mod 3, `f=g⊗ψ`; `p∤N`, cond `p^a` | factor `1−3^(2−2s)`, value 0 at `s=1`; `a_p(f*⊗χ)=0`, `Γ(1)=1`, `k−1≥(k+1)/2 ⇔ k≥3` | claim restricted to `p∤N`; Check added |
| 5.1 carrier | `(e_m)`; integral family; `p^(−a)`·integral; two lattices | valuations `−m` unbounded; admitted; admitted; `p^aT′⊂T⊂p^(−a)T′` so same `⊗E` | bounded-denominator definition |
| 5.1 twist by one | `k=2` untwisted vs twisted; `n=1` | `F⁰D=D` dim 2 vs `F¹=S(f)` dim 1; 5.3 at `r=k−1`, twist 1 | `exp*_(m,1)` stated |
| 5.1/5.3/5.5 dependency order | edges after edit | 5.1→{3.3,4.4}; 5.3→{5.1,5.2,…}; 5.5→{4.1,4.2,4.4,5.1,5.3}; 5.6→{2.3,3.4,5.5} | acyclic |
| 5.4 twist bookkeeping | `V′(1)` → `V(f*)(1)` | `−k+1=1−k`; `V′(1−k)≃V(f*)` so `V′(2−k)=V(f*)(1)` | composite twist stated |
| 5.4 edge value | `γ′^±≠0`, `L≠0` | product nonzero, `2πi≠0`; zero construction gives 0 | one formula in text and Check |
| 5.5 corollary | admissible `(f,λ)` | injectivity of `(exp*_(m,1))_m` is Nakamura proof of A.1 (lines 3762–3767) | uniqueness moved here |
| 6.1 chart domain | `n>m(Δ)`; `n=0` | `2^(−n)d` on admitted strata; `𝔐_z(1)=d`, no chart value | domain restricted |
| 6.4 critical slope | `v_p(α)=k−1` | 16.2 needs `<k−1`; 6.1 gives `h≥k`; 6.5 product: 0 at `s=4`, `−log₃4` at `s=1` (`p=3,k=2`) | exact-growth claim removed |
| 7.9 Tate-module factor | `f=g⊗θ`, `θ(2)=ζ₃`, `p=5`; rational f | `V(f*)(1)`: trace `−2ζ₃`, det `2ζ₃²` = arithmetic factor; `V(f)(1)`: trace `−2ζ₃²`, det `2ζ₃`; `f=f*` agree | constituents are `V_λ(f*)(1)` |
| 7.9 admissibility of `f*` over K | `G_(K(μ_(p^∞)))` | `κ^(1−k)` trivial there, contragredient keeps fixed dimension | clause added |
| 7.9 `L(f*,χ,1)` in `L(A,χ,1)` | `f*=f^c` | complex conjugation on `K_f` is a Galois conjugate | clause added |

## Notes for the maintainer

- Ownership: the open-image theorem is also planned, over number fields, by
  AdelicImagesAndModularCurves (rev/1727, Layer 4), which is not in the merge order and depends
  on roadmaps later than this one; its text "stated by no roadmap" is false at this head. No
  other owner was found for the objects changed here; ownership against open pull requests
  beyond the sibling checkouts the brief names was not checked.
- The four suppliers PadicFamilies, SelmerIwasawaCohomology, AutomorphicGaloisRepresentations
  and EllipticCurveModularity are open pull requests of the same author, earlier in the merge
  order; their heads were read for this round.
- The resolver's only lead, `ClassicalAlgebraic.finiteTrace`, is a planned name of
  EtaleCohomologyFoundations §0.8 on main, not a library declaration; no change.
- No name cited by other roadmaps changed. No source was requested; no `needs-references.toml`
  entry was added.
