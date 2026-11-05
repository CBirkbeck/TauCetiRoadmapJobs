# FIX-RT-HeckeStacksAndLocalShtukasPartII~2: red-team round 2 repaired

Six findings from two red-team passes (2a: F01–F04; 2b: F01–F02). All six hold against the sources and the
supplier heads and were applied; none was disputed or found not actionable. Files changed:
`packages/HeckeStacksAndLocalShtukasPartII/README.md`, `.../sources.toml` (two sources added) and
`.../design/plan.json` (section labels of ten gaps only). `Suggested.lean` is unchanged: the new target is a
Layer 4 input about Iwahori root subgroups and is not statable at the pins, which the module docstring's
"Newton-stratified Iwahori cells" item already covers.

## RT-HeckeStacksAndLocalShtukasPartII~2a/F01 (P1) — applied

Verified: mv20 line 306–309 obtains a straight y_b and separately invokes Nie's theorem to make it
P-fundamental; lines 350–357 and Theorem 3.10 (line 358–362) use y⁻¹Iσ⁻¹(N̄)y ⊆ IN̄ and the quotient of
dimension ℓ(y_b) = ⟨2ρ,ν⟩ (line 374–375). Neither BunGAndNewtonStrata §1.10 (straight classification) nor
gap:straight-finite-parabolic (finite-parabolic minimality) states the subgroup conditions.

Old → new: §4.3 now opens with an owned target "fundamental representatives": for a σ-straight y with
[ẏ]=[b], the parabolic P_y=M_yN_y of ν_y, φ_y=Ad(ẏ)∘σ, the conditions φ_y(I_M)=I_M, φ_y(I_N)⊆I_N,
φ_y⁻¹(I_N̄)⊆I_N̄, their contraction into every congruence kernel, and dim I_N̄/φ_y⁻¹(I_N̄)=ℓ(y)=⟨2ρ,ν_b⟩,
with route, API, four Checks and a split Needs line; the comparison route and Needs cite it instead of the
gap. Sources added: nie15 (Theorem 1.3, line 99–102; proof line 414–430 gives P_{ν}-fundamentality) and
ghkr10 (Definition 13.1.2, line 1667–1669; Proposition 13.1.3(3), line 1683).

## RT-HeckeStacksAndLocalShtukasPartII~2a/F02 (P1) — applied

Verified: the §7.2 route "extract a Levi σ-class" is the surjectivity of ghn15 Theorem 3.3.1 (line 409–415),
which was the target of §7.5, whose Needs named §7.2.

Old → new: the twisted-product map, its surjectivity, strict-case injectivity and fibre σ-conjugacy move into
§7.1 (retitled "… and the twisted-product comparison") with their own route, API, three Checks and Needs
(RG2.1 root filtrations, RG2.3 Lang). §7.2's route now derives the obstruction from that surjectivity and the
Levi κ computation. §7.5 keeps the all-classes image cover, cites §7.1, and its API/Checks were trimmed to the
Levi-class statements. Layer 7 dependencies updated.

## RT-HeckeStacksAndLocalShtukasPartII~2a/F03 (P2) — applied

Verified: the Scope excluded "formal-completion and local-model comparisons" while §4.3 constructs the
completed-cell/ADLV product comparison (mv20 line 358–365).

Old → new: the Scope now says the completion of a bounded Iwahori-cell model at a Newton-stratum point and
its finite surjective comparison with the ADLV product is a dimension input owned by §4.3, and that the
exclusions concern integral local-shtuka deformation spaces and their formal-completion/local-model
comparisons. The remaining exclusions are unchanged.

## RT-HeckeStacksAndLocalShtukasPartII~2a/F04 (P3) — applied

Verified: the three §6.2 bullets restated the fibre bounds without computing anything.

