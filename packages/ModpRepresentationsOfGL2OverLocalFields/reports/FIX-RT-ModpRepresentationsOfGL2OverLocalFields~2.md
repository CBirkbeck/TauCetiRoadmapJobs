# FIX-RT-ModpRepresentationsOfGL2OverLocalFields~2

Repair of red-team round 2 (reviews `~2a` and `~2b`) on `packages/ModpRepresentationsOfGL2OverLocalFields`.
Each finding was checked against the cached sources (HU12, SHOTTON20, EMERTON1, EMERTON2, BDJ10),
the supplier roadmaps (SmoothRepresentationsOfLocalGroups on main; NoncommutativeAndEquivariantIwasawa
and PadicLocalLanglandsForGL2Qp through `roadmaps show`) and the pinned Mathlib. All six findings
hold and are applied; no two of them overlap. Files changed: `README.md`, `sources.toml` (locators
only, no new key). `Suggested.lean`, `metadata.toml` and `design/plan.json` are unchanged; no
supplier gap was added.

## RT-ModpRepresentationsOfGL2OverLocalFields~2a/F01 (P1) — applied

Evidence: HU12 line 200 (`[g,v]` supported on `KZg⁻¹`); SR *compact-induction* (right translation);
`s·wP⁺KZ = diag(ϖ,1)P⁺KZ ⊆ P⁺KZ`, so the old criterion gave `Δ(k,k) = 0`.

Change (§0.8): supports "`P⁺KZ` / `wP⁺KZ`" → "`KZ(P⁺)⁻¹` / `KZ(P⁺)⁻¹w⁻¹`" (HU12, equation (3));
convention sentence for `[g,v]` added (HU12, p. 5); negative-control Check added. No other
occurrence in the README.

## RT-ModpRepresentationsOfGL2OverLocalFields~2a/F02 (P2) — applied

Evidence: in `S₃`, `g⁻¹(12)g = (13) ∉ ⟨(12)⟩`; SHOTTON20 lines 320–327 shrink the subgroup.

Change (§0.2): "crossed product given by coset representatives of `H/U`" → the rule with
`U_g = U ∩ gUg⁻¹` and product `Σ_a hag ⊗ (g⁻¹x_a g)y` (SHOTTON20, proof of Proposition 3.2). The
crossed product is kept for normal `U`. `S₃` Check added. The review's `V` is renamed `U_g`
(`V` already names representations in §0.2).

## RT-ModpRepresentationsOfGL2OverLocalFields~2b/F01 (P2) — applied

Evidence: EMERTON2 line 1166 derives `Ord_P` on the locally admissible category, with injectives from
Proposition 2.1.1; §2.1 had defined `Ord_B` only on torsion-admissible objects.

Change: §0.1 gains an API bullet (`V_{l.adm}`, abelian category, right adjoint, enough injectives via
SR.0d.1) and a Check. In §2.1, "On torsion-admissible" → "On smooth torsion" (EMERTON1 3.2.4,
3.3.3). §2.2 now defines `R¹Ord_B` in this category. *Needs:* lines and the SR.0d.1 contract
updated. EMERTON1 is cited in place of the review's EMERTON2 3.4.7.

## RT-ModpRepresentationsOfGL2OverLocalFields~2b/F02 (P3) — applied

Evidence: BDJ10 lines 846–890 count weights per subset only for a fixed `ξ`. The README's definition
does not order the two characters, so `A = {0}` carries both `Sym^5` and `Sym^{11}⊗det^5`.

Change (§3.4 route): "each `A` admits at most one weight" → "write `ρ̄|_I ≅ ξ ⊕ ξ^q` … for this
fixed `ξ` each `A` admits at most one weight". The irreducible Check now computes `A={0}`
(`r=5`, `b≡0`) and `A={1}` (`r=11`, `b≡5 (16)`).

## RT-ModpRepresentationsOfGL2OverLocalFields~2b/F03 (P3) — applied

