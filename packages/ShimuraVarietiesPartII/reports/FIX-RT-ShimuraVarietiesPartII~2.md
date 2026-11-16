# FIX-RT-ShimuraVarietiesPartII~2: repair of red-team round 2 (passes a and b)

Eight findings, two of them shared by both passes, settled in six sections. Every finding was
checked against the cached sources, the cited sibling roadmaps and the pins before any edit.
Files changed: `packages/ShimuraVarietiesPartII/README.md` and the `gaps` entry
`siegel-chain-moduli` of `packages/ShimuraVarietiesPartII/design/plan.json`. `Suggested.lean`,
`metadata.toml` and `sources.toml` are unchanged.

## RT-ShimuraVarietiesPartII~2a/F01, RT-ShimuraVarietiesPartII~2b/F01 (P1) — applied differently

**Verified.** Every compact open subgroup of GSp(V)(A_f^p) contains GSp(Z_ℓ′) for almost every ℓ′, and so contains the order-2 element that is −1 at ℓ′ and 1 elsewhere. No Siegel level is torsion-free, so "sufficiently small" was empty. HT itself asks only for a *neat* K′^p (HT line 698–699) and proves Lemma 1.3.6 by descent along a finite flat R′/R (HT line 771–773), not by torsion-freeness.

**Change.** Conventions: "neat and torsion-free (…)" → "neat in the adelic sense of PELModuli §M2.2", with no automorphisms (§M2.3), principal level N≥3 as an instance, no level torsion-free, and an existence argument. §1.6: the torsion-free inertia step → HT's descent of an R″-point through R″⊗_R R″.

Other occurrences repaired:
- AdelicAlgebraicGroups contract: the torsion-free sentence → the adelic sense.
- PELModuli contract: §§M2.2–M2.3 added.
- Scope: one clause added.
- §1.6 Remark: "torsion-free Siegel level" → "Neatness of the Siegel level".
- gap:siegel-chain-moduli (README and plan.json): "a neat prime-to-p level" → "neat in the adelic sense of PELModuli §M2.2".
- *Needs* of §0.1, §1.6 (both theorems) and the §1.7 Hodge-type theorem, and the Dependencies of Layers 0–1: PELModuli §§M2.2–M2.3 added.
- New Conventions Check: the element that is −1 at 7 and 1 elsewhere lies in level 3 and is neat; GL₂(Ẑ^p) is not neat.

**Why "differently".** Pass b's route is taken, except that it cited §M2.8 for "no automorphisms". That statement is §M2.3 (PELModuli at its open head: §M2.3 `noAutomorphisms_of_neat`; §M2.8 is representability). Pass a's narrower convention, containment in a principal congruence subgroup with a one-prime inertia argument, is not adopted. It is valid but narrower than HT's "neat". Its content is kept as the stated instance and the Check.

## RT-ShimuraVarietiesPartII~2a/F02, RT-ShimuraVarietiesPartII~2b/F02 (P2) — applied

**Verified.** DvHKZ Lemma 4.2.1 covers only parahoric levels of GSp (DvHKZ line 1458). PaRa24 §4.5.2 works at a self-dual periodic chain (PaRa24 lines 3591–3613), and so do KPZ Theorem 7.1.8 and Remark 7.1.9(b) (KPZ lines 3254–3274). Witness recomputed: take ψ(e₁,f₁)=1, ψ(e₂,f₂)=p² and Λ the span of e₁,f₁,e₂,f₂. Then M=Λ+pΛ^∨ is self-dual, and Λ is the inverse image in M of a nondegenerate plane. Its stabilizer is reductive of dimension 7, the same dimension as a Borel subgroup of GSp₄, but not solvable, so it contains no Borel subgroup. Hence the stabilizer of Λ is not quasi-parahoric.

**Change.** §1.7 Hodge-type sketch: "compare completions through the Siegel model at the level of the lattice or chain, which is canonical" → chain case by DvHKZ Lemma 4.2.1 and Theorem 4.1.8; single-lattice case through Zarhin's self-dual Λ_Z (same G-stabilizer; the Zarhin morphism is proper and quasi-finite, hence finite), so S_K=S′_K.

