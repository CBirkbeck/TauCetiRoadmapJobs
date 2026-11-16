# FIX-PKG-ShimuraVarietiesPartII~12

Findings settled: the two findings of the review of round 11 (REV-PKG-ShimuraVarietiesPartII~11).

## REV-PKG-ShimuraVarietiesPartII~11/F01 (P2) — applied differently

Old: §4.1, §4.6 and §4.8 defined [b_x], the ordinary locus and I_x only on Hodge models. §§5.9, 5.10 and 6.3 and the last sentence of §4.7 used them on the model of a strongly acceptable triple (§3.8), which has no abelian scheme before §5.4. New: §5.4 now has a Construction (A_2 along the Siegel map of ι_2, tensors through N, the Layer 4 objects formed for ι_2) and a density Theorem (KZ Theorem 4.4.4). It has one combined *Needs:* line, three API bullets and three Checks. §4.7 loses the sentence and §3.6.

**Verification.** The finding is correct. `packages/ShimuraVarietiesPartII/README.md` §4.1 opens "For x on the geometric special fibre of the Hodge model". §4.8 needs an abelian fibre A_x. The model of §3.8 is glued from pieces of the auxiliary Hodge model (§3.6, KPZ line 3841–3847), so it has no abelian scheme until the Siegel map of §5.4. KZ makes the definition through a fixed ι_2: KZ line 1858–1872 (pullback of the universal abelian variety, tensors, lift-independence through the normalization of the image), line 1875–1885 (class, strata, ordinary locus), line 1897–1898 (I_x) and line 1887–1896 (Theorem 4.4.4).

**What differs from the proposed repair, and why.**

- The bullet proposed for the §5.4 API ("under j_1, j_2 of §5.5 … x_3 is ordinary exactly when x_2 is") would make §5.4 point forward to §5.5, and §5.5 already needs §5.4. It is now a sentence of the §5.5 theorem instead. That sentence adds BunGAndNewtonStrata §1.28 to the *Needs:* of §5.5 and the locator KZ §4.4.11, p.45, with Lemma 2.2.8, p.10 (KZ line 1997).
- The proposed construction says §§4.9–4.13 "hold with the same proofs", so §§4.9, 4.10, 4.11, 4.12 and 4.13 are listed in the *Needs:* of §5.4 too. The proposed list left them out.
- The *Needs:* of §5.4 also gets §2.1, for quasi-splitness. It gets §2.6 because the auxiliary model must have G^fix=G° for the component-specialization contract to apply. It gets ShimuraVarieties §5.6 for the reduction of special points.
- The proposed BunGAndNewtonStrata §1.28 goes to §5.5, where it is used.
- The theorem says the geometric special fibre is "normal, in particular locally integral". KZ Theorem 4.4.4(1) asserts normality, and its proof (KZ line 1890–1895) gives an integral local-model fibre with normal components. The proposed text said only "locally integral".
- The proposed third Check (A_1 defines ordinariness only on the image of j_2) relied on §5.5. In its place is a computed check: doubling ι_2 to ι_2⊕ι_2 leaves b_x unchanged, so the class lives in B(G_2), not in the Siegel group.
- The proposed second Check (the torus) is kept. It now also has the inert prime 3 as a negative control: the curve is supersingular there, but the triple is not strongly acceptable.
- The heading of §5.4 is now "Integral Siegel map, Newton strata and isogeny groups for a chosen Hodge embedding". The number is kept.

**Pattern repaired.** These are all the places that use the Newton class, the ordinary locus or I_x on a strongly acceptable model:

- §5.6: "with I_(x_2) formed as in §5.4"; §5.4 added to *Needs:*.
- §5.9 and §5.10: the statements now name ι_2 and "the ordinary locus formed for ι_2 (§5.4)"; §5.4 added to *Needs:*.
- §6.1, Check 2: "(§5.4, for the embedding on Q(i)²)".
- §6.3: "(§5.4, for a chosen Hodge embedding)"; §4.7 replaced by §5.4 in *Needs:* and in the Layer 6 Dependencies.
- §7.1: already needs §5.4. Its tensor-frame torsor now uses the étale tensors of the construction. No edit.
- §7.4: depends on the ordinary points through §5.10. No edit.
- The Layer 4 Dependencies lose §3.6; no other Layer 4 target cites it. The Layer 5 Dependencies gain §0.4, §0.5, §0.6, §1.9, §3.8, §3.10, §4.1, §4.2, §4.3, §4.4, §4.5, §4.8, §4.11, ShimuraVarieties §5.6 and ShimuraCompactifications Layer 7 (gap:component-specialization).
- "How to read the build" and "Scope and ownership" name the Layer 5 transport.
- The headline list (README "Scope and ownership", last paragraph) and the density item of the `Suggested.lean` docstring now name KZ Theorem 4.4.4 and §5.4 beside HT Corollary 1.3.16 and §4.7.
- `sources.toml`: HT and KPZ `cited_for` gain "§5.4".
- `design/plan.json` (top-level `gaps` only): `ShimuraVarietiesPartII:SV2.5/arbitrary-siegel-map` added to `neededBy` of gap:local-models and gap:component-specialization. No slug, `needs`, supplier or section changed. Both gaps are already declared, with matching README contracts.

