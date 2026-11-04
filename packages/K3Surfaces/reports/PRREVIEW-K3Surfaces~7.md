# Review of K3Surfaces (pull request #1285 at c11a7c4)
**Verdict:** accepted

Incremental re-review of 57 changed lines since ce64e9f. The previous findings are accounted for under `## Previous findings`; the changed passages (the Scope and ownership sentence, the SchemeAndStackFoundations and EtaleCohomologyFoundations supplier rows, the two gap contracts, §0.2 step 1 with its two-case unirationality route, the §0.2 *Needs:* line and Examples, the two new reference entries) were reviewed in full with their suppliers, sources and locators; the gate, the dependency check and the elaboration were run as in a full review. The three findings below are P3 notes; nothing blocks.

## R01 (P3) — The Euler-number count in §0.2 case (b) uses the connectedness of the exceptional fibres, which the *Needs:* line does not list

**Location:** `TauCetiRoadmap/K3Surfaces/README.md:200` ("negative definiteness makes each connected exceptional curve a tree of n_i such curves … gives e(Ỹ)=e(Y)+Σn_i") and the *Needs:* line at `:209–219`.

**Claim:** The identity e(Ỹ)=e(Y)+Σn_i computes e(Ỹ∖E)+Σ(n_i+1)=e(Y)−s+Σ(n_i+1) and needs the number s of singular points of Y to equal the number of connected components of the exceptional curve E, that is, that the fibre of the minimal resolution f:Ỹ→Y over each singular point is connected. That holds because Y is normal (f_*O_Ỹ=O_Y, so Zariski's connectedness theorem applies), and the owner of that theorem is SchemeAndStackFoundations §4.9 (`stein_factorization` and Zariski's connectedness, main `README.md:5472–5476`), which the supplier table lists (`:94`) but the §0.2 *Needs:* line does not; the sentence itself does not say why the components and the singular points correspond.

**Witness:** Rudakov–Šafarevič 1976, Theorem 5 (`rudakov-shafarevich-inseparable line 460`): "the reduced connected curves which are contracted to distinct singular points" is exactly this correspondence. Computed instance: Y with one A₁ point, f^{-1}(y) a single (−2)-curve: e(Ỹ)=e(Y)−1+2=e(Y)+1, n₁=1. A disconnected fibre over one point would add a second component without a second singular point and break the count.

**Exact repair:** In (b), after "each connected exceptional curve", add "one for each singular point of Y, since f_*O_Ỹ=O_Y for the normal Y and the fibres of f are connected by Zariski's connectedness theorem of SchemeAndStackFoundations §4.9"; add "§4.9 for the connectedness of the exceptional fibres" to the SchemeAndStackFoundations item of the §0.2 *Needs:* line.

## R02 (P3) — The new Rudakov–Šafarevič 1976 citation has no record in the roadmap's sources manifest

**Location:** `TauCetiRoadmap/K3Surfaces/README.md:200` ("Rudakov–Šafarevič 1976, Theorem 5 and Corollary 1, pp.1216–1217") and the reference entry at `:951–955`.

**Claim:** `packages/K3Surfaces/sources.toml` records `liedtke-surfaces` and `huybrechts-k3` only. The text is a legal copy (mathnet.ru, open repository) already cached under the Part II roadmap's manifest key `rudakov-shafarevich-inseparable`; the DOI 10.1070/IM1976v010n06ABEH001833 resolves (Crossref) to Rudakov–Šafarevič, Inseparable morphisms of algebraic surfaces, Math. USSR-Izv. 10 (1976), no. 6, 1205–1237, as the reference entry says. The locators were verified against that cached text (below). This review edits no manifest.

**Witness:** `rudakov-shafarevich-inseparable line 440` through 482 (Theorem 5 and Corollary 1, printed pp.1216–1217).

**Exact repair:** Record the work in `packages/K3Surfaces/sources.toml` (schema `tauceti-roadmap-sources/v1`) with the DOI and the mathnet.ru copy, `locator_scheme = "theorem"`, locator "§2, Theorem 5 and Corollary 1, pp.1216–1217", `cited_for = ["0.2"]`, status certified; the repair job that edits the manifest does this through the sources service.

## R03 (P3) — The ruledness gap asks for an unused converse

**Location:** `TauCetiRoadmap/K3Surfaces/README.md:130–140` ("conversely every birationally ruled surface has all plurigenera zero").