Evidence: for `p=5`, `f=2`, the exponents `±1, ±5, ±2, ±10, ±6, ±4` modulo 24 are twelve distinct
classes. A collision needs a nonzero `c` with `|c|₁ ≤ 4` and `|Σcᵢpⁱ| ≤ 4p^{f−1} < q−1` unless `q=5`.

Change: "`p > 5`" → "`q ≠ 5`" in §5.1 (route added) and in the Conventions; a `p=5`, `f=2` Check was
added. In §7.5, "`p = 5` collision" → "`q = 5` collision".

## RT-ModpRepresentationsOfGL2OverLocalFields~2b/F04 (P3) — applied

Evidence: NoncommutativeAndEquivariantIwasawa §0.13, read at its head, states only `H*(U,𝔽_p) ≅ ∧*H¹`
with `dim H¹ = d`. Nothing in it is `K`-equivariant, and it does not mention the Frattini quotient.

Change: §5.6 now proves, for `p>2`, `K₁/K₂Z₁ ≅ M₂(k_F)/k_F ≅ sl₂(k_F)` (`K`-equivariant, inverse
`exp(p·)`), hence `H¹(K₁/Z₁,k) ≅ ⊕A_i^*`; §0.13 is cited for the dimension only. A Check for `Z₁`
and `p=2` was added. §8.1 *Needs:* "§0.13 (Frattini)" → "§5.6".

## Checks run

- **Elaboration.** `lake env lean packages/ModpRepresentationsOfGL2OverLocalFields/Suggested.lean`,
  run from the content checkout: exit 0. The only output is seven `declaration uses 'sorry'`
  warnings (lines 104, 121, 133, 151, 166, 180, 202). No `TauCeti.*` import, so nothing to build.
- **Signatures.** A scratch file of `#check @name` for all 12 declarations elaborated with exit 0.
  Every elaborated type is identical to the one in `signatures.md` and matches its README statement:
  - The local-field theorems carry `F, L`, `IsNonarchimedeanLocalField`, `CharZero` and both residue
    `CharP p` explicitly.
  - The `ℚ_p` theorems carry `k : Type` finite of characteristic `p`.
  - `exists_coind_approximation_of_lattice` keeps `hF`, `CompleteSpace E`, joint continuity and
    `IsModuleTopology`.

  No binder was lost. The Lean file is unchanged this round.
- **Dependency check.** It reports no UPWARD, CYCLE or `moved:` line:

      depcheck: 239 roadmaps, 2174 edges, 0 problem(s)

- **Citations.** `roadmaps resolve packages/ModpRepresentationsOfGL2OverLocalFields/README.md`
  finds no cross-roadmap citation and no Lean name that is missing anywhere.
- **Form.** `sources.toml` parses as TOML. The added README text has no LaTeX delimiters, no process
  wording and no line longer than 104 characters.

## Adversarial pass on changed and added statements

