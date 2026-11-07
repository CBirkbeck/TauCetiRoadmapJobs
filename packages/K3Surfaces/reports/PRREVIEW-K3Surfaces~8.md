# Review of K3Surfaces (pull request #1285 at 23b0674)
**Verdict:** needs changes

Incremental re-review of 127 changed lines since c11a7c4. The diff touches only the README: the Scope sentence, Conventions, the Tau Ceti supplier paragraph, three supplier rows, the new restricted-structure block of §0.2 with its Checks, the unirationality reduction (U), step 1's p-closedness and norm arguments, the step-3 Ogg locator, the §0.2 *Needs:* line and Examples, Downstream consumers and the Rudakov–Šafarevič reference. The repair introduced one blocking finding: the characteristic-2 reduction now has two owners. None of the three previous findings is repaired; they are carried as P3.

## R01 (P2) — The characteristic-2 unirationality reduction now has two owners

**Location:** `TauCetiRoadmap/K3Surfaces/README.md:24–28` ("K0.A owns the vector-field unirationality reduction over algebraically closed fields of every positive characteristic, 2 included, … and the Part II roadmap consumes both"). Also `:276–278` ("at p=2 … the Part II roadmap applies it") and `:1016–1018` ("it consumes … its unirationality reduction (U) at p=2").

**Claim:** This head widens (U) to p=2 and says that K3SurfacesAndSymplecticBoundedness consumes it. At its open head, that roadmap owns the same characteristic-2 case and proves it again. So one object has two owners, and each roadmap hands it to the other.

**Witness:** K3SurfacesAndSymplecticBoundedness, pull request #1375 at c1d6da0, `TauCetiRoadmap/K3SurfacesAndSymplecticBoundedness/README.md:9`: "Section 2.1a owns only the infinite-height kernel statement and the characteristic-2 case of the reduction". Its `:406` reads "At p=2, outside K0.A's binder, prove the vector-field unirationality reduction by the argument of K3Surfaces K0.A step 1" and then restates cases (a) and (b). Its `:74` reads "§2.1a extends that reduction to p=2". That head (01:26) predates this one (07:00) and matches the c11a7c4 wording.

**Exact repair:** K3Surfaces is earlier in the merge order (line 129, against line 306), so it keeps (U) with its p=2 binder. The step-1 proof is characteristic-free (verified below: the ruledness contract, NeronModelsAndSemistableAbelianVarietiesPartII §6.1, StableReduction Layer 4 and EtaleCohomologyFoundations F.0.4/F.2.5 carry no characteristic hypothesis).

Settle the overlap before either pull request merges:
- In K3SurfacesAndSymplecticBoundedness, `:9` becomes "§2.1a consumes K3Surfaces §0.2 (U) at p=2 and owns only the infinite-height kernel statement".
- Its `:74` and `:406` replace the restated p=2 argument by that citation.
- Its `:414` lists "K3Surfaces §0.2 (U)" instead of "its step-1 reduction argument run at p=2".
- This pull request's description records that #1375 is rebased after it.

If #1375 keeps the characteristic-2 case instead, restore the binder p>2 for (U) here. Then delete "2 included", "and the Part II roadmap consumes both" and "its unirationality reduction (U) at p=2". Either way, exactly one roadmap owns the p=2 instance that refuted the original.

## R02 (P3) — The Euler-number count in §0.2 case (b) still uses the connectedness of the exceptional fibres without naming its owner

**Location:** `TauCetiRoadmap/K3Surfaces/README.md:280`, case (b): "negative definiteness makes each connected exceptional curve a tree of n_i such curves … gives e(Ỹ)=e(Y)+Σn_i". The *Needs:* line at `:294` lists "SchemeAndStackFoundations §§1.17, 2.11, 2.20, 5.9–5.10".

**Claim:** The identity e(Ỹ)=e(Y)+Σn_i computes e(Y)−s+Σ(n_i+1). It needs the number s of singular points of Y to equal the number of connected components of the exceptional curve. That holds because f_*O_Ỹ=O_Y for the normal Y and Zariski's connectedness theorem applies. The owner of that theorem is SchemeAndStackFoundations §4.9: the supplier table lists §4.9 (`:105`), but the §0.2 *Needs:* line does not. The text at this head is unchanged.

**Witness:** `rudakov-shafarevich-inseparable line 460` takes the curves "contracted to distinct singular points". Instance: Y with one A₁ point gives e(Ỹ)=24−1+2=25=24+n₁. A disconnected fibre over one point would add a component without adding a singular point.

