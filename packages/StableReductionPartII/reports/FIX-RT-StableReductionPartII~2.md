# FIX-RT-StableReductionPartII~2

Repair of red-team round 2 on `packages/StableReductionPartII`: pass a (RT-StableReductionPartII~2a, F01–F06) and pass b (RT-StableReductionPartII~2b, F01–F07). Overlaps are settled once: 2a/F01 with 2b/F05 (Checks), 2a/F04 with 2b/F04 (locators).

Layer 2 is renumbered because eight duplicate targets were deleted and one target moved. Section numbers in the finding sections below are the **old** numbers of the reviews unless marked "now". The old→new map:

| Old | New | Old | New |
|---|---|---|---|
| 2.0–2.30 | unchanged | 2.32–2.35 | 2.31–2.34 |
| 2.37–2.43 | 2.35–2.41 | 2.45–2.46 | 2.42–2.43 |
| 2.49–2.57 | 2.44–2.52 | 2.59–2.60 | 2.53–2.54 |
| 2.62–2.68 | 2.55–2.61 | 2.70–2.150 | 2.62–2.142 |
| 2.164 | 2.143 | 2.151–2.163 | 2.144–2.156 |
| 2.165–2.265 | 2.157–2.257 | deleted: 2.31, 2.36, 2.44, 2.47, 2.48, 2.58, 2.61, 2.69 | |

Every anchor and every prose reference to a Layer 2 section was rewritten by script; a checker found 0 broken anchors among 1619 anchor uses and 0 forward anchors inside Layer 2 (258 targets, 2.0–2.257, sequential).

## RT-StableReductionPartII~2a/F01, RT-StableReductionPartII~2b/F05 (P3) — applied

Verified: the listed Checks were identity, zero-preservation or API repeats. Changes (values recomputed, see the pass table):
- §2.14: the three Checks replaced by the ℤ→𝔽₂ (2v↦0), ℤ→ℤ/4 with s=3 (X²−9↦X²−1, c↦u′+1, the root −u′ as the excluded wrong model) and ℤ→ℤ/4→𝔽₂ (3u+2v↦u″) computations.
- §2.32 (now 2.31): C_J(ε)=(0,−u), C_J(incl)=(u,−v); the composite law at z=(1,0) with both sides (u,−v); the ℤ/4 sign check.
- §2.41 (now 2.39): λ₃([5]) and the level 3→1 square; λ₃([3])²=[1]; the non-example m=(u,v), where p⊆ι⁻¹(m) fails.
- §§2.64–2.65 (now 2.57–2.58): θ(ε⊗1)(v)=u⊗1≠0 over ℤ/2, the sign over ℤ/4, and m(u)=vε tested through θ.
- §§2.76–2.77 (now 2.68–2.69): ĩ(1/3) at levels 3 and 4 ([3], [11]); ĩ(e_A(−1)); the non-example f(1/3)=e_R(3); the level 3→2 transition on 1+2v+4v² and on (1/3)·[…].
- §2.88 (now 2.80): E_R over ℤ/4 with s=3 (multiplicativity as a computed identity), 1⊗2v=0 over 𝔽₂, the composition square.
- §2.26: API "P" corrected to the constructed p; Check "P(1,0)=(0,1)" replaced by p(u,v)=(−v,u), p∘p=−1.
- Zero-law Checks deleted in §§2.97, 2.140, 2.143, 2.174, 2.213 (now 2.89, 2.132, 2.135, 2.166, 2.205); §2.143 gets Ê_D(of(ε))(E_J(1⊗v))=u versus m_C(u), §2.174 gets the C_J(m(u)) family values, §2.213 gets the σ⊗1 and 1/3 assemblies.
- API-repeating Checks deleted in §§2.128, 2.167 (now 2.120, 2.159); §2.164 (now 2.143) gets h∘Ψ=(v,−u).

## RT-StableReductionPartII~2a/F02 (P3) — applied