| Statement | Instances tried | Values computed | Result / change |
| --- | --- | --- | --- |
| §0.8 convention `h·[g,v] = [hg,v]` | `h ∈ KZ`, `g = 1`; `h = w` | `(h·[g,v])(x)=[g,v](xh)` ≠ 0 iff `x ∈ KZ(hg)⁻¹`, value at `(hg)⁻¹` is `v`; `[h,v]=[1,hv]` for `h∈KZ` | holds; matches `g ⊗ v` of SR *compact-induction* (`f ↦ Σ g⊗f(g⁻¹)`) |
| §0.8 support criterion | identity presentation of `c-Ind W`; augmentation, `W = k` | inverted cells `KZ(P⁺)⁻¹`, `KZ(P⁺)⁻¹w⁻¹` are disjoint and cover `G` (invert HU12 (3)): `Δ = 0` on the identity; `[1,1] ↦ 1`, `[w,1] ↦ w·1 = 1`: `Δ = k` | agrees with the two existing Checks |
| §0.8 negative control | `s=(0 1;1 0)`, `w=(0 1;ϖ 0)` | `sw = (ϖ 0;0 1) ∈ P⁺`, `diag(ϖ,1)P⁺ ⊆ P⁺`; `f(x) = s⁻¹f(sx) = 0` on `wP⁺KZ` | old criterion gives `Δ(k,k)=0≠k`; Check added |
| §0.2 multiplication rule | `S₃`, `U=⟨(12)⟩`, `g=(123)`; `ℤ_p⋊C₂`, `U=ℤ_p`; `H=1` | `gUg⁻¹=⟨(23)⟩`, `U_g=1`, `x_{(12)}=1`: `(12)(123)=(23)`, which equals the product in `𝒪[S₃]`; `g⁻¹(12)g=(13)∉U`; normal `U`: `U_g=U`, `(1⊗T)(s⊗1)=s⊗([−1]−1)`, so `sTs⁻¹=[−1]−1`; `H=1`: `𝒪` | consistent with the existing Checks (`[(12)][(23)]=[(123)]`, same composition order) |
| §0.2 `g⁻¹U_g g ⊆ U` | general `g` | `g⁻¹(U∩gUg⁻¹)g = g⁻¹Ug ∩ U` | holds for every compact open `U` |
| §0.1 `V_{l.adm}` | `V=0`; `H` trivial; `H` compact; `H=ℚ_p`, `V=k[ℚ_p/ℤ_p]` | `0`; `V_tors` (finite `𝒪v`); `V_tors` (finite orbit × finite `𝒪v`); translates with disjoint supports are independent and `ℤ_p`-fixed, so invariants are infinite-dimensional and `V_{l.adm}=0` | Check added; quotient closure uses the layer's `p`-adic Lie hypothesis |
| §0.1 enough injectives | `V` locally admissible, `I` a smooth injective (SR.0d.1) | `V = V_{l.adm} ↪ I_{l.adm}`; `Hom(W, I_{l.adm}) = Hom(W, I)` for `W` locally admissible, and the inclusion is exact | `I_{l.adm}` is injective in the locally admissible category |
| §2.1 `Ord_B` on smooth torsion | `V = χ∘det`; `V = Ind_{B̄}^G U`; a union `V = ⋃V_n` of torsion-admissible `V_n` | `q^m χ(det t) = 0` gives `Ord_B=0`; unit `U ≅ Ord_B Ind U`; `Ord_B(⋃V_n) = ⋃Ord_B(V_n)` (EMERTON1 3.2.4), each torsion-admissible (3.3.3) | the old values are unchanged on torsion-admissible objects; local admissibility is preserved |
| §2.2 `R¹Ord_B` | `0→V→J→J/V→0`, `J` injective in the locally admissible category | `R¹Ord_B(J)=0` gives `R¹Ord_B(V)=coker(Ord_B J → Ord_B(J/V))`; Steinberg Check `0→0→χ⊗χ→Ord_B(St⊗χ∘det)→R¹Ord_B(χ∘det)=0` | unchanged; all inputs are admissible, hence locally admissible |
| §3.4 route, irreducible case | `p=17`, `f=1`, `ξ=ω₂^6` | `A={0}`: `r+1+18b≡6 (288)` gives `r=5`, `b≡0 (16)`; `A={1}`: `17(r+1)+18b≡6` gives `r+1≡12 (18)`, `r=11`, `b≡5 (16)` | two weights, one per `A`, `≤ 2^f = 2`; agrees with the Check and with §3.5 |
| §3.4 complement rule | `A ⊆ ℤ/2f`, `r` `f`-periodic | `Σ_{i∉A}(r_i+1)pⁱ ≡ q·Σ_{i∈A}(r_i+1)pⁱ (q²−1)`, and `ω_f^q = ω_f` | conjugating `ξ` replaces `A` by its complement (BDJ10 line 855) |
| §5.1 multiplicity, `q ≠ 5` | `(p,f) = (5,1), (5,2), (7,1)` | `q−1 = 4`: `2 ≡ −2`, collision; `q−1 = 24`: twelve distinct classes; `q−1 = 6`: `±1, ±2` distinct, `4·1 < 6` | `q = 5` is the only exception for `p ≥ 5`; Check added |
| §5.1 route bound | general | `p^{f−1}(p−4) > 1` iff not (`p = 5`, `f = 1`); `|cᵢ| ≤ 4 < p` means `Σcᵢpⁱ ≠ 0` for `c ≠ 0` | holds |
| §5.1 weight count | `f = 2` | `dim W_{χ,3} = 1+4f+2f² = 17`; trivial-weight monomials `1, e_if_i, h_i` give `5`; `17 − 5 = 12` nontrivial | each nonzero `d` with `|d|₁ ≤ 2` is the weight of exactly one monomial |
| §5.6 identification | `p > 2`, `X, Y ∈ M₂(𝒪_F)`; scalars; `p = 2` | `(1+pX)(1+pY) ≡ 1+p(X+Y)`; `(1+pX)^p ≡ 1+p²X (p³)`; `[1+pX,1+pY] ∈ K₂`; `1+pa ↦ a·1`; `tr(1)=2` | `K₁/K₂Z₁ ≅ M₂/k_F ≅ sl₂(k_F)`, `dim_{𝔽_p} = 3f`; for `p = 2`, `tr 1 = 0` and `sl₂ → M₂/k_F` has kernel `k_F·1`: Check added |
| §5.6 `H¹ ≅ ⊕A_i^*` | `k ⊇ σ_i(k_F)` (Conventions) | `sl₂(k_F)⊗_{𝔽_p}k = ⊕_i sl₂(k)_{σ_i} = ⊕A_i`, so `Hom_{𝔽_p}(sl₂(k_F),k) = ⊕A_i^*`, dimension `3f` | agrees with §0.13 and with the §5.6 and §8.6 dimension Checks |
| §8.1 `exp(p x̃)` | `x̃ ∈ sl₂(𝒪_F)`, `p > 2` | `exp(p x̃) ≡ 1 + p x̃ (p²)`; changing the lift by `p y` changes it inside `K₂` | well defined; inverse of the §5.6 map |