**Exact repair:** In (b), after "each connected exceptional curve", add "one for each singular point of Y, since f_*O_Ỹ=O_Y for the normal Y and the fibres of f are connected by Zariski's connectedness theorem of SchemeAndStackFoundations §4.9". Add §4.9 to the SchemeAndStackFoundations item of the §0.2 *Needs:* line.

## R03 (P3) — Rudakov–Šafarevič 1976 is still not recorded in the roadmap's sources manifest, and the head adds a second locator into it

**Location:** `TauCetiRoadmap/K3Surfaces/README.md:238–239` ("Rudakov–Šafarevič 1976, §1, Lemma 1 and its Corollary, pp.1206–1207"). Also `:272–273`, `:280` and the reference entry at `:1048–1054`.

**Claim:** `packages/K3Surfaces/sources.toml` still records only `liedtke-surfaces` and `huybrechts-k3`. The work is cited at four places. A legal copy exists: mathnet.ru, already cached under the Part II roadmap's manifest key `rudakov-shafarevich-inseparable`.

**Witness:** `rudakov-shafarevich-inseparable line 75` through 90 (Lemma 1 and its Corollary, printed pp.1206–1207). Also `line 440` through 486 (Theorem 5 and Corollary 1, pp.1216–1217).

**Exact repair:** Record the work in `packages/K3Surfaces/sources.toml` under the existing key `rudakov-shafarevich-inseparable`, with DOI 10.1070/IM1976v010n06ABEH001833 and the mathnet.ru copy. Use `locator_scheme = "theorem"`, the locator "§1, Lemma 1 and Corollary, pp.1206–1207; §2, Theorem 5 and Corollaries 1–2, pp.1216–1217" and `cited_for = ["0.2"]`. Record it through the sources service.

## R04 (P3) — The ruledness gap still asks for an unused converse

**Location:** `TauCetiRoadmap/K3Surfaces/README.md:148–149` ("conversely every birationally ruled surface has all plurigenera zero").

**Claim:** A declared gap asks only for what this roadmap consumes. §0.2 uses only "all plurigenera zero ⇒ birationally ruled with h¹(O)=g(C)=b₁/2", in case (a) and, through "by the argument of (a)", in case (b). The converse is consumed nowhere, and nothing at this head changes that.

**Witness:** The only consumer sentences are at `:280`: "so every plurigenus of Ỹ is zero and Ỹ is birationally ruled …" and "Ỹ is rational by the argument of (a)".

**Exact repair:** Delete the clause "conversely every birationally ruled surface has all plurigenera zero" from the contract.

## Previous findings

- R01 — not repaired: `:280` still reads "negative definiteness makes each connected exceptional curve a tree of n_i such curves … gives e(Ỹ)=e(Y)+Σn_i". The §0.2 *Needs:* line (`:294`) still omits SchemeAndStackFoundations §4.9. Carried as R02.
- R02 — not repaired: `packages/K3Surfaces/sources.toml` records `liedtke-surfaces` and `huybrechts-k3` only, while the README now cites Rudakov–Šafarevič 1976 at two locators. Carried as R03.
- R03 — not repaired: `:148` still reads "conversely every birationally ruled surface has all plurigenera zero". Carried as R04.

## Verified sound

This is an independent AI review at head `23b06742fd75df291ed16ccada6328ab4758c784`, incremental after the review at `c11a7c4`.
- **Folder contents.** The diff outside the folder is empty (`git diff --stat origin/main...HEAD` excluding the folder prints nothing). The folder holds `README.md`, `Suggested.lean` and `metadata.toml`. `Suggested.lean` is byte-identical to c11a7c4 (`git diff --stat c11a7c40 HEAD` lists the README only).
- **Repair reports and fetched text.** No repair report marks a finding "not actionable in this package". No fetched text contained an instruction.

**Gate.** The worker's gate at this head passed every check (`build=0`). I reran `gate … --base origin/main`, and every scanner reported 0 ("OK", exit 0). The prescribed dependency check printed:

```text
depcheck: 239 roadmaps, 2366 edges, 0 problem(s)
```

It printed no UPWARD, CYCLE or `moved:` line.