Verified: §2.31 = §2.21 API bullet 1; §§2.36, 2.44, 2.47, 2.48 = §2.30 API bullets 3, 4, 1, 2. The semantic scan the review asked for (statement sentence against every API bullet, normalised) found three more: §2.58 (= §2.42 API "ε(c)=−a, ε(d)=b"), §2.61 (= §2.30 "E(b)=(C(s+γt),1)"), §2.69 (= §2.30 "E(cr)₁=…"). All eight deleted; dependents repointed to §§2.21, 2.30, 2.42 and Needs lists deduplicated. The scan also found API bullets that copy a separate target: §2.21 and §2.63 bullets "surjective"/"kernel" (targets §§2.38, 2.91, 2.131, 2.92), §§2.151–2.152 bullet 1 (= §§2.134–2.135), §2.214 bullets 4–5 and Checks 5–6 (= §§2.108, 2.149). Those bullets are removed; the targets stay.

## RT-StableReductionPartII~2a/F03 (P2) — applied

Verified: §2.151–2.152 construct native chain maps out of C(e), whose native `ChainComplex` is built only in §2.164. §2.164 now sits right after §2.150 as §2.143; §§2.144–2.145 (the augmentations) list it first in their construction-specific inputs and Needs. No forward anchor remains in Layer 2.

## RT-StableReductionPartII~2a/F04, RT-StableReductionPartII~2b/F04 (P3) — applied

Verified at the pin: `HomologicalComplex.Hom.isoOfComponents` (HomologicalComplex.lean:498) builds an isomorphism; `IsLimit.lift_self` (IsLimit.lean:95) needs an `IsLimit`. §§2.222, 2.224 (now 2.214, 2.216) drop the `isoOfComponents` clause; §§2.153, 2.155 (now 2.146, 2.148) drop the `IsLimit` clause and keep the tensor laws. The other seven `IsLimit` locators (§§2.171, 2.180, 2.199, 2.200, 2.207, 2.211, 2.217) are on targets that construct or use a native limit and fit; §2.223's `isoOfComponents` builds the Hom-cochain isomorphism and fits.

## RT-StableReductionPartII~2a/F05 (P3) — applied

Verified: with (E∨)^i=Hom(E^(1−i),R) the dual of the identity disk on M is the identity disk on M*. Witness recomputed: in ℤ[ω], ω²=ω−6, I=(2,ω), Ī=(2,1−ω), I·Ī=(2), ω²∈I² but ω²≡ω≠0 mod 2, so I²≠(2), [I] has order 3 and I≄I⁻¹≅I*. §2.235 (now 2.227) Check 1 now says "exact hull … shifted dual is the identity complex on M*; M≅M* is not asserted", and the ℤ[ω] disk is a new Check.

## RT-StableReductionPartII~2a/F06 (P2) — applied

Verified: §2.238 uses only Noetherian local rings, maximal-ideal completions, a finite module and `IsRelativelyStablyReflexive`; the carriers exist at the pin (`AdicCompletion`, `IsLocalRing.maximalIdeal`, `Module (AdicCompletion I R) (AdicCompletion I M)` at AdicCompletion/Algebra.lean:324). Added `relativelyStablyReflexive_iff_completion` to Suggested.lean: flat local A→R of Noetherian local rings, finite M, M̂ the native completion of M; conclusion `Module.Flat Â R̂ ∧ (SR_A M ↔ SR_A M̂) ∧ (SR_A M̂ ↔ SR_Â M̂)`. The Â-algebra structure on R̂ is quantified and pinned by `IsScalarTower A Â R̂` and `IsLocalHom (algebraMap Â R̂)` (a local homomorphism of Noetherian local rings is adic-continuous and A is dense in Â, so this is the continuous extension); the Â- and A-actions on M̂ are pinned by scalar towers through R̂. §2.238 (now 2.230) names the theorem, explains the pinning, says M̂ is the completion of M (≅R̂⊗_R M by the finite Noetherian equivalence) and gains three Checks (ℤ_(2) with M=R and M=R/(2); ℤ_(2)[x]_(2,x) with M=R/(x), where A-flatness holds but the fibre Ext¹ is 𝔽₂≠0 on both sides). The docstring's not-statable list no longer names the completed-local transfer.

## RT-StableReductionPartII~2b/F01 (P2) — applied

