# Review of GeometricQuantization (pull request #1186 at 48f3343)

**Verdict:** needs changes

This is an incremental re-review of the 56 lines that changed in the folder since `2c84ca0`. One finding remains, and it is not blocking. The branch still pins Tau Ceti `a91d3aa`. The new docstring wording names two more declarations that exist only at main's pin `2fd255d`. Previous R02 is repaired. Apart from the code spans and spacing, the README change alters one character: the §3.4 Check's `X*(T)` becomes `X^*(T)`. The mathematics is therefore unchanged. The gate passes, the dependency check is clean, and `Suggested.lean` elaborates with `sorry` as its only warning.

## R01 (P3) — The branch still pins Tau Ceti `a91d3aa`; the README and docstring now cite twelve Tau Ceti declarations that do not exist there

Previous review R01, partly repaired. The docstring wording is now correct at main's pin. The pin itself has not moved.

**Location.** `lake-manifest.json` line 8: `"rev": "a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039"`, with Mathlib `6b7abb3c` and `lean-toolchain` `v4.35.0-rc3`. The affected passages are:
- the README Conventions, lines 55–64;
- the README "From Tau Ceti" contract, lines 131–154;
- `TauCetiRoadmap/GeometricQuantization/Suggested.lean` lines 17–18: "The pinned smooth principal bundles (`TauCeti.PrincipalBundle` with `TauCeti.ContMDiffFiberBundle`) carry no principal connection…".

**Claim.** None of the following declarations exists at the branch pin `a91d3aa`. All of them exist at main's pin `2fd255d`:
- the ten names R01 listed: `TauCeti.SmoothForm`, the `abbrev SmoothTwoForm`, `SmoothTwoForm.IsHamiltonianVectorField`, `.hamiltonianVectorField`, `.poissonBracket`, `IsNondegenerate.hamiltonianVectorField_poissonBracket`, `TauCeti.InfinitesimalAction`, `IsMomentMap`, `momentCocycle`, and the two `IsMomentMap.momentCocycle_*` lemmas;
- the two names the new docstring adds: `class PrincipalBundle` (`Topology/FiberBundle/Principal.lean`:156) and `class ContMDiffFiberBundle` (`Geometry/Manifold/FiberBundle/Basic.lean`:122).

The docstring's sentence is true at `2fd255d`. `Geometry/Manifold/FiberBundle/Principal.lean` builds smooth principal bundles there: transition-function smoothness, a smooth action and division, and vertical tangent spaces. Nothing there defines a principal connection or an associated bundle. This corrects the previous review: its proposed wording ("only that topological class, with no smooth structure") was false at `2fd255d`, and the author's wording is the accurate one.

**Witness.** In the Tau Ceti package, `git cat-file -e a91d3aa:<path>` fails for `TauCeti/Topology/FiberBundle/Principal.lean`, `TauCeti/Geometry/Manifold/FiberBundle/Basic.lean` and `TauCeti/Geometry/Manifold/FiberBundle/Principal.lean`. `git grep` at `a91d3aa` finds 0 hits for each of the twelve definitions, and at `2fd255d` finds at least one for each.

**Repair.** Make no edit to either file. Merge `origin/main` into the branch and re-run the gate. The print-only `git merge-tree --write-tree HEAD origin/main` exits 0. Since the merge base `83f4d77`, main has changed `lake-manifest.json` (the Tau Ceti bump to `2fd255d`, Lean `v4.36.0-rc2`) and nothing in this folder. A repair job may not edit the manifest, so this is the worker's or operator's step.

## Previous findings

- R01 — partly repaired: the docstring now reads "The pinned smooth principal bundles (`TauCeti.PrincipalBundle` with `TauCeti.ContMDiffFiberBundle`) carry no principal connection". That is true at `2fd255d`, but `lake-manifest.json` still pins `a91d3aa`, so this is carried as R01 above.
- R02 — repaired: line 766 now reads "lattice is `X^*(T)`. The forgetful map is restriction/pairing `X^*(T)→P`". The chain at line 1618 is one code span, `H⁰(M,L^n)_λ ≃ … ≃ H⁰_orb(R_ξ,L_(n,λ,ξ))`. Lines 652, 1474, 1580, 1586 and 1597 are code spans.

## Verified sound