**Elaboration.** I ran `lake env lean` on the absolute path of `Suggested.lean` from the worktree, with Mathlib `6b7abb3c` and Tau Ceti `a91d3aaf` at the manifest pins. Every imported Tau Ceti olean was present.
- It exits 0 with exactly two `declaration uses sorry` warnings, at lines 51 and 74.
- **Signatures.** A scratch copy with `#check @` for all four declarations shows that every binder is kept:
  - `IsAlgebraicK3` keeps `[Field k] [IsAlgClosed k] [X.Over (Spec ↧k)]`.
  - `algebraicK3_differential_vanishing` keeps `[CharP k p]`, `2 < p` and `IsAlgebraicK3 k X`.
  - `gluing_isometry_extension_iff` keeps both `IsNondegenerate` instances, both `IsEven` hypotheses, the anti-isometry equation and the form and carrier equations.
  - Nothing changed against the README.
- **One-tactic probe.** In the same copy, each `sorry` was replaced by `first | simp | rfl | infer_instance | sorry`. Both theorems still warn, so neither closes in one tactic and there is no padding.
- **Headlines.** The headline list and the docstring are unchanged. (U) and sub-target (i) are intermediate steps of K0.A, not headlines. (i) is also not statable: neither pin has a Néron–Severi group or a Picard number (grep for `NeronSeveri`, `picardNumber` and `IntersectionPairing` finds nothing). Mathlib does have `AlgebraicGeometry.RationalMap` (`Mathlib/AlgebraicGeometry/Birational/RationalMap.lean:374`).

**Library declarations opened at the pins (3):**
- Tau Ceti `AlgebraicGeometry.Scheme.relativeDifferentialsHomEquiv` (`TauCeti/AlgebraicGeometry/Modules/Differentials/Basic.lean:101`): `(Ω_{X/R} ⟶ M) ≃ M.Derivation R` for `X` over `Spec R`.
- Tau Ceti `AlgebraicGeometry.Scheme.Modules.Derivation` (`:72`): compatible families of `R`-derivations `Γ(X,U)→Γ(M,U)` over all opens, as `PresheafOfModulesOfCommRing.Derivation'`. With `M = SheafOfModules.unit` this is exactly the README's description at `:80–83` and `:214–216`.
- Mathlib `AlgebraicGeometry.RationalMap` (above).

**Cross-roadmap citations resolved (8):**
- **PCurvature §§0.1–0.3.** A new roadmap folder, pull request #1747 by another author, head 7ff8fa7; named in this pull request's depends-on list.
  - §0.1 is Jacobson's Lie polynomial, with `Λ_p(a,b)=0` for commuting a, b.
  - §0.2 is `RestrictedLieAlgebra R L p`, with the three axioms the README quotes, morphisms and restricted subalgebras.
  - §0.3 is `pPow`, with the scalar law, `pPow_smul` (Hochschild, correction term `(aD)^{p−1}(a)·D`), `ad_pPow`, `pPow_add`, the instance on `Derivation R A A`, and the localization compatibility via `Derivation.extendOfIsLocalization`.
  - It needs `[CharP A p]`, which the README's zero-ring clause at `:223` handles correctly.
  - Its scope (`README.md:27–30`) agrees with this roadmap's §0.2 split: rings there, schemes here.