Verified at the open head of ShimuraCompactifications: no `C` sections; semi-abelian degenerations are §§6.1–6.7 with level at the boundary §6.10, Hodge semiampleness §7.13, finite generation §7.14, integral minimal compactification §7.16, ample Hodge line §7.17, characteristic-zero map §2.8. Changed: Scope ("Layers 6–7"), the contract paragraph, the gap line "(§§6.1–6.7, 7.16–7.17.)", the same `section` string on gap `minimal-siegel-all-characteristics` in `design/plan.json` (slug unchanged), the Needs of §§6.5, 6.15, 6.17, 6.18 and the Layer 6 Dependencies. `roadmaps resolve` now reports no citation found nowhere.

## RT-StableReductionPartII~2b/F02 (P2) — applied

Verified on main: SchemeAndStackFoundations §4.15 `Mbar.forget` states the identification of M̄_{g,n+1} with the universal curve (its README lines 5734–5736 and 5958). Summary, Scope bullet, §0.6 and §2.256 (now 2.248) now name that statement as the owner; §2.256 opens "This proves the identification asserted by SchemeAndStackFoundations §4.15 `Mbar.forget` (Knudsen II, Corollary 2.6)" and supplies the proof route and the coherent inverse over arbitrary schemes. Its Needs already listed §4.15.

## RT-StableReductionPartII~2b/F03 (P3) — applied

Verified at the open head of JacobianChallengePartII: §7.1 "Jacobian of a curve family with full level" is stated for any Noetherian ℤ[1/ℓ,ζ_ℓ]-scheme with a smooth projective curve and full symplectic level, Needs §§1.2–1.4, 2.1 and AbelianSchemesAndArithmeticModuli A3.7–A3.8, and cites nothing of this roadmap (`roadmaps grep StableReductionPartII` finds only SheafConvolutionOnAbelianVarieties). The false sentence and its plan label are deleted; §§6.3 and 6.12 cite §7.1 for the levelled polarized Jacobian in their routes and Needs; the JacobianChallengePartII contract describes §7.1 instead of excluding Layer 7.

## RT-StableReductionPartII~2b/F06 (P3) — applied

All listed leftovers rewritten: "fiberEquivalence" → the representing equivalence of §0.6; the duplicate §2.42 bullet "For the named canonical the dual generator ε …" deleted (it repeated bullet 1); "Ring A γ δ s t" → R=A[Y][X]/(q(X,Y)−q(s,t)) with ι (twice, with "the the" fixed); §2.67's "existing the normal form signature" → the displayed normal form; "factorPow m hij" → the native quotient transition `Ideal.Quotient.factorPow`; "The native the ideal projection" and "the existing the section Hom differential d(e,n)(A,…)" → plain prose with §2.9; the four "The native the …" bullets of the two-periodic resolutions; the six `_root_.Ext` statements now say "the derived-functor Ext module Ext^n_R(J,N), Mathlib's root-namespace `Ext` as opposed to `CategoryTheory.Abelian.Ext`". Greps for `_root_`, `hij`, `fiberEquivalence`, `Ring A γ`, "the the " are empty.

## RT-StableReductionPartII~2b/F07 (P3) — applied

Verified: mc0-stacks-perfect has no 0BUG. The Stacks "Varieties" chapter was fetched through the sources service (key `stacks-varieties`, open repository, certified); Lemma 33.9.3 is at stacks-varieties line 903 and (7) at line 912; §7.2 cites it under that key and the References list has the entry. `mc1-stackdim` is now cited in §1.13 (Definition 107.5.7 (0DRL), Lemma 107.5.10 (0DRP), lines 508–536: atlas dimension 27=3+24) and `mc1-stackval` in §1.16 (Lemma 106.11.3 (0CQM), lines 1400–1412). `mc4-stacks` had no remaining use (its two tags were removed in round 1); its References entry and manifest record are deleted.

## Checks run