Also added: a §1.7 Check (GL₂×_(G_m)GL₂ with Λ^∨/Λ≅(Z/p²)²), a correction bullet for DvHKZ Theorem 4.2.3, the *Needs* and Layer 1 Dependencies, and the ASAM §A1.2 contract. The consumers §1.8, §3.9 and §5.1 are unchanged, because the statement is unchanged.

## RT-ShimuraVarietiesPartII~2a/F03 (P3) — applied

The building point of the §1.7 Definition is now z: "x a point of the extended building … model at x" → "z … model at z". In the functoriality theorem, "quasi-parahoric models at points x, x′" → "at points z, z′ of the extended buildings of G_Qp and G′_Qp". The letter x now denotes only points of S_K, in (d), in the sketches and in §1.8.

## RT-ShimuraVarietiesPartII~2b/F03 (P3) — applied

**Verified.** §3.3 assumes (D), while the §3.9 theorem works in the very-good setup without it. Finite étaleness of the relative normalization is DvHKZ Theorem 4.1.15 (line 1405–1411), already in §1.7. Topological invariance is EtaleCohomologyFoundations §F.0.4 (main, README line 486).

**Change.**
- "(as in §3.3)" → "(the relative normalization of the Hodge-type theorem of §1.7, finite étale over S_K; condition (D) of §3.3 is not assumed)".
- *Needs*: §3.3 → EtaleCohomologyFoundations §F.0.4.
- The new contract section "From TauCetiRoadmap.EtaleCohomologyFoundations" is added.
- The Layer 3 Dependencies are updated, and the sketch cites §F.0.4.

## RT-ShimuraVarietiesPartII~2b/F04 (P3) — applied

**Verified.** Axiom (a) holds only at pro-level and says nothing for DVRs of characteristic p, so "proper by (a)" was unsupported. DvHKZ argues by Zariski's main theorem plus surjectivity on F̄_p-points (DvHKZ line 1365–1381).

**Change.** "is proper by the extension property (a)" is deleted. "So the projection is an isomorphism" → the projection is quasi-finite and birational onto normal S_K, hence an open immersion. It is surjective: lift to O_F, note the prime-to-p tower is trivial over O_F, apply (a) for S′, and lift to the normalization. The locator is now DvHKZ pp.31–34.

## RT-ShimuraVarietiesPartII~2b/F05 (P3) — applied

**Verified.** DvHKZ (iv) quantifies over every algebraically closed field ℓ with k_E↪ℓ (DvHKZ line 1157–1158) and calls this stronger than PaRa24 (line 1460). Their uniqueness proof uses only F̄_p-points (line 1295, 1374).

**Change.** A sentence is added after the Definition's locator. It says that DvHKZ ask for (d) over every algebraically closed field of characteristic p, and that here (d) is asked at k-points, as in PaRa24. It also says that uniqueness and functoriality use only k-points, and that the Hodge-type theorem gives the stronger form (DvHKZ Theorem 4.1.8, p.30; Lemma 4.2.1, p.36).

## Checks run

- **Elaboration.** `lake env lean packages/ShimuraVarietiesPartII/Suggested.lean`, run from the content checkout, exits 0 with no output. The file is unchanged: one `import Mathlib`, one module docstring, an empty namespace, no declarations. With no names to `#check`, no scratch `#check` file was elaborated, so no elaborated signature could differ from the README.
- **Dependency check.** The brief's command prints:

      depcheck: 264 roadmaps, 2601 edges, 0 problem(s)

  No UPWARD, CYCLE or `moved:` line appears.
- **Citations.** `roadmaps resolve` on the README, against main 4dc1e15 and 458 open heads, finds no cross-roadmap citation and no Lean name missing. The new citations are PELModuli §§M2.2–M2.3 (open head), AbelianSchemesAndArithmeticModuli §A1.2 (main, line 769), EtaleCohomologyFoundations §F.0.4 (main, line 467) and PadicDifferentialEquationsAndRigidCohomology §RD.5.116 (already cited).
- **Gaps.** The gap slugs are unchanged at 22. Only the `needs` of `siegel-chain-moduli` changed, identically in plan.json and the README.
- **Gate failures.** None were listed for this job.