- **ModularCurves §2B** (main `README.md:685–686`): the norm functor on invertible sheaves for finite locally free morphisms, with base-change, tensor and tower laws. The same text is at #1101 (`:1249`) and #1808 (`:797`), so no open pull request drops it.
- **NeronModelsAndSemistableAbelianVarieties §5.3e** (#852 at 4c22d44, `README.md:3539–3552`): Ogg's formula in every residue characteristic, including 2 and 3, in mixed and equal characteristic. §5.3's standing hypotheses (`:3404–3406`) are a complete DVR, a perfect residue field and char K ∈ {0,p}. These cover k((t)) for k algebraically closed. The roadmap is at merge-order line 50.
- **JacobianChallenge Layer B** (main `README.md:136–138`): finite-dimensionality of coherent cohomology for proper X/k. It is unchanged at #1187 (`:137`) and #1892 (`:143`).
- **NeronModelsAndSemistableAbelianVarietiesPartII §6.1** (`README.md:9845–9847`): "the characteristic-independent Castelnuovo–Zariski equivalence".
- **StableReduction Layer 4** (main `README.md:541–547`): the normalized-blowup resolution, with no characteristic hypothesis.
- **K3SurfacesAndSymplecticBoundedness at c1d6da0**: `:74` and `:411` consume sub-target (i), as `:1017` says; `:9`, `:74` and `:406` own the p=2 reduction (R01).
- **IntegralLattices 0G, 5J, 6A.** These are defined on main as bold paragraph labels (`README.md:568`, `:1597`, `:1643`). So the overlap lead "only #1239 defines them" is a false positive, not a finding.

**Ownership by object.** A `roadmaps grep` for restricted Lie algebras, p-closed fields and Jacobson's formula finds PCurvature as the only owner. ReductiveGroups (main `README.md:1690–1691`) uses "the actual restricted Lie algebra" of a group's Lie algebra without owning the general notion. No roadmap plans vector fields on a scheme with their p-th power. This roadmap owns that passage, by `:30–31`.

**Source sample at the changed passages** (page markers coincide with printed pages):

| Target | Text opened; result |
| --- | --- |
| 0.2 restricted block, existence of an additive or multiplicative field | `rudakov-shafarevich-inseparable line 75` through 90 (Lemma 1 and Corollary, pp.1206–1207). A complete variety with a nonzero regular vector field has a nonzero field with D^p=λD, and rescaling gives D^p=0 or D. Matches; the README's fixed-point route repairs the source's "diagonalized" (Source issues). |
| 0.2 (U), every p | `rudakov-shafarevich-inseparable line 13` through 14 (standing hypothesis: an algebraically closed field of any finite characteristic p) and `line 440` through 486 (Theorem 5 and Corollary 1, pp.1216–1217). Neither excludes p=2. Matches. |
| 0.2 (U), Huybrechts | `huybrechts-k3 line 6797` through 6798 (Proposition 9.4.6, p.180): characteristic p>0, with no other restriction. Matches "for every p>0". |
| 0.2 step 1, p-closedness | `huybrechts-k3 line 6803` through 6808, 6827 through 6836: rank-one involutivity and the p-th power map L→T_X/L. The README's route goes through an additive or multiplicative D and Hochschild's formula instead; it was checked by computation (table). |
| References, Rudakov–Šafarevič | §1 at pp.1206–1207 and §2 at pp.1216–1217, as the entry says. |
| 0.1, 1.1, 2.1, 3.1, 4.1, 5.1, 5.2, 6.1, 6.2, 7.1, 7.2, 7.3 | Untouched by the diff; the checks of the previous reviews stand. |

**Adversarial table.** Rows 1–15 are the statements this head adds or changes, with computed values. The last rows are carried from PRREVIEW-K3Surfaces~7, and through it from ~5 and ~6, for untouched statements.

| Statement | Instances tried | Values on the two sides | Result; change |
| --- | --- | --- | --- |
| D^[p] openwise is a derivation | k[x], char p; zero ring; ℚ[x]; p=2 | ∂^p(xⁿ)=n(n−1)⋯(n−p+1)x^{n−p}≡0; (x∂)^p(xⁿ)=n^p xⁿ=n xⁿ; zero ring: unique derivation 0 (CharP of the zero ring is 1, so §0.3 does not apply, handled at `:223`); ℚ: ∂²(x·x)=2 vs Leibniz 0; p=2: 2=0 | Sound; Checks 1 and 5 agree. |
| (cD)^[p]=c^p·D^[p] | D=x∂, c∈k∖𝔽_p | (cx∂)^p(xⁿ)=c^p n xⁿ; wrong model c·D^[p] gives c n xⁿ ≠ since c^p≠c | Sound; c∈𝔽_p (e.g. c=2, p=3: 8≡2) would not discriminate. |
| ad(D^[p])=(ad D)^p | D=x∂, E=∂ | [x∂,∂]=−∂; (ad x∂)^p(∂)=(−1)^p∂=−∂ (p odd; p=2: ∂=−∂) | Sound. |
| Jacobson additivity | p=2, D=∂, E=x∂ | D^[2]+E^[2]+Λ₂=0+x∂+[x∂,∂]=x∂+∂; direct ((1+x)∂)^[2]=(1+x)²∂²+(1+x)∂=(1+x)∂ | Equal; dropping Λ₂ gives x∂, wrong. |
| Hochschild's formula | f=x, D=∂; f=x², D=∂, p=2 | x^p·0+(x∂)^{p−1}(x)∂=x∂; x⁴·0+(x²∂)(x²)∂=2x³∂=0, direct (x²∂)²(xⁿ)=n(n+1)x^{n+2}≡0 | Sound; Check 2 agrees. |
| Finite dimension for proper X | ℙ¹; 𝔸¹ | h⁰(T_{ℙ¹})=h⁰(O(2))=3={∂_t,t∂_t,t²∂_t}; Der k[x]=k[x]∂ infinite | Properness is needed; JacobianChallenge Layer B supplies it. |
| Existence of an additive or multiplicative field | ℙ¹×ℙ¹, D=t∂_t+c u∂_u; E=∂_t; φ(e₁)=e₂, φ(e₂)=0 | span{D,D^[p]}=span{t∂_t,u∂_u}, M=I, solutions of x_i^p=x_i: p²; φ(∂_t)=0, kernel; nilpotent φ is not diagonalizable but has kernel vector e₂ | Sound; the Jacobian of x_i^p−ΣN_ij x_j is −N, invertible, so the algebra is étale of rank p^n with p^n k-points. |
| Saturation is p-closed | 𝔸², D=x∂_y | (x∂_y)^[p]=x^p∂_y^p+(x∂_y)^{p−1}(x)∂_y=0; L=O∂_y, Δ={x=0}; ∂_y^[p]=0∈L; [aη,bη]=(aη(b)−bη(a))η∈L, so the map is additive mod L | Vanishes off Δ, the target is torsion-free, so it is zero. Sound. |
| Norm in case (b) | π finite locally free of rank p, unit u on Y | N(π^*u)=det(u·id on O^p)=u^p; π^*ω_Y≅O ⇒ ω_Y^p≅N(O_X)=O_Y | Sound; ModularCurves §2B supplies N. |
| (U) at p=2, case (a) | p−1=1, Δ≠0 | pullback lands in H⁰(X,O(−nΔ))=0 | Sound. |
| (U) at p=2, case (b) | K≡0 surfaces in char 2: classical, singular and supersingular Enriques; abelian; K3 | 12χ=e: χ=1, e=12; χ=0, e=0; χ=2, e=24; χ=1−q+p_g≤2 in all cases | Noether's bound e(Ỹ)≤24 holds at p=2. Sound. |
| (U) negative control | abelian surface A | h⁰(T_A)=2, c₂(T_A)=0, b₁(A)=4 vs b₁=0 forced by unirationality | The Example is correct; the K3 hypothesis is needed. |
| (i) in characteristic 0 | separable ℙ²⇢X | σ≠0 pulls back to a nonzero 2-form; h^{2,0}(blow-up of ℙ²)=0 | Vacuous, as stated; does not contradict ρ≤20. |
| Ogg in step 3 | K=k((t)), k perfect, char K=p | §5.3e hypotheses met; its Check: good reduction 0=0+1−1 | Sound. |
| Ownership of (U) at p=2 | this README `:24–28`, `:1017`; Part II `:9`, `:406` at c1d6da0 | K3Surfaces owns p=2; Part II owns "the characteristic-2 case of the reduction" | Two owners: R01. |
| Previous-round rows (L=O(Δ) split; plurigenera in (a); ruled base genus; ω_Y^p trivial; b_i≤0; nonzero plurigenus ⇒ b_i=0; (−2)-trees; Euler count; Noether bound; e(Y)=e(X); e(X)=24; Castelnuovo–Zariski hypotheses; gap generality; Part II slug wording) | as in PRREVIEW-K3Surfaces~7 | values as computed there (e.g. A₁: e(Ỹ)=25=24+1; (E₁+E₂)²=0; 12χ≤24) | Carried; only the norm sentence of (b) changed (row above). The Euler count still needs R02. |
| Statements untouched since 771182d (`IsAlgebraicK3` and its controls; double sextic; Theorem D cases with c₂ values 0, 12, 12, 12, 84, 36; Hodge diamond; twistor conic; strong Torelli; gluing iff; fixed loci; marking group; and the other rows) | as in the review at 771182d (56 rows) | values as computed there | Carried; no statement in these rows changed. |

## Not verifiable

- Rudakov–Šafarevič 1983, p.1502 (characteristic-3 pencil selection in sub-target (iv)): paywalled and recorded uncertified in the README; untouched by the diff.
- The board package has no `design/plan.json`, so I could not check whether `gap:integral-topology` and `gap:enriques-ruledness` are registered where the intake reads them.
- PCurvature is not yet in the merge order, and neither is its supplier GrothendieckNotesLemmas (#1431). Its other suppliers sit at lines 22, 23 and 43, before this roadmap's line 129. Whether the intake places it before line 129 could not be checked; the dependency check reports no problem.
- Ownership against open pull requests whose files this brief does not provide was checked only through `roadmaps grep` and `roadmaps show` at their heads.
- The manifest records of cited works other than Rudakov–Šafarevič 1976 (Martin v3, Gounelas–Liedtke) are in passages the diff leaves untouched and were not re-audited.

## Source issues

- **Gap** in rudakov-shafarevich-inseparable at §1, proof of Lemma 1, p.1206: the source says the p-th power map of the abelian p-subalgebra spanned by the iterates can be diagonalized; it should say only that it has an eigenvector: a nonzero kernel vector, or else a nonzero fixed vector; affects the proof.