## Ownership, suppliers and maintainer notes

- **Locally admissible category.** It is now an API item of §0.1 for every `p`-adic Lie group.
  - SmoothRepresentationsOfLocalGroups *finiteness-conditions* (main) defines local admissibility
    for SR's notion of admissibility, with no category structure.
  - PadicLocalLanglandsForGL2Qp §2.1 has the `GL₂(ℚ_p)` fixed-character case.
  - `roadmaps grep` found no general owner, so this roadmap owns the general statement and imports
    only SR.0d.1.
- **Changed citations.** No section, heading or target id changed; the `MP.k` mapping table is
  untouched, so no consumer citation breaks.
  - §8.1 now cites §5.6 instead of NoncommutativeAndEquivariantIwasawa §0.13 for the Frattini
    identification.
  - §2.2 no longer lists SR.0d.1 directly; it enters through §0.1.
- **Source issues for the record.**
  - BHHMS23 Lemma 6.1.1(i) (BHHMS23 line 2901) states `p > 3`; the correct exclusion is `q = 5`.
  - BDJ10 §3.1 counts per subset only for a fixed `ξ`; this agrees with the source.
- **Ownership against open pull requests** was checked with `roadmaps grep`/`roadmaps show` at the
  open heads (PadicLocalLanglandsForGL2Qp, NoncommutativeAndEquivariantIwasawa,
  LocalGaloisDeformationRings).
- **Overlaps.** The single overlap item (the upstream pull request of this roadmap) is unchanged by
  this round.
- **Untrusted text.** Nothing in the reviews was suspicious.