## Adversarial pass on new and changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Conventions: adelic neatness of Siegel levels | (−1 at 7, 1 elsewhere) in K(3), p=5; scalar −1; K(2) | eigenvalue group at 3 is {1}, so neat; Γ_ℓ={±1} for every ℓ, so not neat; −1≡1 mod 2, so K(2) is not neat | N≥3 needed; one prime suffices | stated, plus a Check |
| Principal level N≥3 is neat | N=3, 4, 6, 2^k | v₃(ζ₃−1)=1/2<1; v₂(i−1)=1/2<2 and −1≢1 mod 4; N=6 uses 3; every N≥3 has ℓ^k≥3 dividing N exactly | no root of unity ≡1 mod ℓ^k | stated |
| Existence of a sufficiently small level | X→Y→Z with X→Z a closed immersion and Y→Z finite | X→Y is a proper monomorphism, hence a closed immersion | holds | stated |
| §1.6 (iii)⇒(i), descent | F′=F; R″ with two maximal ideals; E: y²=x³+p at level K(3) | F′=F is (ii)⇒(i); conjugate valuations give good reduction at all maximal ideals of R″; rational 3-level forces E[3] unramified, so good reduction, contradicting additive reduction | no neat-level counterexample | sketch replaced |
| §1.6 Remark | GL₂(Ẑ^p), y²=x³+p, p≥5 | c₄=0, Δ=−16·27p², v_p(Δ)=2 | (iii) holds, (ii) fails at the non-neat level | wording |
| §1.7 Zarhin stabilizer | g∈GSp₄, gΛ=Λ | det g=c(g)², a unit, so c(g) is a unit and gΛ^∨=Λ^∨ | Stab_G(Λ_Z)=Stab_G(Λ) | stated |
| §1.7 new Check | ψ₁⊕p²ψ₂, M=Λ+pΛ^∨ | ψ(e₂/p,f₂/p)=1; pM=⟨pe₁,pf₁,e₂,f₂⟩⊂Λ; dim G(Sp₂×Sp₂)=7=dim B(GSp₄) | not quasi-parahoric | Check added |
| Zarhin morphism finite | elliptic E ↦ E⁸; self-dual Λ | properness: good reduction of E⁸ gives good reduction of E; Λ self-dual gives Λ_Z=(Λ⊕Λ)⁴, consistent with the §0.1 Check | proper and quasi-finite | stated |
| Functoriality, surjectivity | f=id; level change K^p⊂K′^p | graph closure equals the diagonal, resp. the graph of the level map | isomorphism | sketch replaced |
| (d) at k-points | ℓ=k versus ℓ=algebraic closure of k((t)) | DvHKZ's form implies this one; uniqueness uses only F̄_p-points (DvHKZ line 1295) | consistent | sentence added |
| §3.9 without (D) | very-good setup, π₀(G^fix)≠1 | DvHKZ Thm 4.1.15 gives finite étale with no (D) | consistent | wording and *Needs* |

## Ownership and sources

- Adelic neatness is owned by PELModuli §M2.2, the Zarhin trick by PadicDifferentialEquationsAndRigidCohomology §RD.5.116, rigidity by AbelianSchemesAndArithmeticModuli §A1.2 and topological invariance by EtaleCohomologyFoundations §F.0.4. All are cited, and none is restated.
- The finiteness of the Zarhin morphism of Siegel models appears only as a step of the §1.7 proof route, with its inputs named. Both reviews found no second owner of canonical integral models.
- Ownership against open pull requests was checked through the roadmaps tool for neatness and Siegel-level models.
- No new source was fetched and `sources.toml` is unchanged. Every locator added is in KZ, HT, KPZ, PaRa24 or DvHKZ, as cached.
- Nothing in the reviews was suspicious or instruction-like.

## For the maintainer

- No name that other roadmaps cite changed, and no section moved.
- gap:siegel-chain-moduli now asks ShimuraCompactifications for adelically neat prime-to-p levels, in the sense of PELModuli §M2.2.
- A correction bullet now records the DvHKZ Theorem 4.2.3 single-lattice issue that both passes reported.
- Main moved from fb3f1e1 to 4dc1e15 during the job, and citations were resolved at 4dc1e15.