## REV-PKG-ShimuraVarietiesPartII~11/F02 (P3) — applied

`sources.toml`, entry `KZ`, `cited_for`: `"§2.6", "§3.10"` → `"§2.6", "§3.8", "§3.10"`. I recomputed the sources section by section after all edits. The README sections citing KZ are §§0.1–0.4, 1.1–1.3, 1.9, 2.1, 2.6, 3.8, 3.10, 4.1, 4.6–4.8, 5.1–5.10, 6.1–6.3 and 7.1–7.6, which is exactly what the list covers. HT (now with §5.4), KPZ (now with §5.4), KP and K17 also match.

## Adversarial pass (new and changed statements)

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §5.4 Construction: the Siegel map factors through N | S_(K_2) normal and flat, generic fibre schematically dense; Z the closure of the image | A section of O_N over an affine U⊂Z is a function on V_η (V the preimage of U) that is integral over O(U), hence over O(V); V is normal, so the section lies in O(V) | holds (KZ line 1870–1872) | none |
| Same: lift-independence pulled back | two lifts x̃, x̃′ of x in S_(K_2)(O_K) | images in N are two lifts of the image of x; the tensors of A_2 come from N | holds | none |
| Same: "§§4.9–4.13 with the same proofs" | x·g_1=x·g_2 in S_(K_2) | images agree in the Siegel tower; the relating quasi-isogeny fixes the étale tensors (it intertwines the level structures) and the crystalline tensors (global on S_(K_2)) | holds; KZ line 1993 applies the Tate comparison to x_2 | §§4.9–4.13 added to *Needs:* |
| §5.4 Theorem, normality | GU(1,1), p=5, hyperspecial; Res_(Q(i)/Q)G_m, p=5 | smooth curve over F̄₅: normal. Finite reduced set of points: normal | holds; normal ⇒ local rings are domains ⇒ locally integral | "normal, in particular locally integral" |
| Same, openness | B(GL₂×G_m,{μ⁻¹}) for GU(1,1) at 5 | two classes, ordinary maximal; the ordinary locus is the complement of S_≤[basic], which is closed | open | none |
| Same, quasi-splitness | G_2 strongly acceptable | G_2^der,Qp is a product of Res of split groups ⇒ G_2^ad is quasi-split ⇒ G_2 is quasi-split (Borels correspond) | §4.5 applies | none |
| Same, density | GU(1,1) curve | each connected component over the completed maximal unramified extension is the image of an auxiliary piece with irreducible special fibre. G(Q) acts transitively on π₀(X), so every component of Sh_K(C) is [X_h^+,g′]. [h,g′] is quasi-isogenous to [h,g] with matching ℓ- and p-adic tensors, so it has the same class | ordinary in every component, so dense | none |
| Same, negative control: Iwahori level | Γ₀(5) crossing | k[[u,v]]/(uv) is not a domain | excluded: a strongly acceptable triple is very special (§2.1) | none |
| Check 1 (GU(1,1), Q(i), p=5) | −1≡4=2² mod 5; Z[i]⊗Z₅=Z₅×Z₅; different (2), prime to 5 | A_2[5^∞]=H×H∨ with ht H=2 and dim H=1 (signature (1,1)). Slopes (0,1): p-rank 1+1=2=dim A. Slopes (1/2,1/2): p-rank 0. G_2,Q5≅GL₂×G_m | both occur (§4.5) | new Check |
| Check 2 (torus, p=5) | form Tr(i·xȳ/2) on Z[i] | ψ(1,i)=Tr(1/2)=1; ψ(1,1)=ψ(i,i)=0, so unimodular. y²=x³+x over F₅: affine counts 1,0,1,1,0, #E=4, trace 2, prime to 5. (2y)²=4y²=−y² and (−x)³+(−x)=−(x³+x), so (x,y)↦(−x,2y) is an automorphism of order 4 | every point ordinary; B(T,{μ⁻¹}) is one class | new Check |
| Same, negative control at p=3 | y²=x³+x over F₃ | values of x³+x at 0,1,2: 0, 2 (not a square), 10≡1. Points 1+0+2, plus ∞, give 4; trace 0, supersingular. H¹(Q₃,T¹)=Q₃^×/N(Q₉^×)=Z/2 (norms from the unramified extension have even valuation), so T¹ is not induced | not strongly acceptable | recorded in Check 2 |
| Check 3 (ι_2⊕ι_2) | frame φ⊕φ on V_2∨⊕V_2∨ | Frobenius (ρ∨⊕ρ∨)(b_x)σ, same b_x; Siegel groups GSp₄ and GSp₈ for GU(1,1) | class in B(G_2) unchanged | new Check |
| §5.5 added sentence | frame of D(A_(3,x_3)) preserving the projection tensors | the frame is φ_1⊕φ_2, so b_3 ↦ b_i under G_3→G_i. G_3^der→G_1^der is an isomorphism and G_3^der→G_2^der a central isogeny | x_3, x_1 and x_2 are ordinary together (BunGAndNewtonStrata §1.28, read at its head) | new sentence and locator |
| §5.9 and §5.10 on the torus | ordinary locus = everything | I_x ⊇ T(Q)=Q(i)^×; every point is special; γ_0 lies in T(Q), elliptic since T(R)/R^×=U(1) is compact | statements hold | name ι_2 |
| §4.7 after the cut | Hodge models only | hypotheses: ordinary class, rational witness, local integrality. No longer refers to Layer 5 | consistent | sentence and §3.6 removed |