**Gate, dependency check, elaboration.**
- The worker's gate at `48f3343`: every check `0`, `build=0`, `OK`. My re-run of the gate (`--base origin/main`) also returns every check `0` and `OK`.
- Dependency check, complete output: `depcheck: 236 roadmaps, 2281 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line. GeometricQuantization is line 153 of the merge order.
- `lake env lean TauCetiRoadmap/GeometricQuantization/Suggested.lean`: exit 0. The only output is `93:8: warning: declaration uses `sorry``.
- `#check @` on a scratch copy prints the same types as the previous review. `thetaSections : ℕ → ℂ → ℝ → ℝ → Submodule ℂ (ℂ → ℂ)`. `finrank_thetaSections : ∀ k, 0 < k → ∀ τ, 0 < τ.im → ∀ α β, finrank ℂ (thetaSections k τ α β) = k`. No section binder is lost.
- The `modulo` "class" that the worker's signature listing shows at line 92 is a parsing artifact: the docstring phrase "residue class modulo `k`". No such declaration exists.
- One-tactic probe on `finrank_thetaSections`: `simp`, `rfl`, `infer_instance` and `aesop` all fail, and `exact?` returns only the theorem itself. It is not padding.
- `git diff --stat origin/main...HEAD` outside the folder is empty.

**Changed passages, checked one by one.**
- Comparing the old and new README with whitespace and backticks stripped, they are identical except for one inserted `^` in the §3.4 Check (`X*(T)→P` becomes `X^*(T)→P`). That makes the Check use the notation of the §3.4 prose. Every other change is spacing ("factor 1/2", "group 0", "rank 0", "radius 0", "period 2π", "area 4πr", "area 2πℏ", "integral 1", "when 0 lies", "on 𝔱", "in ℂ_(−λ)", "On ℂP¹", "is ℂ×") or a code span.
- CommonMark rendering (`markdown_it`, commonmark mode) of the whole README: the only emphasis left is the intended `**local**` (line 849), the Checks and Needs labels, and the titles in the References.
- I swept for glued words outside code spans after common words (`a`, `the`, `of`, `is`, `at`, `rank`, `period`, `area` and others, followed by a digit or ℂ, π, 𝔱). There is one hit, line 1603, "importing a2π constant". It is in untouched text, so it is a remark only: a missing space.

**Library declarations opened.**
- Tau Ceti `2fd255d`:
  - `class PrincipalBundle`, `Topology/FiberBundle/Principal.lean`:156, in `namespace TauCeti` (line 145). It says every atlas trivialization is equivariant; continuity of the group operations is not assumed.
  - `class ContMDiffFiberBundle`, `Geometry/Manifold/FiberBundle/Basic.lean`:122, in `namespace TauCeti` (line 101). Its coordinate changes are `C^n` on overlaps.
  - The module docstring of `Geometry/Manifold/FiberBundle/Principal.lean`, and `Principal/Equivariant.lean`.
  - A grep of `Geometry/` and `Topology/FiberBundle` for principal connections, connection forms and associated bundles finds no hit. The "connection" hits are Riemannian.
- Tau Ceti `a91d3aa`: all twelve names in R01 are absent.
- Mathlib `6b7abb3c`: the five `JacobiTheta.TwoVariable` names used by `Suggested.lean` are unchanged, and the file elaborates.

**Cross-roadmap citations in the changed passages**, resolved on main `623f5d6`:
- HamiltonianReduction README lines 151–154 and 183: SO(3) unit generator Z with period 2π; KKS area 4πr at radius r; SU(2) basis `−iσ_a/2` with period 4π. This matches §3.4's changed lines 787 and 796.
- ComplexKahlerGeometry README lines 88–89: `ω_FS` has integral 1 on a projective line, and the O(1) Chern curvature is `−2πiω_FS`. The angular form is then `i·(−2πiω_FS)=2πω_FS`, as §6.6's changed line 1486 says.
- The other suppliers the changed paragraphs name are on unchanged lines and were resolved by the previous review: LieGroups Layer 6, ConvexityToric T1 and T3, SchubertGeometry S9.7, ComplexKahlerGeometry K3/K7, and HamiltonianReduction R2.
- The worker's overlap listing names no pull request that changes this roadmap and no dropped or revision-only id. `roadmaps resolve` finds nothing missing.

**Sources at the sampled locators that fall in the changed passages**, re-read this round:

| Target | Locator | Text read | Supports the statement as written? |
|---|---|---|---|
| 3.1, 3.4 | Graham–Vogan Ex. 5.8, p. 25 | author-page PDF (math.mit.edu/~dav), PDF page 25 rendered with Ghostscript and read; printed page = PDF page | Yes. A closed subgroup H, a unitary representation τ and the quotient `(gh,v)∼(g,τ(h)v)` give the equivariant bundle `G×_H H_τ`. The README's `(g,z)·h=(gh,λ(h)⁻¹z)` is the same relation with τ=λ. |
| 3.2 | Graham–Vogan Def. 6.4, p. 37 | PDF page 37, rendered | Yes. An integral orbit datum is an irreducible unitary representation p of the full stabilizer with `dp(Y)=dχ(1)f(Y)`, equivalently `p(exp Y)=χ(f(Y))`. With `χ(t)=exp(it/ℏ)` and Y=tξ this is the README's `λ(exp tξ)=exp(itμ₀(ξ)/ℏ)` on the full H. |
| 5.1 (cites the same source) | Graham–Vogan Def. 5.5, pp. 23–24; (5.7), pp. 24–25 | PDF pages 23–25, rendered | Yes. t-densities on a vector space and on a manifold; `L²` of half-densities through the product density, with no reference measure; (5.7)(c) is on p. 25. |
| 3.4 | Demailly VI §9.1 (9.1), p. 314 | demailly line 15569 | Yes. The exponential sequence for a compact connected Kähler X. |
| 6.6 | Sjamaar arXiv v1, Prop. 2.2, p. 19; Thm 2.8, p. 22 | sjamaar lines 1000–1012, 1155–1160 | Yes. `M^ss` is the smallest invariant open set containing the zero level, with analytic complement; closed orbits meet the level in one G-orbit. At a regular value `M^ss=M^s` and the quotient is a Kähler orbifold. |
| 6.7 | Sjamaar Thm 2.15, p. 27, proof p. 28 | sjamaar lines 1439–1488 | Yes for the statement. The normalization is recomputed in the table below. The proof has the gap listed under "Source issues"; the README's argument avoids it. |

The other sampled targets (2.1, 2.3, 5.2, 6.1, 6.2, 6.3a, 6.8, 6.9, 6.10, 6.11) are untouched. The previous review verified their sources (Schottenloher, Tuynman, Demailly VII, Vergne, Meinrenken, Ma–Marinescu), and that is carried forward.

