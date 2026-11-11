# Review of StableReductionPartII (pull request #1841 at d9f5c36)

**Verdict:** needs changes

## R01 (P3) — The Edidin–Graham comparison is built by flat pullback, but the text runs the map the opposite way

**Location:** `TauCetiRoadmap/StableReductionPartII/README.md` line 6590 (§5.15): "flat pullback to the mixed spaces of EquivariantIntersectionTheory §2.1 gives, for every i, an isomorphism `A^G_i(X)⊗Q≅A_{i−d}([X/G])_ℚ` onto the rational Chow groups of VirtualFundamentalClass §2.1".

**Claim:** Flat pullback along the smooth representable morphism `X×^G U→[X/G]` goes from `A_{i−d}([X/G])_ℚ` (VirtualFundamentalClass §2.1) to `A^G_i(X)⊗Q`. The words "onto the rational Chow groups" make the stack groups the target, so the text gives the map it constructs the wrong source and target.

**Witness:** mc5-edidingraham1997 line 1075 (proof of Proposition 15, p. 28): flat pullback goes from `A*([X/G])_Q` to `A*((X×U)/G)_Q`. For G=μ₂ acting on a point, it sends `[Bμ₂]` to `[U/μ₂]`, which generates `A^{μ₂}_0(pt)⊗Q`.

**Repair:** Replace the quoted clause with: "flat pullback along the smooth morphisms `X×^G U→[X/G]` from the mixed spaces of EquivariantIntersectionTheory §2.1 gives, for every i, an isomorphism `A_{i−d}([X/G])_ℚ→A^G_i(X)⊗Q` from the rational Chow groups of VirtualFundamentalClass §2.1". Tested on 𝔾_m acting on 𝔸²∖0 with weights 1 and 2, where d=1 and [X/G]=ℙ(1,2). The equivariant ring is `ℤ[t]/(2t²)`.
- For i=2 the map sends `[ℙ(1,2)]` to 1 in `A⁰_{𝔾_m}`.
- For i=1 it sends `A_0(ℙ(1,2))_ℚ=ℚ` isomorphically onto `ℚt`.
- For i=0 the source `A_{−1}(ℙ(1,2))_ℚ` is 0, and so is `A²_{𝔾_m}(X)⊗Q=(ℤ/2)⊗Q`.

## Previous findings

- R01 — repaired: §5.15 now reads "EquivariantIntersectionTheory §§1.4 and 2.4 give the integral isomorphism `c₁:Pic(M̄_g/C)→A¹_{PGL(5g−5)}(U_g)`" and states the rational Edidin–Graham comparison. §5.18 reads "The isomorphism c₁:Pic(M̄_g/C)⊗Q→CH¹(M̄_g/C;Q) of §5.15 is injective". §5.18 depends on EIT only through §5.15, which its *Needs:* line cites.
- R02 — repaired: there are new `### From TauCetiRoadmap.VirtualFundamentalClass` and `### From TauCetiRoadmap.EquivariantIntersectionTheory` subsections and a Scope bullet (line 17). *Needs:* lines now cite "VirtualFundamentalClass §§2.1–2.3", and Layer 5 Dependencies end "VirtualFundamentalClass §§2.1–2.3; EquivariantIntersectionTheory §§1.4, 2.1, 2.2, 2.4".
- R03 — repaired: §5.16 now reads "Prove also Grothendieck–Riemann–Roch for the universal curve f:C_g→M̄_g/C … `ch(f_*ω_f)−ch(R¹f_*ω_f)=f_*(ch(ω_f)·td(T_f))`", with its codimension-0 and codimension-1 parts. Its *Needs:* line adds EIT §2.1 and §1.11.
- R04 — repaired: the description now reads "In an open pull request by another author: #1996 (VirtualFundamentalClass §§2.1–2.3, rational Chow groups of Deligne–Mumford stacks)". The summary now places rational Chow groups with VirtualFundamentalClass and equivariant Chow and Picard groups with EquivariantIntersectionTheory.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| §5.15 Edidin–Graham comparison `A^G_i(X)⊗Q≅A_{i−d}([X/G])_ℚ` | G trivial; μ₂ on a point; 𝔾_m on 𝔸²∖0 with weights (1,2) | Trivial G: `A_i(X)=A_i(X)`. μ₂: `A_0`: ℚ=ℚ; `A^{μ₂}_{−1}=ℤ/2`⊗Q=0=`A_{−1}(Bμ₂)_ℚ`. ℙ(1,2): ranks 1,1,0 for i=2,1,0 on both sides | Holds. The direction is R01 |
| Negative control: the DM/proper hypothesis | 𝔾_m acting on a point | `A^{𝔾_m}_{−1}(pt)=ℤ`, nonzero rationally. Stabilizer 𝔾_m, not DM, so excluded | The hypothesis is needed and is stated |
| §5.15 for M̄_g, c=1 | g=2, g=3 | g=2: dim U₂=27, d=24, `A^G_{26}(U₂)`↔`A_2(M̄_2)`=CH¹; rational ranks 2=2. g=3: ranks 3=3 (λ, δ₀, δ₁) | Consistent |
| §5.15 c₁ isomorphism from EIT §§1.4 and 2.4 | Bμ_r (EIT §2.4 Check) | `Pic Bμ_r=ℤ/r=A¹_{μ_r}`; ⊗Q gives 0→0=CH¹(Bμ_r)_ℚ | Integral iso becomes the rational iso |
| EIT contract: Convention 5 on U_g and its universal curve | g=2, N=5g−5=5 | Centre ζ∈μ₅ acts on O(1) by ζ⁻¹ and on O(5) by ζ⁻⁵=1. O(1) itself is not PGL₅-linearised | The power N is needed and suffices |
| EIT contract: proper action | M̄_g/C separated | The diagonal of [U_g/G] pulls back to `G×U_g→U_g×U_g`, so it is proper. Stabilizers finite reduced over C, so DM | Prop. 14 hypothesis met |
| §5.16 GRR, codimension 0 | g=2, g=3 | rank: 2−1=1 and 3−1=2; `f_*(c₁ω)/2`=(2g−2)/2=1 and 2 | Holds |
| §5.16 GRR, codimension 1 | Quartic Lefschetz pencil Bl₁₆ℙ²→ℙ¹, g=3; isotrivial C×B | λ=3. κ=(K+2F)²=−7+16=9; c₂(T_f)=e(S)+2K·F=19+8=27; f_*td₂=(9+27)/12=3. Isotrivial: 0=0 | λ=f_*td₂(T_f) holds |
| §5.16 `c₁(T_f)=−c₁(ω_f)` | Fibre degree; the pencil | Fibre: 2−2g=−(2g−2). Pencil: c₁(T_f)=−K_S−2F=−c₁(ω_f) | Holds |
| §5.16 route via SchemeAndStackFoundations §5.8 | Projection formula on smooth Y | `ch(f_!α)td(T_Y)=f_*(chα·td T_X)` equals `f_*(chα·td T_f)·td(T_Y)`. td(T_Y) is a unit, so the README form follows | Supplied form suffices |
| §5.18 injectivity and torsion | Bμ_r; quartic pencil | Kernel of `Pic→Pic⊗Q` is the torsion ℤ/r. c₁(N)=36−9−27=0 | Consistent |
| VFC contract (§§2.1–2.3 at 676f128) | Its Check deg BG=1/m; M̄_g/C | §2.1 has `A^c=A_{n−c}`; §2.2 has flat pullback, proper pushforward and the projection formula with c₁; §2.3 has Whitney and pullback | Every stated item is present |