**Claim:** A declared gap is minimal: it asks for what this roadmap needs. §0.2 uses only the direction "all plurigenera zero ⇒ birationally ruled, with h¹(O)=g(C)=b₁/2"; the converse is never consumed (cases (a) and (b) both start from vanishing plurigenera). The rest of the `needs` sentence is precise, with its hypotheses (smooth projective surface, algebraically closed field of any characteristic, ℓ invertible) and a locator (Liedtke, Theorem 4.4, p.21, `liedtke-surfaces line 755` through 758, which states exactly h¹(S,O_S)=½b₁(S)=g(C)).

**Witness:** the only consumer sentence, `:200` "so every plurigenus of Ỹ is zero and Ỹ is birationally ruled … by Enriques' ruledness theorem"; the converse appears nowhere else in the README.

**Exact repair:** Delete the clause "conversely every birationally ruled surface has all plurigenera zero" from the contract (the supplier may still prove it; this roadmap does not request it).

## Previous findings

- R01 — repaired: `:200` now proves rationality of Y in two named cases: (a) Δ≠0, plurigenera of Ỹ vanish by the canonical-divisor formula, Ỹ is birationally ruled by the SchemeAndStackFoundations contract (gap:enriques-ruledness), b₁(Ỹ)≤b₁(X″)=b₁(X)=0 by ρ_*ρ^*=deg(ρ)·id, hence h¹(O_Ỹ)=0 and Castelnuovo–Zariski; (b) Δ=0, ω_Ỹ^p≃O(Σb_iE_i) with b_i≤0 by minimality and negative definiteness, a nonzero plurigenus forces K_Ỹ≡0, the exceptional curves are trees of (−2)-curves, e(Ỹ)=e(Y)+Σn_i with e(Y)=e(X)=24 by F.0.4, Noether gives e(Ỹ)≤24, so Y is smooth, Z=∅ and c₂(T_X)=0 against 24. Both cases are the Rudakov–Šafarevič route (Theorem 5) and agree with Huybrechts Proposition 9.4.6 (values in the table). The repair introduced the P3 note R01 above (the connected-fibre input), nothing blocking.
- R02 — repaired: `:122–126` reads "The Part II roadmap's contract under this slug is wider: it contains this comparison inside its first item, together with the exponential sequence and the connecting Chern class, which this roadmap takes from ComplexComparisonPartII C5.4, and an intersection adapter, which this roadmap does not request"; "one supplier announcement" is gone. This matches the Part II contract at its head 3d48a98 (`TauCetiRoadmap/K3SurfacesAndSymplecticBoundedness/README.md:202–206`: two items, the first the exponential sequence, the group isomorphism to H¹(M,Oˣ) with its laws and the connecting Chern class, the second the intersection adapter).
- R03 — repaired: `:23–25` reads "K0.A owns the vector-field unirationality reduction and the Picard-number theorem ρ(X)=22 for unirational K3 surfaces; the Part II roadmap consumes them." The Part II roadmap at its head still plans the reduction at its `:413`; that is its own finding to take, as the previous report said.

## Verified sound

Independent AI review, incremental at head `c11a7c40e3a2fcb4f6a3deda475c105f0742eb91` after the review at `ce64e9f`. The diff outside the folder is empty (`git diff --stat origin/main...HEAD` excluding the folder prints nothing); the folder holds `README.md`, `Suggested.lean` and `metadata.toml` only; `Suggested.lean` is byte-identical to the previous head. No repair report marks a finding "not actionable in this package". No fetched text contained an instruction.

**Gate.** The worker's gate at this head passed every check (`gate.md`, with `build=0`). I reran the brief's `gate … --base origin/main` on the worktree: every scanner 0 and `depcheck: NOT IN ORDER: K3Surfaces`, which is the plain gate's reading of a roadmap not yet in the merge order; the prescribed dependency check with the candidate merge order and the content checkout gives