**Adversarial table.** New rows have values computed this round, with ℏ=1 unless stated. Carried rows cite the previous review (r11) and repeat its values.

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §3.2 period identity `∫_(C_α) ω/(2πℏ)=μ₀(ι(α∨))/ℏ=⟨λ\|_T,α∨⟩` (now a code span) | SU(2) at r=1/2; SO(3) at r=1/2 and r=1; a Levi root | SU(2): `4π·½/2π=1`; `μ₀(ι(α∨))=μ₀(2Z)=2r=1`; `⟨z¹,α∨⟩=1`. SO(3) at r=1/2: λ would need `ℓ_λ(Z)=1/2∉ℤ`, so no λ exists ("when λ exists"). SO(3) at r=1: 2=2=2. Levi root: `μ₀(α∨)=0`, constant orbit map, period 0. | agrees |
| §3.4 forgetful map `X^*(T)→P` and its Check (now code spans) | SO(3); SU(2); torus U(1); SU(3) with I={α₁} | SO(3): `⟨a,α∨⟩` with α∨=2Z gives 2a, kernel 0, image 2ℤ, which is the root lattice (`⟨α,α∨⟩=2`). SU(2): a↦a, surjective. U(1): P=0, so the map ℤ→0 has kernel ℤ=`X^*(K)`. SU(3): `P_I=ℤϖ₂`, rank 1=2−1, which is Pic ℂP². | agrees |
| §3.4 SO(3)/SU(2) numerics (spacing fixed) | k=1, 2; the covering differential | r=ℏ/2: area 4πr=2πℏ, k=2r/ℏ=1, which is O(1). −I acts by (−1)^k: −1 at k=1 (no SO(3) lift), +1 at k=2. `diag(e^{it},e^{−it})` rotates by 2t, so `dp(diag(i,−i))=2Z`. `exp(t·(−iσ₃/2))` has period 4π. These match HamiltonianReduction 151–154 and 183. | agrees |
| §3.4 central phases (Check) | U(2) O(1); U(3) O(1) and O(3) | `(ζI_{N−1},ζ)` acts on `det^a z^b` by `ζ^{(N−1)a+b}`. With a=0, b=−k this is `ζ^{−k}`: −1, `e^{−2πi/3}`, 1. | agrees |
| §6.6 potential `κ_x(a)=−log‖exp(ia)·ℓ‖²+log‖ℓ‖²` (now a code span); bounded comparison | ℂP¹ conic embedding, the point [1:1]↦[1:1:1], support {−1,0,1} | `κ=2log cosh a`: `κ(0)=0`, `κ′(0)=0`, `κ″(0)=2`. FS potential `log((e^{2a}+1+e^{−2a})/3)`: 0 at a=0, derivative range (−2,2)=2·conv{−a_j}. The difference tends to `2log2−log3=log(4/3)` as \|a\|→∞, so it is bounded. | agrees |
| §6.6 finite-support criterion and regular value (spacing fixed) | generic point; fixed point [1:0] | Generic support {−1,0,1} has 0 in the interior of [−1,1]: semistable and stable. At [1:0] the support is one nonzero weight, the potential `−2a₀a` is linear and has no minimum: unstable. The unstable set is two points (analytic, nowhere dense), and `Mss=ℂ×`. | agrees |
| §6.7 invariant-section equations (now a code span) | general | `a·s=0` with `nμ_a−λ_a=nη_a` gives `∇_{X_a}s=inη_a s`. Holomorphic means `∇_X s+i∇_{JX}s=0`, so `∇_{JX_a}s=i·inη_a s=−nη_a s`. From `g(JX_a,v)=ω(X_a,v)`, `grad μ_a=JX_a`. | agrees |
| §6.7 growth `d/dt‖s‖²=4n‖μ−ξ‖²‖s‖²` (now a code span) | ℂP¹ of area 2π, s=xy, n=2, ξ=1/2, at μ=1/3 and μ=1/5; Sjamaar's normalization | `‖X‖²=2μ(1−μ)`, `‖s‖²=μ(1−μ)`, `dμ/dt=−2η·2μ(1−μ)`. Then `(1−2μ)dμ/dt=8η²μ(1−μ)`: 4/81 on both sides at μ=1/3, and 72/625 at μ=1/5. Sjamaar's `8π‖Φ‖²` with `ω=2πω_S`, `μ=2πΦ` and `grad=(2π)⁻¹grad_S` gives `2π·8π‖Φ‖²=4‖μ‖²`. | agrees; factor 4n confirmed |
| §6.7 Kostant bound `‖s(x)‖ ≤ sup_(z∈Z_ξ)‖s(z)‖` | same | `max μ(1−μ)=1/4`, at μ=1/2, which is `Z_ξ`; it is at least 2/9 (μ=1/3) and 4/25 (μ=1/5) | agrees |
| §6.7 chain `H⁰(M,L^n)_λ ≃ … ≃ H⁰_orb(R_ξ,L_(n,λ,ξ))` (now one code span) | n=2 with λ=1 and λ=3 | λ=1: span{xy} has dimension 1; the invariant sections on ℂ× are `c·w`, dimension 1; `R_ξ` is a point, dimension 1. λ=3: `H⁰_3(O(2))=0` and `Z_ξ=∅`, so all spaces are 0 (the empty-level case). | agrees |
| Docstring lines 17–18 (changed) | both pins | at `2fd255d`: `PrincipalBundle` :156 and `ContMDiffFiberBundle` :122, with 0 hits for a principal connection or associated bundle; at `a91d3aa`: both absent | true at main's pin; R01 at the branch pin |
| §5.2 projective dimensions (sampled; untouched) | ℂP¹ at k=0, 1, 2; ℂP² at k=2; n=0; −I | `binom(n+k,n)`: 1, 2, 3; 6 (`x²,y²,z²,xy,xz,yz`); 1. `Sym^k` gives (−1)^k: −1 and +1, matching §3.4. | agrees |
| Conventions `[X_f,X_g]=−X_{ {f,g} }` (r11) | f=q², g=p | `[X_f,X_g]=2∂p`, `X_{2q}=−2∂p` | agrees (r11) |
| Conventions `F_∇=−(i/ℏ)ω` (r11) | `∇=d+iθ/ℏ` | `F(∂q,∂p)=−i/ℏ`, `iF/2π=ω/2πℏ` | agrees (r11) |
| §1.1 holonomy (r11) | `β=ℏdq/2` | `e^{−i/2}` | agrees (r11) |
| §2.1 lift bracket (r11) | curvature term | `+2{f,g}V/ℏ`, total `Y_{ {f,g} }`; plane: bracket `∂t` | agrees (r11) |
| §2.2 Stone generator, deficiency (r11) | f=c; `iℏ∂q` on (0,∞) | `Q_c=c`; indices (0,1) | agrees (r11) |
| §2.3 descent, extension (r11) | Circle on a point, μ≡ℏ and ℏ/2 | `e^{−2πi}=1`, `e^{−πi}=−1`; kernel Circle | agrees (r11) |
| §3.1 characters (r11) | μ₂; S₃ | values 1, −1; `ker sign=A₃` | agrees (r11) |
| §3.3 vanishing (r11) | ℂP¹, SU(3)/T, elliptic curve | `⟨ϖ_j,α_i∨⟩=δ_ij`; `h^{0,1}=1` breaks injectivity | agrees (r11) |
| §4.1–4.2 (r11) | `P=span ∂p`; `p²` | `Q_{p²}1=−p²` | agrees (r11) |
| §5.1 flow with phase (r11) | group law | `U_tU_s=U_{t+s}` | agrees (r11) |
| §5.3 headline `finrank_thetaSections` (r11) | general; k=0; Im τ<0; k=1, α=1/2 | dimension k; 1; 0; 1 | true; both hypotheses needed (r11) |
| §5.3 metric and holonomy (r11) | τ=i, k=1, 2 | `F=−iω/ℏ`; holonomies 1, 1, −1 | agrees (r11) |
| §6.1 weights (r11) | ℂP¹ (0,2) | weights 0,…,−2n; image [−2,0] | agrees (r11) |
| §6.2 residues (r11) | m=3, thresholds (2,4,1) | k≥4 | agrees (r11) |
| §6.3a fixed components (r11) | ℂP¹ O(1); ℂP² (0,0,1) | `1+u`; `2+t⁻¹` | agrees (r11) |
| §6.4 limit (r11) | ℂP¹; ℂP² O(1) | density 1/2; 1/2 | agrees (r11) |
| §6.5 cosets (r11) | doubled ℂP¹; `[pt/μ₂]` | index 2; 1, 0 | agrees (r11) |
| §6.8 inertia (r11) | `[pt/μ₂]`; ε=1/2, C₀=3 | totals 1 and 0; 0 at n=6, 1/2 at n=7 | agrees (r11) |
| §6.9 counts (r11) | (0,1,2), n=6 | `⌊j/2⌋+1`; leading terms 1 and 3/2 | agrees (r11) |
| §6.10 transport (r11) | T² on ℂP¹ | `(−j,nb)` in both cases | agrees (r11) |
| §6.11 densities (r11) | (0,1,−2) | masses 1/3 and 1/6 | agrees (r11) |