## Checks run

- `lake env lean packages/ShimuraVarietiesPartII/Suggested.lean`, run from the content checkout: exit 0, no output, 2.2 s. The file declares nothing (one module docstring, the namespace). The `#check @name` comparison therefore had 0 inputs: no declaration changed. The only Lean change is the docstring item on density. There is no `set_option`, no sorry'd data, and the only import is `import Mathlib`.
- Dependency check (the prescribed `gate --depcheck … --movable` command), exit 0:

  ```text
  depcheck: 257 roadmaps, 2452 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or `moved:` line. The only new supplier citations are ShimuraVarieties §5.6, ShimuraCompactifications Layer 7 and BunGAndNewtonStrata §1.28, all of which were already suppliers.
- `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere.
- Residue search over the added text (LaTeX delimiters, "optional", "so far", "current", "removed", round or review labels, machine paths, pull-request numbers): no hit.
- Gate failures: none were listed for this round.

## For the maintainer

- §5.4 has a new heading title; its number is kept. Per `scratch/overlaps.md` and the resolver, no other roadmap cites a section id of this roadmap, so no citation breaks.
- No new supplier gap. gap:component-specialization is used in §5.4 on the auxiliary Hodge model of §2.6, a Layer 0 model, which is within its stated `needs`. ShimuraCompactifications, which owns it, should know it now has a second consumer target (`SV2.5/arbitrary-siegel-map`).
- Ownership: the construction is KZ §4.4.1–4.4.5, specialized to models this roadmap owns (§3.8). I searched by object with `roadmaps grep` on main and at the open heads:
  - "Theorem 4.4.4": KZ's theorem is cited by no other roadmap. The hits are other sources' Theorem 4.4.4 (Česnavičius in ModularCurvesPartII, Boxer–Pilloni in ShimuraData and PerfectoidShimuraVarieties).
  - "strongly acceptable": found only in ReductiveGroupsPartIII, where it is an imported hypothesis, and in an unrelated sense in ArithmeticStatisticsPartIII and ArithmeticStatisticsPartV.

  This roadmap is therefore the owner.
- No source was fetched and no `needs-references.toml` was written. Every locator added (KZ §§4.4.1–4.4.5, 4.4.11, Theorem 4.4.4, Lemma 2.2.8; HT §1.3.5, Proposition 1.3.7, Corollary 1.3.16; KPZ §7.3.1(3)) was read in the cached texts at KZ line 1855–2031 and line 457, HT line 760–807 and line 915–925, and KPZ line 3820–3847.