```text
depcheck: 203 roadmaps, 1656 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The two new supplier citations resolve on main: EtaleCohomologyFoundations F.0.4 (`README.md:248–283`, étale topological invariance for every universal homeomorphism, cohomology included, "no Noetherian, finite-type or invertibility restriction") and F.2.5 (`:613–628`, compact-support cohomology with localization and the open–closed connecting map); SchemeAndStackFoundations §5.10 (`:7175–7186`, `adjunction` 2p_a−2=C·(C+K), surface Riemann–Roch, Noether 12χ=K²+deg c₂, Hodge index) is on main and earlier than every open roadmap. The gap's supplier SchemeAndStackFoundations is a main roadmap; no roadmap on main or at an open head owns Enriques' ruledness theorem (`roadmaps grep -i 'birationally ruled|ruledness|Bombieri.Mumford'`: NeronModelsAndSemistableAbelianVarietiesPartII #870 cites Bombieri–Mumford for its canonical-bundle formula, `:8893`, and its §6.1 Castelnuovo–Zariski target, `:9825–9826`, uses "a ruled surface with genus-zero base" inside its proof but does not state the ruledness theorem; the Part II roadmap declares different SchemeAndStackFoundations gaps, `ruled-surface-two-forms` and `matsusaka-mumford`, `:120–122`). The slug `enriques-ruledness` appears in no other README. The board package has no `design/plan.json` (it holds `reports` and `sources.toml`), so the slug cannot be registered there by the author; that is the intake's.

**Build and elaboration.** `lake build TauCetiRoadmap.K3Surfaces.Suggested` from the worktree: "Build completed successfully (9021 jobs)", exactly the two `declaration uses sorry` warnings (lines 51 and 74). The shared packages directory was at the manifest pins (Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf`, 8569 Mathlib oleans, no competing build). `lake env lean` on a scratch copy with `#check @` for the four declarations and each `sorry` replaced by `first | simp | rfl | infer_instance | sorry` exits 0 with the same two warnings: neither theorem closes in one tactic (no padding), and the elaborated types keep every binder: `IsAlgebraicK3` keeps `[Field k] [IsAlgClosed k] [X.Over (Spec k)]`; `algebraicK3_differential_vanishing` keeps `[CharP k p]`, `2 < p`, the structure morphism and `IsAlgebraicK3 k X`; `gluing_isometry_extension_iff` keeps both `IsNondegenerate` instances, `IsEven` for both lattices, the anti-isometry equation, the form and carrier equations and the pair of isometries. Imports are `import Mathlib` plus five `TauCeti.*` modules at the pin; no `set_option`, no sorry'd data, `theorem` throughout. Headline coverage and the docstring's list of unstatable headlines are as in the previous two reviews (unchanged file).

**Source sample at the changed passages.** Every new locator was opened in the cache (`liedtke-surfaces` page markers coincide with printed pages; `huybrechts-k3` likewise; `rudakov-shafarevich-inseparable` page 12 = printed 1216, page 13 = printed 1217).