**Headline theorems.** These are unchanged since r11:
- §5.3's degree-k torus quantization is stated as `finrank_thetaSections`.
- §§2.1–2.3, 3.1–3.4, 4.2–4.3, 5.1–5.2 and 6.2–6.9 are named in the docstring as not statable, each with the carrier it lacks.

The only changed docstring claim is the Layer 2 sentence. At `2fd255d` there are smooth principal bundles but no principal connection or associated character line, so the sentence holds there. No stand-in is used.

**Ownership.** No changed passage introduces a new object. The previous review's ownership check (grep over main and every open head) is carried forward.

## Not verifiable

- **Elaboration at main's pins.** The Lean commands this review may run build only at the branch pins `a91d3aa`/`6b7abb3c`. At main's pins I compared declarations with `git grep` and `git cat-file`, and checked with a print-only `git merge-tree` that the merge has no conflicts.
- **Context-only references** (Kostant, Woodhouse, Śniatycki, Cannas da Silva, Kodaira 1954, Meinrenken–Sjamaar) carry no locator, and no claim rests on them; they were not read.
- Graham–Vogan, which the previous reviews listed here, is now verified (see the source table).

## Source issues

- **Error** in sjamaar at Theorem 2.15, proof, printed p. 28 (sjamaar line 1487): the source places the gradient-flow limit of a semistable point inside its complexified orbit, so the invariant section takes equal values there. It should place the limit only in the orbit closure, and get nonvanishing from the nondecreasing norm (2.4) and continuity. Affects the proof.
- **Misprint** in demailly at VI §9.1, printed p. 314 (demailly line 15573): the source cites (V-11.6), a notation item, for `H¹(X,𝒪)≃H^{0,1}`. It should cite (V-11.5), the Dolbeault–sheaf comparison (line 13203). Affects nothing.