Rows for statements the diff does not touch (§§2.146, 2.147, 2.237, the five Lean headlines and the rest) stand as in the previous review, of 5f91589.

- **Gate:** re-run at d9f5c36. Every check is 0 and the result is OK. The worker's `gate.md` agrees, with build=0. The diff since 5f91589 touches only `README.md` (20+/15−), and `git diff origin/main...HEAD` outside the folder is empty.
- **Dependency check:** `depcheck: 226 roadmaps, 2051 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. Neither VirtualFundamentalClass nor EquivariantIntersectionTheory, which is on main, names this roadmap as a supplier.
- **Elaboration:** `lake env lean` on `TauCetiRoadmap/StableReductionPartII/Suggested.lean` exits 0 with exactly five `declaration uses sorry` warnings (lines 122, 139, 148, 155, 171). The file is byte-identical to 5f91589, so the signature comparison and the padding probe stand.
- **Source locators:** 6 checked. In mc5-edidingraham1997: Corollary 1 (line 322, p. 9), Proposition 14 (line 1059, p. 28), the proof of Proposition 15 (line 1075), Propositions 16 and 18 (lines 1081, 1122). In mumford1977: Theorem 5.10 proof, (5.12)–(5.13) (lines 2101–2128).
- **Cross-roadmap citations:** 12 resolved. VirtualFundamentalClass §§2.1, 2.2, 2.3, its Scope and its Conventions, at 676f128. EquivariantIntersectionTheory §§1.4, 2.1, 2.2, 2.4 and Conventions 1 and 5, on main 5772e23. SchemeAndStackFoundations §5.8 on main. Internal §§1.11 and 1.13. Design `plan.json` and the README now both declare the same 27 gap slugs.
- **Ownership of the new comparison:** `roadmaps grep` finds the Edidin–Graham comparison only here. EquivariantIntersectionTheory has no rational comparison with Vistoli's groups. Board package VirtualFundamentalClasses §6.2 states it, but sits at ORDER line 403, after this roadmap (line 319), so it should cite §5.15.
- **Seeded sample:** none of the 15 seeded targets lies in or depends on the changed passages. Only §§5.18–5.19 cite §5.16, and only §5.16 cites §5.15.
- **Remarks on untouched text (no change asked):** the Layer 5 Dependencies line still says SchemeAndStackFoundations "§§5.1–5.8", while §§5.15–5.16 cite §§5.1–5.10. `C_g` also names the universal curve over M_g[N] (lines 6769, 7104).

## Not verifiable

- VirtualFundamentalClass is not among the sibling checkouts. It was read with `roadmaps show` at head 676f128 (index of 2026-11-11T13:03:48Z).
- `blr-relative-picard-LwkQQl` and `mc6-fc1990`: settled as uncertified, and outside the changed passages.

## Source issues

- **Misprint** in mc5-edidingraham1997 at Proposition 16, proof, p. 28: the source gives the second mixed space as X ×^H U₂; it should be Y ×^H U₂; affects nothing.