| Target | Text opened; result |
| --- | --- |
| 0.2 step 1, minimal resolution by contraction | `liedtke-surfaces line 718` through 725 (Theorem 4.2, p.20): Castelnuovo contraction of a (−1)-curve on a smooth surface in any characteristic; blow-downs to a minimal surface. Matches. |
| 0.2 (a), resolution of indeterminacy | `liedtke-surfaces line 726` through 731 (§4.3, p.20): a rational map from a surface becomes a morphism after finitely many point blow-ups. Matches. |
| Gap contract, Enriques' theorem | `liedtke-surfaces line 755` through 758 (Theorem 4.4, p.21): κ=−∞ ⇔ birationally ruled, with h¹(S,O_S)=½b₁(S)=g(C); `line 934` through 936 (Theorem 6.1, p.25) restates it and attributes the positive-characteristic classification to Bombieri–Mumford (`line 929–931`). Matches the contract's statement and the equalities. |
| 0.2 (a), Castelnuovo–Zariski | `liedtke-surfaces line 770` through 774 (Theorem 4.6, p.21): rational ⇔ h¹(O)=P₂=0 ⇔ b₁=P₂=0. Matches the use through NeronModelsAndSemistableAbelianVarietiesPartII §6.1 (`:9825–9826` at #870, same equivalence). |
| 0.2 step 1, unirationality | `huybrechts-k3 line 6797` through 6845 (Proposition 9.4.6, pp.180–181): Y normal, Y smooth iff T_X/L locally free, Frobenius factors X→Y→X^(1), π^*ω_Y≃L^(−(p−1)) on the smooth locus; (H.L)>0 case by vanishing plurigenera and ruledness with rational base; L=O_X case by ω_Ỹ=O(Σa_iE_i), a_i≤0, and 22=b₂(X)=b₂(Y)≤b₂(Ỹ)≤22. The README's (a) is Huybrechts' first case with the Leray bound replaced by the b₁ bound; its (b) replaces the b₂ count by the Euler count. Both supported. |
| 0.2 step 1, primary source | `rudakov-shafarevich-inseparable line 440` through 480 (Theorem 5, pp.1216–1217): X^D rational; κ=−1 ruled with b₁(X)=0 forcing a rational base; κ=0 excluded by e(Y′)=e(Y)+Σn_i, e(Y)=e(X)=24 (radical morphism), trees of smooth rational curves with e(F_i)=n_i+1, e(Y′)≤24 for κ=0. `line 481` through 486 (Corollary 1): unirational. The README's route is this proof with the κ=0 enumeration replaced by Noether's bound. Matches. |
| 0.2 Examples (new paragraph) | Consistent with (b): rational double points give ω_Ỹ≃O_Ỹ (ω_Y invertible and trivial off finitely many points of the normal Y, f crepant), h⁰(ω_Ỹ²)=1; a singular Y gives e(Ỹ)=24+Σn_i>24 against 12χ(O_Ỹ)≤24 when K_Ỹ≡0. |
| References, Rudakov–Šafarevič 1976 | Crossref for DOI 10.1070/IM1976v010n06ABEH001833: Inseparable morphisms of algebraic surfaces, Math. USSR-Izv. 10 (1976) no. 6, 1205–1237. Matches the entry. |
| 0.1, 1.1, 2.1, 3.1, 4.1, 5.1, 5.2, 6.1, 6.2, 7.1, 7.2, 7.3 | Untouched by the diff; the checks of the previous reviews stand. |

**Adversarial table.** Rows for the changed statements carry computed values; rows for untouched statements are carried from the reviews at 771182d and ce64e9f (their tables, same instances and values).

| Statement | Instances tried | Values on the two sides | Result; change |
| --- | --- | --- | --- |
| L=O_X(Δ), Δ≥0 | derivation with divisorial zero D; nowhere-vanishing section | O_X→T_X saturates to O(D), Δ=D; Δ=0, L=O_X | The split (a)/(b) is Huybrechts' (H.L)>0 versus L=O_X: (H.Δ)>0 ⇔ Δ≠0. |
| (a) plurigenera of Ỹ | p=3, n=1, Δ≠0; Δ=0 control | section of ω_Ỹ pulls back to H⁰(X∖finite, O(−2Δ))=H⁰(X,O(−2Δ))=0 by Hartogs on smooth X; with Δ=0 the pullback lands in H⁰(O_X)=k≠0 | P_n(Ỹ)=0 exactly when Δ≠0; the Δ=0 control is why (b) exists. |
| (a) ruled base genus | Ỹ birational to C×ℙ¹, g(C)=g | h¹(O_Ỹ)=g, b₁(Ỹ)=2g; ρ_*ρ^*=p·id on H¹(Ỹ,ℚ_ℓ) injective since p≠0 in ℚ_ℓ; b₁(X″)=b₁(X)=0 (blow-ups add classes only in degree 2) | g=0, h¹(O_Ỹ)=0, P₂=0 ⇒ rational; sound. |
| (b) ω_Y^p trivial on Y_sm | π finite flat of degree p over Y_sm | N_π(π^*M)=M^p; π^*ω_Y≃O ⇒ ω_Y^p≃N_π(O)=O | Sound; pK_Ỹ∼Σb_iE_i since Pic(Ỹ)→Pic(Ỹ∖E) has kernel generated by the E_i. |
| (b) b_i≤0 | A₁ point: E²=−2, K·E=0, pK∼bE | (pK·E)=−2b≥0 ⇒ b≤0; (−1)-curve control: K·E=−1 would allow b>0 but minimality excludes it (adjunction: K·E<0, E²<0 forces E²=K·E=−1, p_a=0) | Negativity lemma: D·E_j≥0 for all j and negative definite ⇒ D≤0 (write D=A−B, A²=A·D+A·B≥0 ⇒ A=0). Sound. |
| (b) nonzero plurigenus ⇒ b_i=0 | mK∼G≥0, pG∼mΣb_iE_i with b_i≤0 | pG+(−mΣb_iE_i)∼0 effective ⇒ both zero ⇒ G=0, b_i=0 | K_Ỹ≡0; sound. |
| (b) exceptional curves | K·E=0, E²<0; two curves meeting twice; triangle of three | 2p_a−2=E² ⇒ p_a=0, E²=−2; (E₁+E₂)²=−4+4=0; (E₁+E₂+E₃)²=−6+6=0, both contradict negative definiteness | Trees of (−2)-curves meeting transversally at most once; e(tree of n)=2n−(n−1)=n+1 (A₂: 4−1=3). Sound. |
| (b) Euler count | Y with one A₁ point; smooth Y | e(Ỹ)=e(Y)−1+2=25; e(Ỹ)=24 | e(Ỹ)=e(Y)+Σn_i; needs one connected fibre per singular point (R01, P3). |
| (b) Noether bound | K_Ỹ≡0, h⁰(ω_Ỹ)≤1 (a numerically trivial divisor with a section is principal) | 12χ(O_Ỹ)=0+e(Ỹ); χ=1−q+p_g≤2 ⇒ e(Ỹ)≤24; with Σn_i≥1, e(Ỹ)≥25 | Contradiction unless Σn_i=0; then Y smooth, T_X/L≃I_Z locally free ⇒ Z=∅ (an ideal of a nonempty finite subscheme of a smooth surface is not invertible), 0→O→T_X→O→0 gives c(T_X)=1, c₂=0≠24. Sound. |
| e(Y)=e(X) | π purely inseparable of degree p | universal homeomorphism ⇒ étale sites equivalent (F.0.4) ⇒ all b_i equal, e(Y)=24 | Sound; F.0.4 has no finiteness restriction. |
| e(X)=24 in (i) | K3: b₀=b₄=1, b₁=b₃=0, b₂=22 | 1−0+22−0+1=24=deg c₂=12·2−0 | Carried; used in both (a) and (b) without unirationality. |
| Castelnuovo–Zariski hypotheses | ruled over genus g | q=g, P₂=0; rational iff g=0 | Carried from ce64e9f; now both inputs are supplied in (a). |
| Gap contract, generality | S=ℙ¹×C, g(C)=2; S a K3 | P_n=0, h¹(O)=2=b₁/2=4/2; P_n=1 for all n (not ruled) | The `needs` sentence separates ruled from non-ruled; the ℓ-adic b₁ is well defined for ℓ invertible. The converse clause is unused (R03). |
| Part II slug wording | the Part II contract at 3d48a98 | item 1: exponential sequence, Pic_hol≃H¹(Oˣ) with laws, connecting c₁; item 2: intersection adapter | The README's description "wider … contains this comparison inside its first item … and an intersection adapter" is exact. |
| Kummer and b₁; étale Gauss–Bonnet; π_*π^*=deg; cycle classes span; NS signature and isotropy; primitive isotropic class; reflection step; pencil from D₀; Fermat quartic Example; b₁=0 by the exponential sequence; gap contract laws | as in the review at ce64e9f | values as computed there | Carried; untouched by the diff. |
| Statements untouched since 771182d | `IsAlgebraicK3` and its negative controls; double sextic; contraction; Noether; K0.A binders and the Theorem D cases (c₂ values 0, 12, 12, 12, 84, 36); frame torsor, inverse, tensor/dual/pullback, Čech, exact segment, point and empty manifold; Hodge diamond; positive component; nef root wall; Monge–Ampère constant; quaternion signs; sphere of structures; σ normalisation; splitting exclusion; cup lattice; Kuranishi dimensions; constant family; first-order base; primitive polarization; period domain degenerate cases, positivity, rescaling, components, Hodge hyperplane; Pic=0 cone; twistor conic; generic W; two components; strong Torelli; reflection; Riemann–Roch at a root; ι and eigenlattices; discriminants and index; projections; graph gluing Checks; gluing iff and its anti-isometry hypothesis; clean formula; normal determinants; double sextic fixed locus; fixed-locus classification; free quotient; free/nodal loci; lifted curves; marking group | values as computed in the review at 771182d (its adversarial table, 56 rows) | Carried; no statement in these rows changed. |

**Library declarations opened at the pins** (Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf`): unchanged from the previous reviews; the Lean file is byte-identical, and the elaborated signatures above confirm every declaration still resolves at the pins.

**Ownership by object.** `roadmaps grep` for ruledness (above): this roadmap is the only one that declares the Enriques ruledness gap, and no roadmap builds the theorem; the Castelnuovo–Zariski criterion stays with NeronModelsAndSemistableAbelianVarietiesPartII §6.1; the vector-field reduction and ρ=22 are owned here by the ownership sentence (R03 of the previous report), with the Part II roadmap's restatement at its `:413` left to that roadmap. The gap's supplier is a main roadmap; the new EtaleCohomologyFoundations sections are on main; no new `*Needs:*` edge points at an open roadmap other than NeronModelsAndSemistableAbelianVarietiesPartII (earlier in the merge order, line 50 against this roadmap's line 123).

## Not verifiable

- Rudakov–Šafarevič 1983, p.1502 (the characteristic-3 smooth-generic-fibre selection in sub-target (iv)): paywalled, recorded uncertified in the README; untouched by the diff.
- Martin v3 and Gounelas–Liedtke: cited only in passages the diff leaves untouched; verified in the review at 771182d and not reopened.
- The board package has no `design/plan.json`, so whether `gap:integral-topology` and `gap:enriques-ruledness` are registered where the intake reads them could not be checked; the README states both in the required form with a named supplier.
- Ownership against open pull requests whose files this brief does not provide was checked only through `roadmaps grep` at their heads.

## Source issues

- none