- `Suggested.lean` header: the file is now in the module form of the roadmaps on main (`module`, `public import Mathlib`, the docstring, `@[expose] public section` before the namespace); a plain `import Mathlib` header makes the worker's build log the "consider adding `module`" warning and refuse the submission. No declaration changed.
- `lake env lean …/Suggested.lean` from the content checkout: exit 0; output is exactly five `declaration uses \`sorry\`` warnings (lines 122, 138, 149, 156, 172), no errors and no module warning; 6.5 s.
- Signature check: a scratch copy with `#check @name` for all 13 declarations elaborated (exit 0); all 13 types printed and agree with the worker's earlier extraction for the 12 older declarations. The new `relativelyStablyReflexive_iff_completion` carries, explicitly, `IsNoetherianRing A/R`, `IsLocalRing A/R`, `Module.Flat A R`, `IsLocalHom (algebraMap A R)`, `Module.Finite R M`, the tower `IsScalarTower A R M`, and the quantified completed structures with their towers and locality; no binder was lost.
- Dependency check: `depcheck: 237 roadmaps, 2186 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line.
- `roadmaps resolve`: no cross-roadmap citation and no Lean name found nowhere.
- Anchor checker: 435 headings, 1619 anchor uses, 0 broken; Layer 2 sequential 2.0–2.257.
- `git status`: only README.md, Suggested.lean, design/plan.json (gaps section string) and sources.toml changed.

## Adversarial pass on changed statements

| Statement | Instances | Values | Result |
|---|---|---|---|
| §2.14 φ | ℤ→𝔽₂, γ=1 | φ(2v)=2v′=0, 2v≠0 in ℤ[u,v]/(u²+uv) | not injective; Check |
| §2.14 φ | ℤ→ℤ/4, s=3 | F=X²−9↦X²−1; φ(u)²=1; φ(c)=u′+1=c′; u↦−u′ gives −c′−2 | root map pinned |
| §2.14 φ | ℤ→ℤ/4→𝔽₂ | 3u+2v↦3u′+2v′↦u″; direct image u″ | composition law |
| §2.26 p | ℤ fixture | p(u,v)=(−v,u), p⁻¹(−v,u)=(u,v), p²(u,v)=(−u,−v) | p not an involution |
| §2.31 C_J | M=A fixture | C_J(ε)=(0,−u), C_J(incl)=(u,−v); −p(Ψ(1,0))=−p(v,u)=(u,−v) | composite law holds |
| §2.31 C_J | M=ℤ/4 | (u,3v)⊗1≠(u,v)⊗1 | sign visible |
| §2.39 λₙ | p=(2), m=2R | λ₃([5])=[5], λ₁([5])=[1]; λ₃([3])²=[9]=[1]; λ₂([2])≠0 | laws computed |
| §2.39 λₙ | m=(u,v) | 2∉(u,v), 2↦2≠0 in ℤ | hypothesis h needed |
| §2.57 θ_D | M=ℤ/2, ℤ/4 | θ(ε⊗1)(v)=u⊗1≠0, θ(ε⊗1)(u)=0; θ(−ε⊗1)(v)=3u⊗1≠u⊗1 | generators and sign |
| §2.58 θ_J | M=ℤ/2, ℤ/4 | θ(v⊗1)(ε)=u⊗1, θ(u⊗1)(ε)=0, θ(u⊗1)(incl)=u⊗1; θ(−d⊗1)(ε)=3u⊗1 | correct |
| §2.68 ĩ | Â=ℤ₂ | 1/3≡3 (mod 8), ≡11 (mod 16): levels [3],[11]; f(1/3)=e_R(3) fails at level 4 | uniqueness witnessed |
| §2.69 transition | level 3→2 | 1+2v+4v²↦1+2v; (1/3)·: 3+6v+4v²↦3+2v=3(1+2v) | Â-linear |
| §2.80 E_R | ℤ→ℤ/4, s=3 | E_R(1⊗c)=u′+1, E_R(3⊗u)=3u′, E_R(1⊗9)=1=u′² | multiplicative |
| §2.80 E_R | ℤ→𝔽₂, γ=1 | 1⊗2v=2⊗v=0, E_R(1⊗2v)=0 | no injectivity lost |
| §2.135 Ê_D | I=(2,u,v) | Ê_D(of ε)(E_J(1⊗v))=u, (E_J(1⊗u))↦0; m_C(u)(E_J(1⊗v))=uv≠u | distinguishes ε |
| §2.143 C(e) | ℤ fixture, M=ℤ | (1,0)∘Ψ=(d,−b)=(v,−u); (1,0)∘Φ=(a,b)=(0,u) | d(false,0) by Ψ |
| §2.166 C_J | N=ℤ₂, f=m(u) | level 2 at v: [uv]⊗1; level 1 at u: [u²]=0; (1/3)·f at level 2: [3uv]⊗1; m(v) at u level 1: [uv]⊗1 | family values |
| §2.205 B | N=ℤ₂ | truncations of σ⊗1↦σ⊗1∉R⊗ℤ₂; [1/3 mod 2ⁿ]⊗1 = [1],[3],[3],[11] ↦ (1/3)(1⊗1) | Â-linear assembly |
| §2.227 hull | M finite projective | dual disk on M* in degrees 0,1; coker d⁻¹=M | self-duality dropped |
| §2.227 hull | ℤ[ω], I=(2,ω) | I·(2,1−ω)=(2); ω²≡ω≢0 mod 2, ω²∈I² ⇒ I²≠(2); h=3 ⇒ I≄I⁻¹ | negative control |
| §2.230 completion | A=R=ℤ_(2), M=R | Â=R̂=M̂=ℤ₂; all three true, R̂ flat over Â | consistent |
| §2.230 completion | M=R/(2) | M̂=𝔽₂ flat over neither ring; all three false | consistent |
| §2.230 completion | A=ℤ_(2), R=ℤ_(2)[x]_(2,x), M=R/(x) | M A-flat; fibre 𝔽₂ over 𝔽₂[x]_(x), Ext¹=𝔽₂≠0; completed fibre 𝔽₂ over 𝔽₂[[x]], Ext¹≠0 | both sides false; flatness alone insufficient |
| §2.230 completion | A=R=k | completions k; condition = finite dimension | degenerate case |
| Lean `relativelyStablyReflexive_iff_completion` | pinning of Â→R̂ | local hom of Noetherian local rings maps mⁿ into nⁿ, hence continuous; A dense in Â; R̂ separated (∩ m̂ⁿ=0) | structure unique |
| Lean, same | zero ring | excluded: `IsLocalRing` requires `Nontrivial` | no vacuity |
| §2.248 universal curve | (0,3) | M̄₀,₄ is the universal curve over Spec ℤ, one owner named (§4.15), §2.249 still derives M̄₀,₄≅ℙ¹ from §2.248 | consistent |
| §6.3/§6.12 with JC2 §7.1 | g=2, N=3 | the object τ classifies is (J(C/M),λ_C,α) of §7.1 on the universal curve of §4.8; 48 vs 24 level structures at g=1, N=3 distinguishes the paired level | consistent |
| ShimuraCompactifications gap | §7.17 | ω^{⊗m} descends to an ample line on the neat integral minimal compactification; the gap asks for the principal Siegel version in every residue characteristic prime to N | extends the cited statement |

## For the maintainer

- Layer 2 numbering changed (table above). No roadmap on main or at an open head cites a Layer 2 section of this roadmap. SheafConvolutionOnAbelianVarieties (open) cites "StableReductionPartII §MC.4" and "§MC.6", design-stage labels that do not exist in this README; that is a citation for that roadmap to update, not a change here.
- Ownership of the new Lean headline: `roadmaps grep` for "stably reflexive" and for the completion theorem finds no other roadmap; Knudsen's completion theorem is stated only here. Ownership against the open pull requests was checked by that grep and by reading JacobianChallengePartII §7.1, ShimuraCompactifications Layers 6–7 and SchemeAndStackFoundations §4.15 at their current copies; the other sibling checkouts were not read individually.
- Sources: one new manifest key `stacks-varieties` (fetched, certified); `mc4-stacks` removed; `mc1-stackdim` and `mc1-stackval` are now cited. No `needs-references.toml` request was made.
- `design/plan.json`: only the `section` string of gap `minimal-siegel-all-characteristics` changed; 28 gaps, unchanged slugs.
- `Suggested.lean` uses the module-system header (`module` / `public import Mathlib` / `@[expose] public section`), the form of `TauCetiRoadmap/CoboundaryExpansion/Suggested.lean` on main; the single Mathlib import and the absence of `set_option` are unchanged.