Old → new: replaced by three computed Checks (the y=1 bullet kept): the A₁ example (ℓB=0, so the forgotten
flag is determined; N₁=(0+2−2)/2=0, N₂=0), the unitary A₂ example (lengths 1,1,1,2,1; ℓw₁=2,
ℓ(x′y′t^γ)=3; N₁=0, N₂=1; a half in N₂ would give 1/2; §6.4's virtual dimensions 3 and 2 differ by 1), and
the σ-twisted terminal labels (s₁,t^(ω₂∨)) versus (s₂,t^(ω₁∨)). I state honestly that the half in N₁ is
not tested by these examples, since its numerator vanishes in both.

## RT-HeckeStacksAndLocalShtukasPartII~2b/F01 (P3) — applied

Verified at the BunGAndNewtonStrata head (`roadmaps show`): Layer 0 has §§0.2, 0.6–0.9; Layer 1 jumps from
§1.20 to §1.22; its Scope and Layer 1 preamble say the Newton order is supplied by
VStackSheavesAndLisseCategories §VS4.0, whose "Newton geometry" paragraph defines the order by equal
Kottwitz invariant and Newton dominance. VStackSheavesAndLisseCategories is earlier in the merge order.

Old → new: every "BunGAndNewtonStrata §1.21/Layer 1, partial-order-on-B-of-G" (eight places) →
"VStackSheavesAndLisseCategories §VS4.0, Newton geometry"; Scope and the BunG contract cite §0.6 and §0.8
instead of §§0.5–0.6; a new supplier subsection "From TauCetiRoadmap.VStackSheavesAndLisseCategories" with
a GL₂ witness; the three Newton gaps' `section` in `plan.json` → "§1.8 (…)".

## RT-HeckeStacksAndLocalShtukasPartII~2b/F02 (P3) — applied

Verified at the RootSystemsPartII open head: Layer 1 is "integral dominance and the Stembridge step" with
§1.1 "Integral root dominance"; no label RS2.1 or integral-order exists.

Old → new: "RootSystemsPartII RS2.1" → "RootSystemsPartII §1.1" at the seven README places (contract line
now names "§1.1, Integral root dominance"); the seven RootSystemsPartII gaps' `section` in `plan.json` →
"§1.1 (…)". The gaps themselves are unchanged.

## Checks run

Elaboration of `Suggested.lean` (from the content checkout, `lake env lean`): exit 0, only the two
expected `declaration uses sorry` warnings (lines 122, 132). A scratch copy with `#check @name` for all
seven declarations elaborated with exit 0; the seven elaborated types agree with `scratch/signatures.md`
and with the README statements (§§2.1–2.5): no binder lost. The only change to the Lean file in this
round is its header: the worker's build warned that a plain `import Mathlib` bypasses the module system,
so the file now opens with `module` and `public import Mathlib` and wraps its declarations in an
`@[expose] public section`; no declaration, docstring or statement changed.

Dependency check, exact output:

```text
depcheck: 236 roadmaps, 2158 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. `roadmaps resolve` on the README after the edits: no cross-roadmap citation
and no Lean name found nowhere (the two leads of the worker's `citations.md`, RS2.1 and §0.5, are gone).

## Adversarial pass on the new and changed statements

| Statement | Instances tried | Values | Result / change |
|---|---|---|---|
| §4.3 fundamental representative, inclusions and dimension | GL₂, y=diag(ϖ,1), base alcove with α-values (−1,0): I_N=U_α(ϖO), I_N̄=U_(−α)(O) | φ_y(I_N)=U_α(ϖ²O)⊆I_N; φ_y⁻¹(I_N̄)=U_(−α)(ϖO); quotient O/ϖO, dim 1=ℓ(y)=⟨(1,−1),(1,0)⟩; diag(ϖ²,1) gives 2 | holds; recorded as Check |
| same, dependence of P_y on y | t^(0,1)=diag(1,ϖ), same class | N_y=U_(−α), quotient U_α(ϖO)/U_α(ϖ²O), dim 1 | parabolic depends on y, dimension on [b]; Check |
| same, basic and degenerate case | GL₂ κ=1 basic τ (length 0); trivial group | M_y=G, N_y=1, quotient a point, 0=⟨2ρ,(1/2,1/2)⟩; trivial group gives all three equalities on the trivial subgroup | holds |
| same, non-straight representative | s∈[1] in GL₂ | Ad(ṡ)σ(I)=opposite Iwahori≠I, condition fails although [s]=[1]; ℓ(1)=0=⟨2ρ,0⟩ and ℓ(s)=1≠0 | straightness required; negative-control Check |
| φ_y preserves N_y | general | ȳσ(ν_y)=ν_y gives ⟨ȳσα,ν_y⟩=⟨α,ν_y⟩ | stated in the target |
| ℓ(y)=⟨2ρ_(N_y),ν_y⟩=⟨2ρ,ν_b⟩ | GL₂ (1,0): roots of N_y={α}; (0,1): {−α} | Σ_{⟨α,ν⟩>0}⟨α,ν⟩=1 both; ⟨2ρ,(1,0)⟩=1 | holds |
| §7.1 twisted-product map | J=S; GL₂ torus; G_m over 𝔽₂ with ζ³=1; GL₂, J=∅, w=t^(1,0) | identity; 2 points → 1 point; (ζ,ζ)↦ζ·ζ·ζ^(−2)=1 while (ζ,1)↦ζ²; Ad(diag(ϖ,1))U_α(ϖO)=U_α(ϖ²O)⊆U_α(ϖO) so (∅,1,σ)-alcove, every element of IẇI σ-conjugate under I to diag of valuation (1,0) | holds; three Checks |
| §7.2 route from surjectivity | GL₂, M=T, slopes (1,0) | g⁻¹bσ(g)=imσ(i)⁻¹, m diagonal of valuation (1,0): the torus class (1,0) matches κ_T=(1,0); (0,1) does not | no cycle: §7.2 needs §7.1 only, §7.5 needs §7.1, §7.2 |
| §6.2 Checks | A₁ x=y=s, λ=2ω∨; unitary A₂ x=y=s₁, λ=ρ∨ | N₁=0,N₂=0; N₁=(1+2−3)/2=0, N₂=1+1−1=1; d_w−d_(at^γ)=3−2=1=N₁+N₂ | agree with §§5.2, 6.4 |
| VS4.0 contract witness | GL₂ κ=1 | (1/2,1/2)≤(1,0); (2,−1)−(1,0)=α∨≥0 so (2,−1) is above, not below | holds |
| Scope sentence on completions | §4.3's comparison | the completed cell model is the source of mv20 Theorem 3.10 | consistent |

## Notes for the maintainer

- RootSystemsPartII's open head states in its Scope that dominant subtraction, affine Bruhat/Demazure theory
  and twisted Newton reduction are not part of that roadmap. The six affine/root gaps still name it as
  supplier (now on §1.1); whether they should be re-homed to a continuation of RootSystemsPartII is a
  merge-order decision outside this package.
- VStackSheavesAndLisseCategories is a new supplier of this roadmap (§VS4.0 only); it precedes this roadmap
  in the merge order, and the dependency check is clean.
- gap:straight-finite-parabolic remains in use by §1.2 only; §4.3 no longer cites it.
- Two sources were added to `sources.toml`: ghkr10 (arXiv 0805.0045v4) and nie15 (arXiv 1310.2229v2), both
  certified open-repository texts. A first fetch of nie15 against a wrong arXiv id recorded an unrelated paper;
  that entry was removed before the correct one was recorded, so the key nie15 names one work.
- Ownership against open pull requests was checked through `roadmaps grep`/`show` at the index of
  2026-11-05 for the P-fundamental representative. The only related object is
  IgusaVarietiesAndTorsionConcentration §§0.18a–0.18b, which uses Nie's Proposition 1.5, Theorem 1.4 and
  Corollary 1.6 to pick a fundamental element in a minuscule p-adic PEL double coset; it does not state
  P-fundamentality of straight elements, the contraction of the Iwahori root subgroups or the dimension of
  the unipotent quotient, so the Layer 4 target is owned here.
